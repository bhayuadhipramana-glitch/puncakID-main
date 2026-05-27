// ============================================================
// FILE    : lib/features/gear/presentation/screens/add_gear_screen.dart
// FEATURE : Gear
// PURPOSE : Form to add a new gear wishlist/savings item
// AUTHOR  : PuncakID Team
// ============================================================

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/network/api_exception.dart';
import '../../../../shared/widgets/app_button.dart';
import '../../../../shared/widgets/app_text_field.dart';
import '../../domain/providers/gear_provider.dart';

/// Add gear wishlist item screen.
///
/// Converted from AddGearTabungan.jsx.
class AddGearScreen extends ConsumerStatefulWidget {
  const AddGearScreen({super.key});

  @override
  ConsumerState<AddGearScreen> createState() => _AddGearScreenState();
}

class _AddGearScreenState extends ConsumerState<AddGearScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _savedController = TextEditingController(text: '0');
  final _linkController = TextEditingController();
  String _frequency = 'daily';
  DateTime? _targetDate;
  bool _isLoading = false;
  String? _error;

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _savedController.dispose();
    _linkController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      await ref.read(gearWishlistProvider.notifier).create(
            name: _nameController.text.trim(),
            targetPrice: int.tryParse(_priceController.text) ?? 0,
            savedAmount: int.tryParse(_savedController.text) ?? 0,
            storeLink: _linkController.text.isNotEmpty
                ? _linkController.text.trim()
                : null,
            frequency: _frequency,
            targetDate: _targetDate != null
                ? DateFormat('yyyy-MM-dd').format(_targetDate!)
                : null,
          );

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Gear item added!')),
      );
      context.pop();
    } on ApiException catch (e) {
      setState(() => _error = e.message);
    } catch (e) {
      setState(() => _error = 'Failed to add item. Try again.');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Gear Item')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppConstants.kSpaceMd),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (_error != null)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: AppConstants.kRed500.withValues(alpha: 0.1),
                    borderRadius:
                        BorderRadius.circular(AppConstants.kRadiusMd),
                    border: Border.all(
                      color: AppConstants.kRed500.withValues(alpha: 0.3),
                    ),
                  ),
                  child: Text(_error!,
                      style: const TextStyle(color: AppConstants.kRed400)),
                ),

              AppTextField(
                controller: _nameController,
                label: 'Gear Name',
                hint: 'e.g., Osprey Atmos 65',
                prefixIcon: Icons.backpack_outlined,
                validator: (v) =>
                    (v == null || v.isEmpty) ? 'Name is required' : null,
              ),
              const SizedBox(height: AppConstants.kSpaceMd),

              AppTextField(
                controller: _priceController,
                label: 'Target Price (Rp)',
                hint: '2500000',
                prefixIcon: Icons.payments_outlined,
                keyboardType: TextInputType.number,
                validator: (v) =>
                    (v == null || v.isEmpty) ? 'Price is required' : null,
              ),
              const SizedBox(height: AppConstants.kSpaceMd),

              AppTextField(
                controller: _savedController,
                label: 'Already Saved (Rp)',
                hint: '0',
                prefixIcon: Icons.savings_outlined,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: AppConstants.kSpaceMd),

              AppTextField(
                controller: _linkController,
                label: 'Store Link (Optional)',
                hint: 'https://...',
                prefixIcon: Icons.link_rounded,
                keyboardType: TextInputType.url,
              ),
              const SizedBox(height: AppConstants.kSpaceMd),

              Text('SAVINGS FREQUENCY',
                  style: Theme.of(context).textTheme.labelSmall),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                children: AppConstants.kGearFrequencies.map((f) {
                  final selected = _frequency == f;
                  return ChoiceChip(
                    label: Text(f[0].toUpperCase() + f.substring(1)),
                    selected: selected,
                    onSelected: (_) => setState(() => _frequency = f),
                    selectedColor:
                        AppConstants.kEmerald500.withValues(alpha: 0.2),
                  );
                }).toList(),
              ),
              const SizedBox(height: AppConstants.kSpaceMd),

              AppTextField(
                label: 'Target Date (Optional)',
                hint: _targetDate != null
                    ? DateFormat('dd MMMM yyyy').format(_targetDate!)
                    : 'Select date',
                prefixIcon: Icons.calendar_today_rounded,
                readOnly: true,
                onTap: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate:
                        DateTime.now().add(const Duration(days: 30)),
                    firstDate: DateTime.now(),
                    lastDate:
                        DateTime.now().add(const Duration(days: 365 * 3)),
                  );
                  if (date != null) setState(() => _targetDate = date);
                },
              ),
              const SizedBox(height: AppConstants.kSpaceXl),

              AppButton(
                label: 'Add Gear Item',
                icon: Icons.check_rounded,
                isLoading: _isLoading,
                onPressed: _submit,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
