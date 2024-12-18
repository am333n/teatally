// Flutter imports:

// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';
import 'package:teatally/core/styles/text/txt.dart';
import 'package:teatally/core/theme/application/cubit/theme_cubit.dart';
import 'package:teatally/core/theme/presentation/app_theme.dart';
import 'package:teatally/core/widgets/common_widgets.dart';

// Project imports:

class FormComponents {
  static Widget formBuilderDatePicker(BuildContext context,
      {required String fieldName,
      required String label,
      required String hintText,
      bool enabled = true,
      bool visible = true,
      DateTime? initialTime,
      double verticalPadding = 5}) {
    return CommonWidgets.doShowChildWidget(
      condition: visible,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: verticalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildFormLabel(label),
            FormBuilderDateTimePicker(
              enabled: enabled,
              name: fieldName,
              lastDate: DateTime(DateTime.now().year + 2),
              inputType: InputType.date,
              initialValue: initialTime ?? DateTime.now(),
              format: DateFormat('dd/MM/yyyy'),
              style: TextStyle(
                  fontSize: 14, color: context.theme.appColors.fontPrimary),
              decoration:
                  formFieldDecoration(context, hintText, readOnly: !(enabled)),
            )
          ],
        ),
      ),
    );
  }

  static Widget formBuilderTimePicker(BuildContext context,
      {required String fieldName,
      required String label,
      required String hintText,
      DateTime? initialTime,
      bool? enabled,
      double verticalPadding = 5}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildFormLabel(label),
        FormBuilderDateTimePicker(
          enabled: enabled ?? true,
          name: fieldName,
          inputType: InputType.time,
          initialValue: initialTime ?? DateTime.now(),
          format: DateFormat('hh:mm a'),
          style: TextStyle(
              fontSize: 14, color: activeTheme().appColors.fontPrimary),
          decoration: formFieldDecoration(context, hintText,
              readOnly: (enabled ?? true) ? false : true),
        )
      ],
    );
  }

  static Widget formBuilderDropDown(BuildContext context,
      {required String fieldName,
      required String label,
      required String hintText,
      String? initialValue,
      List<String>? items,
      double? menuHeight,
      bool? enabled,
      double verticalPadding = 5}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: verticalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildFormLabel(label),
          FormBuilderDropdown<String>(
            alignment: Alignment.center,
            isExpanded: true,
            isDense: true,
            name: fieldName,
            enabled: enabled ?? true,
            menuMaxHeight: menuHeight,
            dropdownColor: context.theme.appColors.backgroundSecondary,
            icon: Icon(Icons.keyboard_arrow_down,
                color: context.theme.appColors.primary),
            decoration: formFieldDecoration(
              context,
              hintText,
            ),
            initialValue: initialValue,
            items: (items ?? [])
                .map((item) => DropdownMenuItem(
                      alignment: AlignmentDirectional.center,
                      value: item,
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Txt(item, style: TxtStyle.bodyLRegular)),
                    ))
                .toList(),
          )
        ],
      ),
    );
  }

  static Widget formBuilderDropDownWithId(
    BuildContext context, {
    required String fieldName,
    required String label,
    required String hintText,
    bool? inAsyncCall,
    int? initialValue,
    Attached? attached,
    List<DropdownItem>? items,
    double? menuHeight,
    void Function(int?)? onChanged,
    bool? enabled,
    bool? isRequired,
    bool visible = true,
    double verticalPadding = 5,
  }) {
    return CommonWidgets.doShowChildWidget(
      condition: visible,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: verticalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildFormLabel(label),
            FormBuilderDropdown<int>(
              alignment: Alignment.bottomCenter,
              isExpanded: true,
              isDense: true,
              name: fieldName,
              validator: (isRequired ?? false)
                  ? FormBuilderValidators.required()
                  : null,
              onChanged: onChanged,
              enabled: enabled ?? true,
              menuMaxHeight: menuHeight,
              dropdownColor: context.theme.appColors.backgroundSecondary,
              icon: (inAsyncCall ?? false)
                  ? CupertinoActivityIndicator(
                      color: context.theme.appColors.primary)
                  : Icon(Icons.keyboard_arrow_down,
                      color: context.theme.appColors.primary),
              decoration: formFieldDecoration(context, hintText,
                  readOnly: !(enabled ?? true),
                  attached: attached ?? Attached.none),
              initialValue: initialValue,
              items: (items ?? [])
                  .map((item) => DropdownMenuItem<int>(
                        value: item.id, // Use item.id as the value
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Txt(
                            item.name,
                            style: TxtStyle.bodyLRegular,
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  static Widget fromBuilderCheckBox(
    BuildContext context, {
    required String fieldName,
    required String label,
    bool isRequired = false,
    bool visible = true,
    bool enabled = true,
    bool initialValue = false,
    double verticalPadding = 5,
    void Function(bool?)? onChanged, // New parameter for onChanged callback
  }) {
    return CommonWidgets.doShowChildWidget(
      condition: visible,
      child: FormBuilderField<bool>(
        enabled: enabled,
        name: fieldName,
        validator: isRequired ? FormBuilderValidators.required() : null,
        initialValue:
            initialValue, // Pass the initial value to the FormBuilderField
        builder: (FormFieldState field) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: verticalPadding),
            child: Row(
              children: [
                Checkbox(
                  side: BorderSide(
                      width: 1.2, color: context.theme.appColors.formBorder),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        2.0), // Adjust the radius as needed
                  ),
                  activeColor: context.theme.appColors.primary,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  visualDensity:
                      const VisualDensity(horizontal: -4, vertical: -4),
                  value: field.value ??
                      initialValue, // Use the initial value if field value is null
                  onChanged: (value) {
                    onChanged?.call(value);
                    field.didChange(value);
                  }, // Use onChanged callback if provided, else use default behavior
                ),
                const HorizontalSpacing(5),
                _buildLabelTextStyle(label),
              ],
            ),
          );
        },
      ),
    );
  }

  static Column buildFormLabel(String label) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 2.0),
          child: _buildLabelTextStyle(label),
        ),
        const SizedBox(
          height: 5,
        ),
      ],
    );
  }

  static Txt _buildLabelTextStyle(String label) {
    return Txt(label.toUpperCase(), style: TxtStyle.bodyMRegular);
  }

  static Widget formBuilderTextField(BuildContext context,
      {required String fieldName,
      required String label,
      required String hintText,
      Function(String?)? onChanged,
      bool? isRequired,
      bool visible = true,
      dynamic Function(String?)? valueTransformer,
      List<TextInputFormatter>? inputFormatters,
      Attached attached = Attached.none,
      FocusNode? focusNode,
      bool isRichText = false,
      void Function(PointerDownEvent)? onTapOutside,
      TextEditingController? controller,
      String? initialValue,
      Widget? suffixIcon,
      bool? enabled,
      TextInputType textInputType = TextInputType.text,
      List<FormFieldValidator<String>>? validators,
      double verticalPadding = 5}) {
    return CommonWidgets.doShowChildWidget(
      condition: visible,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: verticalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonWidgets.doShowChildWidget(
              condition: (label.isNotEmpty || label != ""),
              child: buildFormLabel(label),
            ),
            FormBuilderTextField(
              focusNode: focusNode,
              readOnly: ((enabled ?? true) == true ? false : true),
              onTapOutside: (_) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              controller: controller,
              inputFormatters: inputFormatters,
              name: fieldName,
              maxLines: isRichText ? null : 1,
              minLines: isRichText ? 3 : 1,
              initialValue: initialValue,
              decoration: formFieldDecoration(
                context,
                hintText,
                readOnly: ((enabled ?? true) == true ? false : true),
                suffixIcon: suffixIcon,
                haveMaxlines: isRichText,
                attached: attached,
              ),
              keyboardType:
                  isRichText ? TextInputType.multiline : textInputType,
              onChanged: onChanged,
              valueTransformer: valueTransformer,
              validator: validators != null
                  ? FormBuilderValidators.compose(validators)
                  : (isRequired ?? false)
                      ? FormBuilderValidators.required()
                      : null,
            ),
          ],
        ),
      ),
    );
  }

  static Widget formBuilderCheckBoxGroup<T>(BuildContext context,
      {required List<FormBuilderFieldOption<T>> options,
      List<T>? initialValue,
      Key? key,
      void Function(List<T>?)? onChanged,
      void Function(List<T>?)? onSaved,
      String? Function(List<T>?)? validator,
      required String fieldName}) {
    //todo set scroll overflow color to primary color
    return FormBuilderCheckboxGroup(
      key: key,
      name: fieldName,
      options: options,
      activeColor: context.theme.appColors.primary,
      onChanged: onChanged,
      onSaved: onSaved,
      initialValue: initialValue,
      validator: validator,
      orientation: OptionsOrientation.vertical,
      decoration: const InputDecoration(
        constraints: BoxConstraints(minHeight: 50),
        contentPadding: EdgeInsets.zero,
        border: InputBorder.none,
        disabledBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
      ),
    );
  }

  static InputDecoration formFieldDecoration(
    BuildContext context,
    String hintText, {
    bool haveMaxlines = false,
    Widget? suffixIcon,
    bool? readOnly,
    Attached attached = Attached.none,
  }) {
    final borderColor = context.theme.appColors.formBorder;
    return InputDecoration(
      suffixIcon: suffixIcon,
      hintText: hintText,
      filled: true,
      fillColor: (readOnly ?? false)
          ? borderColor.withOpacity(0.5)
          : context.theme.appColors.formBackground,
      hintStyle: TextStyle(
          fontSize: 14,
          color: context.theme.appColors.fontSecondary.withOpacity(0.5)),
      contentPadding:
          EdgeInsets.symmetric(horizontal: 8, vertical: haveMaxlines ? 8 : 0),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      border: _defaultBorderDecoration(
          borderColor: borderColor, attached: attached),
      focusedBorder: _defaultBorderDecoration(
          borderColor: borderColor, attached: attached),
      enabledBorder: _defaultBorderDecoration(
          borderColor: borderColor, attached: attached),
      errorBorder: _defaultBorderDecoration(
          borderColor: context.theme.appColors.danger, attached: attached),
    );
  }

  static OutlineInputBorder _defaultBorderDecoration({
    required Color borderColor,
    Attached attached = Attached.none,
  }) {
    return OutlineInputBorder(
      borderRadius: getBorderRadius(attached),
      borderSide: BorderSide(
        color: borderColor,
        style: BorderStyle.solid,
        width: 1.0,
      ),
    );
  }

  static BorderRadius getBorderRadius(Attached attached) {
    const Map<Attached, BorderRadius> borderRadiusMap = {
      Attached.right: BorderRadius.only(
        topLeft: Radius.circular(5),
        bottomLeft: Radius.circular(5),
      ),
      Attached.left: BorderRadius.only(
        topRight: Radius.circular(5),
        bottomRight: Radius.circular(5),
      ),
      Attached.bottom: BorderRadius.only(
        topRight: Radius.circular(5),
        topLeft: Radius.circular(5),
      ),
      Attached.top: BorderRadius.only(
        bottomLeft: Radius.circular(5),
        bottomRight: Radius.circular(5),
      ),
      Attached.none: BorderRadius.all(Radius.circular(5)),
    };
    return borderRadiusMap[attached] ??
        const BorderRadius.all(Radius.circular(5));
  }
}

class DropdownItem {
  final int id;
  final String name;

  DropdownItem(this.id, this.name);
}

enum Attached { right, left, top, bottom, none }
