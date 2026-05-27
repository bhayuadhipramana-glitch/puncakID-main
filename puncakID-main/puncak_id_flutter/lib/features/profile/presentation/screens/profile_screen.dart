// ============================================================
// FILE    : lib/features/profile/presentation/screens/profile_screen.dart
// FEATURE : Profile
// PURPOSE : User profile with photos, edit profile, upload photo
// AUTHOR  : PuncakID Team
// ============================================================

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/api_constants.dart';
import '../../../../core/network/api_exception.dart';
import '../../../../shared/widgets/error_view.dart';
import '../../../../shared/widgets/loading_overlay.dart';
import '../../../../shared/widgets/app_text_field.dart';
import '../../../auth/domain/providers/auth_provider.dart';
import '../../data/repositories/profile_repository.dart';
import '../../domain/providers/profile_provider.dart';

/// Profile screen with user info, photo gallery, and edit capabilities.
///
/// Converted from Profile.jsx.
class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  bool _isUploading = false;

  Future<void> _uploadPhoto() async {
    final user = ref.read(authStateProvider).valueOrNull;
    if (user == null) return;

    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) return;

    setState(() => _isUploading = true);

    try {
      // For simplicity, use mountainId 1 — in production this should be selectable
      await ref.read(profileRepositoryProvider).uploadPhoto(
            mountainId: 1,
            imagePath: image.path,
          );
      ref.invalidate(userPhotosProvider(user.id));
    } on ApiException catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.message)));
      }
    } finally {
      if (mounted) setState(() => _isUploading = false);
    }
  }

  void _showEditDialog() {
    final user = ref.read(authStateProvider).valueOrNull;
    if (user == null) return;

    final nameController = TextEditingController(text: user.name);
    final nicknameController = TextEditingController(text: user.nickname ?? '');
    final bioController = TextEditingController(text: user.bio ?? '');

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppConstants.kSlate900,
      builder: (ctx) => Padding(
        padding: EdgeInsets.fromLTRB(
            16, 24, 16, MediaQuery.of(ctx).viewInsets.bottom + 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Edit Profile',
                style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 16),
            AppTextField(
                controller: nameController,
                label: 'Name',
                prefixIcon: Icons.person_outlined),
            const SizedBox(height: 12),
            AppTextField(
                controller: nicknameController,
                label: 'Nickname',
                prefixIcon: Icons.badge_outlined),
            const SizedBox(height: 12),
            AppTextField(
                controller: bioController,
                label: 'Bio',
                prefixIcon: Icons.info_outlined,
                maxLines: 3),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  try {
                    await ref.read(profileRepositoryProvider).updateProfile(
                          name: nameController.text.trim(),
                          nickname: nicknameController.text.trim(),
                          bio: bioController.text.trim(),
                        );
                    ref.read(authStateProvider.notifier).refreshUser();
                    if (ctx.mounted) Navigator.pop(ctx);
                  } on ApiException catch (e) {
                    if (ctx.mounted) {
                      ScaffoldMessenger.of(ctx)
                          .showSnackBar(SnackBar(content: Text(e.message)));
                    }
                  }
                },
                child: const Text('Save Changes'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final userAsync = ref.watch(authStateProvider);

    return Scaffold(
      body: LoadingOverlay(
        isLoading: _isUploading,
        child: userAsync.when(
          loading: () => const LoadingIndicator(),
          error: (e, _) => ErrorView(message: e.toString()),
          data: (user) {
            if (user == null) {
              return const Center(child: Text('Not logged in'));
            }

            final photosAsync = ref.watch(userPhotosProvider(user.id));

            return CustomScrollView(
              slivers: [
                // Profile header
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(AppConstants.kSpaceMd),
                    child: SafeArea(
                      child: Column(
                        children: [
                          const SizedBox(height: 16),
                          // Avatar
                          Container(
                            width: 88,
                            height: 88,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: const LinearGradient(
                                colors: [
                                  AppConstants.kEmerald500,
                                  AppConstants.kAmber500,
                                ],
                              ),
                              border: Border.all(
                                color: AppConstants.kSlate950,
                                width: 3,
                              ),
                            ),
                            child: user.avatarUrl != null
                                ? ClipOval(
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          '${ApiConstants.kBaseUrl.replaceAll('/api', '')}${user.avatarUrl}',
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : Center(
                                    child: Text(
                                      user.name[0].toUpperCase(),
                                      style: const TextStyle(
                                        fontSize: 32,
                                        fontWeight: FontWeight.w800,
                                        color: AppConstants.kWhite,
                                      ),
                                    ),
                                  ),
                          ),
                          const SizedBox(height: 12),
                          Text(user.nickname ?? user.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium),
                          if (user.bio != null)
                            Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Text(user.bio!,
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall),
                            ),
                          const SizedBox(height: 16),
                          // Action buttons
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              OutlinedButton.icon(
                                onPressed: _showEditDialog,
                                icon: const Icon(Icons.edit_outlined,
                                    size: 16),
                                label: const Text('Edit Profile'),
                              ),
                              const SizedBox(width: 8),
                              OutlinedButton.icon(
                                onPressed: () => context.go('/settings'),
                                icon: const Icon(Icons.settings_outlined,
                                    size: 16),
                                label: const Text('Settings'),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          ElevatedButton.icon(
                            onPressed: _uploadPhoto,
                            icon:
                                const Icon(Icons.add_a_photo_outlined, size: 16),
                            label: const Text('Upload Photo'),
                          ),
                          const SizedBox(height: 16),
                          // Logout
                          TextButton.icon(
                            onPressed: () async {
                              await ref
                                  .read(authStateProvider.notifier)
                                  .logout();
                              if (context.mounted) context.go('/');
                            },
                            icon: Icon(Icons.logout_rounded,
                                size: 16, color: AppConstants.kRed400),
                            label: Text('Logout',
                                style: TextStyle(
                                    color: AppConstants.kRed400)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Photos section header
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppConstants.kSpaceMd),
                    child: Text('My Photos',
                        style: Theme.of(context).textTheme.titleLarge),
                  ),
                ),

                // Photo grid
                photosAsync.when(
                  loading: () => const SliverToBoxAdapter(
                    child: LoadingIndicator(),
                  ),
                  error: (e, _) => SliverToBoxAdapter(
                    child: ErrorView(message: e.toString()),
                  ),
                  data: (photos) {
                    if (photos.isEmpty) {
                      return const SliverToBoxAdapter(
                        child: EmptyView(
                          message: 'No photos yet.',
                          icon: Icons.photo_library_outlined,
                        ),
                      );
                    }

                    return SliverPadding(
                      padding: const EdgeInsets.all(AppConstants.kSpaceMd),
                      sliver: SliverGrid(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 4,
                          mainAxisSpacing: 4,
                        ),
                        delegate: SliverChildBuilderDelegate(
                          (_, i) {
                            final p = photos[i];
                            final url = p.imageUrl.startsWith('http')
                                ? p.imageUrl
                                : '${ApiConstants.kBaseUrl.replaceAll('/api', '')}${p.imageUrl}';
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: CachedNetworkImage(
                                imageUrl: url,
                                fit: BoxFit.cover,
                              ),
                            );
                          },
                          childCount: photos.length,
                        ),
                      ),
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
