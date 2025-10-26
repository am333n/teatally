import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:teatally/core/styles/text/txt.dart';
import 'package:teatally/core/widgets/common_widgets.dart';
import 'package:teatally/core/widgets/form_components.dart';
import 'package:teatally/features/group/application/cubit/group_detail_cubit.dart';
import 'package:teatally/features/group/domain/categories_model.dart';
import 'package:teatally/features/home/domain/group_model.dart';
import 'package:uuid/uuid.dart';

class PingMemebersDialog extends StatelessWidget {
  PingMemebersDialog({
    super.key,
    this.groupDetails,
  });
  final GroupModel? groupDetails;

  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Txt(
        'Ping Members',
        style: TxtStyle.headerSSemiBold,
      ),
      content: FormBuilder(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FormComponents.formBuilderTextField(context,
                fieldName: 'message',
                label: 'Message',
                hintText: 'Enter Message',
                isRequired: true),
            VerticalSpacing(15),
            CommonWidgets.coloredTextButton(context, text: 'Send',
                onPressed: () {
              final formState = _formKey.currentState;
              if (formState?.validate() ?? false) {
                final message = formState?.fields['message']?.value ?? '';
              }
            })
          ],
        ),
      ),
    );
  }
}
