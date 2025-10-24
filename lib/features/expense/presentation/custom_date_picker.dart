import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:teatally/core/styles/text/txt.dart';

class CompactDatePicker extends StatefulWidget {
  final String name;
  final DateTime? initialValue;
  final bool enabled;
  final FormFieldValidator<DateTime>? validator;
  final ValueChanged<DateTime?>? onChanged;

  const CompactDatePicker({
    Key? key,
    required this.name,
    this.initialValue,
    this.enabled = true,
    this.validator,
    this.onChanged,
  }) : super(key: key);

  @override
  _CompactDatePickerState createState() => _CompactDatePickerState();
}

class _CompactDatePickerState extends State<CompactDatePicker> {
  @override
  Widget build(BuildContext context) {
    return FormBuilderField<DateTime>(
      name: widget.name,
      initialValue: widget.initialValue,
      enabled: widget.enabled,
      validator: widget.validator,
      onChanged: widget.onChanged,
      builder: (FormFieldState<DateTime> field) {
        return GestureDetector(
          onTap: () async {
            if (!widget.enabled) return;

            final selectedDate = await showDatePicker(
              context: context,
              initialDate: field.value ?? DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
            );

            if (selectedDate != null) {
              field.didChange(selectedDate);
            }
          },
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: field.hasError ? Colors.red : Colors.grey.shade300,
                width: 1,
              ),
              // borderRadius: BorderRadius.circular(12),
              color: widget.enabled ? Colors.white : Colors.grey.shade100,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Txt(
                  field.value != null
                      ? DateFormat('dd').format(field.value!)
                      : '',
                  style: TxtStyle.bodyMBold,
                ),
                Txt(
                  field.value != null
                      ? DateFormat(' MMM').format(field.value!)
                      : '',
                  style: TxtStyle.bodySSemiBold,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
