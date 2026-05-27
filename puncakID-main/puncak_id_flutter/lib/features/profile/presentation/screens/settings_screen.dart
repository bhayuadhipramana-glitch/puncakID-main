// ============================================================
// FILE    : lib/features/profile/presentation/screens/settings_screen.dart
// FEATURE : Profile / Settings
// PURPOSE : Change password and app settings
// AUTHOR  : PuncakID Team
// ============================================================

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/network/api_exception.dart';
import '../../../../shared/widgets/app_button.dart';
import '../../../../shared/widgets/app_text_field.dart';
import '../../data/repositories/profile_repository.dart';

/// Settings screen with password change form.
///
/// Converted from Settings.jsx.
class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  final _formKey = GlobalKey<FormState>();
  final _currentController = TextEditingController();
  final _newController = TextEditingController();
  final _confirmController = TextEditingController();
  bool _isLoading = false;
  String? _error;
  String? _success;

  @override
  void dispose() {
    _currentController.dispose();
    _newController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  Future<void> _changePassword() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
      _error = null;
      _success = null;
    });

    try {
      await ref.read(profileRepositoryProvider).updatePassword(
            currentPassword: _currentController.text,
            password: _newController.text,
            passwordConfirmation: _confirmController.text,
          );
      setState(() => _success = 'Password updated successfully!');
      _currentController.clear();
      _newController.clear();
      _confirmController.clear();
    } on ApiException catch (e) {
      setState(() => _error = e.message);
    } catch (e) {
      setState(() => _error = 'Failed to update password.');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppConstants.kSpaceMd),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('ACCOUNT',
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: AppConstants.kAmber500,
                        letterSpacing: 3,
                      )),
              const SizedBox(height: 4),
              Text('Settings',
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: AppConstants.kSpaceXl),

              // Change Password section
              Text('Change Password',
                  style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: AppConstants.kSpaceMd),

              if (_error != null)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: AppConstants.kRed500.withValues(alpha: 0.1),
                    borderRadius:
                        BorderRadius.circular(AppConstants.kRadiusMd),
                  ),
                  child: Text(_error!,
                      style: const TextStyle(color: AppConstants.kRed400)),
                ),

              if (_success != null)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: AppConstants.kEmerald500.withValues(alpha: 0.1),
                    borderRadius:
                        BorderRadius.circular(AppConstants.kRadiusMd),
                  ),
                  child: Text(_success!,
                      style:
                          const TextStyle(color: AppConstants.kEmerald400)),
                ),

              Form(
                key: _formKey,
                child: Column(
                  children: [
                    AppTextField(
                      controller: _currentController,
                      label: 'Current Password',
                      hint: '••••••••',
                      prefixIcon: Icons.lock_outlined,
                      obscureText: true,
                      validator: (v) => (v == null || v.isEmpty)
                          ? 'Current password is required'
                          : null,
                    ),
                    const SizedBox(height: AppConstants.kSpaceMd),
                    AppTextField(
                      controller: _newController,
                      label: 'New Password',
                      hint: '••••••••',
                      prefixIcon: Icons.lock_outlined,
                      obscureText: true,
                      validator: (v) {
                        if (v == null || v.isEmpty) {
                          return 'New password is required';
                        }
                        if (v.length < 8) {
                          return 'Must be at least 8 characters';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: AppConstants.kSpaceMd),
                    AppTextField(
                      controller: _confirmController,
                      label: 'Confirm New Password',
                      hint: '••••••••',
                      prefixIcon: Icons.lock_outlined,
                      obscureText: true,
                      validator: (v) {
                        if (v != _newController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: AppConstants.kSpaceXl),
                    AppButton(
                      label: 'Update Password',
                      icon: Icons.check_rounded,
                      isLoading: _isLoading,
                      onPressed: _changePassword,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
