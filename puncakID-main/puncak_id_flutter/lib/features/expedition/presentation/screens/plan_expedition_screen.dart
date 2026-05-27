// ============================================================
// FILE    : lib/features/expedition/presentation/screens/plan_expedition_screen.dart
// FEATURE : Expedition
// PURPOSE : Form to create a hike plan for a specific mountain
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
import '../../../mountains/domain/providers/mountain_provider.dart';
import '../../domain/providers/expedition_provider.dart';

/// Plan expedition screen — form to create a hike plan.
///
/// Converted from PlanExpedition.jsx.
class PlanExpeditionScreen extends ConsumerStatefulWidget {
  final String mountainSlug;
  const PlanExpeditionScreen({super.key, required this.mountainSlug});

  @override
  ConsumerState<PlanExpeditionScreen> createState() =>
      _PlanExpeditionScreenState();
}

class _PlanExpeditionScreenState extends ConsumerState<PlanExpeditionScreen> {
  final _formKey = GlobalKey<FormState>();
  DateTime? _hikeDate;
  TimeOfDay? _arrivalTime;
  final _routeController = TextEditingController();
  final _numPeopleController = TextEditingController(text: '1');
  final _contactController = TextEditingController();
  String _socialPlatform = 'whatsapp';
  bool _isLoading = false;
  String? _error;

  @override
  void dispose() {
    _routeController.dispose();
    _numPeopleController.dispose();
    _contactController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    if (_hikeDate == null || _arrivalTime == null) {
      setState(() => _error = 'Please select date and time');
      return;
    }

    final mountain =
        ref.read(mountainDetailProvider(widget.mountainSlug)).valueOrNull;
    if (mountain == null) return;

    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      await ref.read(hikePlanListProvider.notifier).createPlan(
            mountainId: mountain.id,
            hikeDate: DateFormat('yyyy-MM-dd').format(_hikeDate!),
            arrivalTime:
                '${_arrivalTime!.hour.toString().padLeft(2, '0')}:${_arrivalTime!.minute.toString().padLeft(2, '0')}',
            routeVia: _routeController.text.trim(),
            numPeople: int.tryParse(_numPeopleController.text) ?? 1,
            socialPlatform: _socialPlatform,
            socialContact: _contactController.text.trim(),
          );

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Hike plan created successfully!')),
      );
      context.pop();
    } on ApiException catch (e) {
      setState(() => _error = e.message);
    } catch (e) {
      setState(() => _error = 'Failed to create plan. Try again.');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final mountainAsync =
        ref.watch(mountainDetailProvider(widget.mountainSlug));

    return Scaffold(
      appBar: AppBar(
        title: Text(
          mountainAsync.valueOrNull?.name ?? 'Plan Expedition',
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppConstants.kSpaceMd),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Plan Your Hike',
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: 8),
              Text('Fill in the details for your expedition.',
                  style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: AppConstants.kSpaceLg),

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

              // Date picker
              AppTextField(
                label: 'Hike Date',
                hint: _hikeDate != null
                    ? DateFormat('dd MMMM yyyy').format(_hikeDate!)
                    : 'Select date',
                prefixIcon: Icons.calendar_today_rounded,
                readOnly: true,
                onTap: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now().add(const Duration(days: 1)),
                    firstDate: DateTime.now(),
                    lastDate:
                        DateTime.now().add(const Duration(days: 365)),
                  );
                  if (date != null) setState(() => _hikeDate = date);
                },
              ),
              const SizedBox(height: AppConstants.kSpaceMd),

              // Time picker
              AppTextField(
                label: 'Arrival Time',
                hint: _arrivalTime != null
                    ? _arrivalTime!.format(context)
                    : 'Select time',
                prefixIcon: Icons.access_time_rounded,
                readOnly: true,
                onTap: () async {
                  final time = await showTimePicker(
                    context: context,
                    initialTime: const TimeOfDay(hour: 6, minute: 0),
                  );
                  if (time != null) setState(() => _arrivalTime = time);
                },
              ),
              const SizedBox(height: AppConstants.kSpaceMd),

              AppTextField(
                controller: _routeController,
                label: 'Route Via',
                hint: 'e.g., Cemoro Lawang',
                prefixIcon: Icons.route_rounded,
                validator: (v) =>
                    (v == null || v.isEmpty) ? 'Route is required' : null,
              ),
              const SizedBox(height: AppConstants.kSpaceMd),

              AppTextField(
                controller: _numPeopleController,
                label: 'Number of People',
                hint: '1',
                prefixIcon: Icons.group_outlined,
                keyboardType: TextInputType.number,
                validator: (v) => (v == null || v.isEmpty || int.tryParse(v) == null)
                    ? 'Enter a valid number'
                    : null,
              ),
              const SizedBox(height: AppConstants.kSpaceMd),

              // Social platform selector
              Text('CONTACT PLATFORM',
                  style: Theme.of(context).textTheme.labelSmall),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                children: AppConstants.kSocialPlatforms.map((p) {
                  final selected = _socialPlatform == p;
                  return ChoiceChip(
                    label: Text(p[0].toUpperCase() + p.substring(1)),
                    selected: selected,
                    onSelected: (_) =>
                        setState(() => _socialPlatform = p),
                    selectedColor:
                        AppConstants.kEmerald500.withValues(alpha: 0.2),
                  );
                }).toList(),
              ),
              const SizedBox(height: AppConstants.kSpaceMd),

              AppTextField(
                controller: _contactController,
                label: 'Contact',
                hint: 'Your phone number or username',
                prefixIcon: Icons.phone_outlined,
                validator: (v) =>
                    (v == null || v.isEmpty) ? 'Contact is required' : null,
              ),
              const SizedBox(height: AppConstants.kSpaceXl),

              AppButton(
                label: 'Create Hike Plan',
                icon: Icons.check_rounded,
                isLoading: _isLoading,
                onPressed: _submit,
              ),
              const SizedBox(height: AppConstants.kSpaceXl),
            ],
          ),
        ),
      ),
    );
  }
}
