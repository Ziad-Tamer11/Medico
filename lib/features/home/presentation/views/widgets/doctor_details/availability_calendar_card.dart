import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medico/core/utils/app_colors.dart';
import 'package:medico/core/utils/app_text_styles.dart';
import 'package:medico/features/home/presentation/views/widgets/doctor_details/availability_calendar.dart';

enum _CalendarTab { days, months }

// One bordered card with two switchable tabs, Days and Months, each
// showing its options as a grid instead of a popup. A month tap jumps
// back to the Days tab so the newly relevant days are immediately
// visible. The border turns red when [hasError] is set, so a failed
// "Book Appointment" attempt can flag this card directly.
class AvailabilityCalendarCard extends StatefulWidget {
  const AvailabilityCalendarCard({
    super.key,
    required this.months,
    required this.selectedMonth,
    required this.onMonthSelected,
    required this.days,
    required this.selectedDate,
    required this.onDateSelected,
    required this.hasError,
  });

  final List<AvailabilityMonth> months;
  final DateTime? selectedMonth;
  final ValueChanged<DateTime> onMonthSelected;
  final List<AvailabilityDay> days;
  final DateTime? selectedDate;
  final ValueChanged<DateTime> onDateSelected;
  final bool hasError;

  @override
  State<AvailabilityCalendarCard> createState() =>
      _AvailabilityCalendarCardState();
}

class _AvailabilityCalendarCardState extends State<AvailabilityCalendarCard> {
  _CalendarTab _activeTab = _CalendarTab.days;

  bool _isSameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(
          color: widget.hasError ? AppColor.red : AppColor.veryLightGrey,
          width: widget.hasError ? 1.4 : 1,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: _TabHeader(
                  label: 'Days',
                  isActive: _activeTab == _CalendarTab.days,
                  onTap: () => setState(() => _activeTab = _CalendarTab.days),
                ),
              ),
              Expanded(
                child: _TabHeader(
                  label: 'Months',
                  isActive: _activeTab == _CalendarTab.months,
                  onTap: () =>
                      setState(() => _activeTab = _CalendarTab.months),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          if (_activeTab == _CalendarTab.days)
            _OptionsGrid<AvailabilityDay>(
              items: widget.days,
              labelBuilder: (day) => '${day.date.day}',
              isEnabled: (day) => day.hasAvailability,
              isSelected: (day) =>
                  widget.selectedDate != null &&
                  _isSameDay(widget.selectedDate!, day.date),
              onSelected: (day) => widget.onDateSelected(day.date),
            )
          else
            _OptionsGrid<AvailabilityMonth>(
              items: widget.months,
              labelBuilder: (month) => DateFormat(
                'MMM',
              ).format(DateTime(month.year, month.month)),
              isEnabled: (month) => month.hasAvailability,
              isSelected: (month) =>
                  widget.selectedMonth != null &&
                  widget.selectedMonth!.year == month.year &&
                  widget.selectedMonth!.month == month.month,
              onSelected: (month) {
                widget.onMonthSelected(DateTime(month.year, month.month));
                setState(() => _activeTab = _CalendarTab.days);
              },
            ),
        ],
      ),
    );
  }
}

class _TabHeader extends StatelessWidget {
  const _TabHeader({
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  final String label;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 2,
              color: isActive ? AppColor.primary : Colors.transparent,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: TextStyles.font16SemiBold.copyWith(
                color: isActive ? AppColor.black : AppColor.blueGrey,
              ),
            ),
            const SizedBox(width: 2),
            Icon(
              isActive
                  ? Icons.keyboard_arrow_left_rounded
                  : Icons.keyboard_arrow_down_rounded,
              size: 20,
              color: isActive ? AppColor.black : AppColor.blueGrey,
            ),
          ],
        ),
      ),
    );
  }
}

class _OptionsGrid<T> extends StatelessWidget {
  const _OptionsGrid({
    super.key,
    required this.items,
    required this.labelBuilder,
    required this.isEnabled,
    required this.isSelected,
    required this.onSelected,
  });

  final List<T> items;
  final String Function(T item) labelBuilder;
  final bool Function(T item) isEnabled;
  final bool Function(T item) isSelected;
  final ValueChanged<T> onSelected;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        for (final item in items)
          _OptionChip(
            label: labelBuilder(item),
            enabled: isEnabled(item),
            selected: isSelected(item),
            onTap: () => onSelected(item),
          ),
      ],
    );
  }
}

class _OptionChip extends StatelessWidget {
  const _OptionChip({
    required this.label,
    required this.enabled,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool enabled;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isActive = selected && enabled;
    return GestureDetector(
      onTap: enabled ? onTap : null,
      child: Container(
        constraints: const BoxConstraints(minWidth: 40, minHeight: 40),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isActive ? AppColor.primary : AppColor.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isActive ? AppColor.primary : AppColor.veryLightGrey,
          ),
        ),
        child: Text(
          label,
          style: TextStyles.font14SemiBold.copyWith(
            color: !enabled
                ? AppColor.blueGrey
                : isActive
                ? AppColor.white
                : AppColor.black,
          ),
        ),
      ),
    );
  }
}
