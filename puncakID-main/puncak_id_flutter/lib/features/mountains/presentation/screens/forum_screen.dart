// ============================================================
// FILE    : lib/features/mountains/presentation/screens/forum_screen.dart
// FEATURE : Mountains / Forum
// PURPOSE : Forum threads and replies for a specific mountain
// AUTHOR  : PuncakID Team
// ============================================================

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/network/api_exception.dart';
import '../../../../shared/widgets/error_view.dart';
import '../../../../shared/widgets/loading_overlay.dart';
import '../../../auth/domain/providers/auth_provider.dart';
import '../../data/models/forum_thread_model.dart';
import '../../data/repositories/forum_repository.dart';
import '../../domain/providers/forum_provider.dart';

/// Forum screen with thread list and inline reply view.
///
/// Converted from ForumDiskusi.jsx.
class ForumScreen extends ConsumerStatefulWidget {
  final String mountainSlug;
  const ForumScreen({super.key, required this.mountainSlug});

  @override
  ConsumerState<ForumScreen> createState() => _ForumScreenState();
}

class _ForumScreenState extends ConsumerState<ForumScreen> {
  ForumThreadModel? _selectedThread;
  final _titleController = TextEditingController();
  final _bodyController = TextEditingController();
  final _replyController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _bodyController.dispose();
    _replyController.dispose();
    super.dispose();
  }

  Future<void> _createThread() async {
    if (_titleController.text.isEmpty || _bodyController.text.isEmpty) return;
    final isLoggedIn = ref.read(isLoggedInProvider);
    if (!isLoggedIn) return;

    try {
      await ref.read(forumRepositoryProvider).createThread(
            mountainSlug: widget.mountainSlug,
            title: _titleController.text.trim(),
            body: _bodyController.text.trim(),
          );
      _titleController.clear();
      _bodyController.clear();
      ref.invalidate(forumThreadsProvider(widget.mountainSlug));
      if (mounted) Navigator.of(context).pop();
    } on ApiException catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.message)));
      }
    }
  }

  Future<void> _createReply(int threadId) async {
    if (_replyController.text.isEmpty) return;
    try {
      await ref.read(forumRepositoryProvider).createReply(
            threadId: threadId,
            body: _replyController.text.trim(),
          );
      _replyController.clear();
      ref.invalidate(forumRepliesProvider(threadId));
    } on ApiException catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.message)));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final threadsAsync = ref.watch(forumThreadsProvider(widget.mountainSlug));
    final isLoggedIn = ref.watch(isLoggedInProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Forum Discussion')),
      floatingActionButton: isLoggedIn
          ? FloatingActionButton(
              onPressed: () => _showCreateThreadDialog(),
              child: const Icon(Icons.add_rounded),
            )
          : null,
      body: _selectedThread != null
          ? _buildRepliesView()
          : threadsAsync.when(
              loading: () => const LoadingIndicator(),
              error: (e, _) => ErrorView(
                message: e.toString(),
                onRetry: () =>
                    ref.invalidate(forumThreadsProvider(widget.mountainSlug)),
              ),
              data: (threads) {
                if (threads.isEmpty) {
                  return const EmptyView(
                    message: 'No discussions yet.',
                    subtitle: 'Start the conversation!',
                    icon: Icons.forum_outlined,
                  );
                }
                return ListView.builder(
                  padding: const EdgeInsets.all(AppConstants.kSpaceMd),
                  itemCount: threads.length,
                  itemBuilder: (context, i) {
                    final t = threads[i];
                    return GestureDetector(
                      onTap: () => setState(() => _selectedThread = t),
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppConstants.kSlate900,
                          borderRadius:
                              BorderRadius.circular(AppConstants.kRadiusMd),
                          border: Border.all(color: AppConstants.kWhite05),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(t.title,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: AppConstants.kSlate300)),
                            const SizedBox(height: 4),
                            Text(t.body,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 13,
                                    color: AppConstants.kSlate500)),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Text(
                                  t.user?.name ?? 'Anonymous',
                                  style: const TextStyle(
                                      fontSize: 11,
                                      color: AppConstants.kEmerald400),
                                ),
                                const Spacer(),
                                if (t.createdAt != null)
                                  Text(
                                    DateFormat.yMd().format(t.createdAt!),
                                    style: const TextStyle(
                                        fontSize: 10,
                                        color: AppConstants.kSlate600),
                                  ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }

  Widget _buildRepliesView() {
    final thread = _selectedThread!;
    final repliesAsync = ref.watch(forumRepliesProvider(thread.id));
    final isLoggedIn = ref.watch(isLoggedInProvider);

    return Column(
      children: [
        // Back button + thread info
        Container(
          padding: const EdgeInsets.all(16),
          color: AppConstants.kSlate900,
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_rounded),
                onPressed: () => setState(() => _selectedThread = null),
              ),
              Expanded(
                child: Text(thread.title,
                    style: const TextStyle(fontWeight: FontWeight.w700)),
              ),
            ],
          ),
        ),
        // Replies list
        Expanded(
          child: repliesAsync.when(
            loading: () => const LoadingIndicator(),
            error: (e, _) => ErrorView(message: e.toString()),
            data: (replies) => ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: replies.length,
              itemBuilder: (context, i) {
                final r = replies[i];
                return Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppConstants.kSlate800,
                    borderRadius:
                        BorderRadius.circular(AppConstants.kRadiusSm),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(r.user?.name ?? 'Anonymous',
                          style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: AppConstants.kEmerald400)),
                      const SizedBox(height: 4),
                      Text(r.body,
                          style: const TextStyle(
                              fontSize: 13, color: AppConstants.kSlate300)),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
        // Reply input
        if (isLoggedIn)
          Container(
            padding: const EdgeInsets.all(12),
            color: AppConstants.kSlate900,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _replyController,
                    decoration: const InputDecoration(
                      hintText: 'Write a reply...',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 12),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => _createReply(thread.id),
                  icon: const Icon(Icons.send_rounded,
                      color: AppConstants.kEmerald500),
                ),
              ],
            ),
          ),
      ],
    );
  }

  void _showCreateThreadDialog() {
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
            Text('New Thread',
                style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 16),
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(hintText: 'Thread title'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _bodyController,
              maxLines: 4,
              decoration: const InputDecoration(hintText: 'Write your post...'),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _createThread,
                child: const Text('Post Thread'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
