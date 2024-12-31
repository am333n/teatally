import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:teatally/core/router/router.dart';
import 'package:teatally/core/styles/text/txt.dart';
import 'package:teatally/core/styles/text/txt_styles.dart';
import 'package:teatally/core/theme/presentation/app_theme.dart';
import 'package:teatally/core/widgets/app_card.dart';
import 'package:teatally/features/home/presentation/components/add%20group/components/color_picker.dart';
import 'package:teatally/core/widgets/common_widgets.dart';
import 'package:teatally/core/widgets/form_components.dart';
import 'package:teatally/features/auth/infrastructure/credential_storage.dart';
import 'package:teatally/features/home/application/home_page_cubit.dart';
import 'package:teatally/features/home/domain/group_model.dart';
import 'package:teatally/features/home/domain/users_model.dart';
import 'package:teatally/features/home/presentation/components/add%20group/components/form_builder_color_picker.dart';
import 'package:teatally/features/home/presentation/components/add%20group/components/form_builder_icon_picker.dart';
import 'package:teatally/features/home/presentation/components/add%20group/components/group_icon_display.dart';
import 'package:teatally/features/home/presentation/components/add%20group/components/icon_mapper.dart';
import 'package:teatally/features/home/presentation/components/add%20group/components/icon_picker.dart';
import 'package:uuid/uuid.dart';

class AddGroupDialog extends StatefulWidget {
  AddGroupDialog({super.key, required this.users});
  final List<UserModel?>? users;

  @override
  State<AddGroupDialog> createState() => _AddGroupDialogState();
}

class _AddGroupDialogState extends State<AddGroupDialog> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  final TextEditingController _searchController = TextEditingController();
  final List<UserModel?> _selectedUsers = [];
  String _searchQuery = '';
  Color? foregroundColor;
  String? _selectedIcon;

  @override
  void initState() {
    super.initState();
    _selectedIcon = IconMapper.defaultIcon;
    // Add listener to update search query
    _searchController.addListener(() {
      setState(() {
        _searchQuery = _searchController.text;
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: FormBuilder(
        key: _formKey,
        child: Container(
          // color: Colors.amber,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // VerticalSpacing(200),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Txt(
                    'Add Group',
                    style: TxtStyle.headerMSemiBold,
                  ),
                  CloseButton()
                ],
              ),
              const VerticalSpacing(15),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 1,
                    child: GroupIconDisplay(
                      iconCode: _selectedIcon,
                    ),
                  ),
                  const HorizontalSpacing(10),
                  Expanded(
                    flex: 5,
                    child: FormComponents.formBuilderTextField(context,
                        fieldName: 'name',
                        label: '',
                        hintText: 'Enter group name',
                        isRequired: true),
                  ),
                ],
              ),
              FormComponents.formBuilderTextField(context,
                  fieldName: 'desc',
                  label: 'Description',
                  hintText: 'Enter group description',
                  isRichText: true),
              const VerticalSpacing(15),
              FormComponents.buildFormLabel('Group Icon'),
              FormBuilderIconPicker(
                  name: 'icon',
                  onIconSelected: (iconCode) {
                    setState(() {
                      _selectedIcon = iconCode;
                    });
                  }),
              const VerticalSpacing(15),
              FormComponents.buildFormLabel('Search users'),
              Expanded(child: _buildUserSearchBox(context)),

              const VerticalSpacing(15),

              Container(
                color: Theme.of(context).appColors.backgroundSecondary,
                child: CommonWidgets.coloredTextButton(context, text: 'Create',
                    onPressed: () async {
                  final formState = _formKey.currentState;
                  final currentUser = await CredentialStorage.getUid();
                  var selectedMemebers =
                      _selectedUsers.map((user) => user!.uid).toList();
                  selectedMemebers.add(currentUser ?? '');
                  if ((formState?.validate() ?? false) &&
                      selectedMemebers.isNotEmpty) {
                    var uuid = const Uuid();
                    final groupData = GroupModel(
                        uid: uuid.v1(),
                        name: formState?.fields['name']?.value,
                        description: formState?.fields['desc']?.value,
                        createdBy: currentUser ?? '',
                        createdAt: DateTime.now(),
                        updatedAt: DateTime.now(),
                        members: selectedMemebers,
                        admin: currentUser ?? '',
                        icon: formState?.fields['icon']?.value,
                        color: formState?.fields['color']?.value,
                        isPinned: false);
                    if (!context.mounted) return;
                    await context.read<HomePageCubit>().createGroup(groupData);
                    AutoRouter.of(context).maybePop();
                  }
                }),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container _buildUserSearchBox(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Theme.of(context).appColors.formBorder)),
      child: Column(
        children: [
          SearchBar(
              controller: _searchController,
              hintText: 'Search Users',
              leading: Icon(
                Icons.search,
                color:
                    Theme.of(context).appColors.fontSecondary.withOpacity(0.5),
              ),
              hintStyle: WidgetStateProperty.all(TextStyles.getTextStyle(
                context,
                TxtStyle.bodyLRegular,
                color:
                    Theme.of(context).appColors.fontSecondary.withOpacity(0.5),
              )),
              elevation: WidgetStateProperty.all(0),
              shape: WidgetStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15))),
              backgroundColor: WidgetStateProperty.all(
                Theme.of(context).appColors.formBackground,
              )),
          if (_selectedUsers.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 8, right: 8),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Txt('Selected Users:',
                            style: TxtStyle.bodyLRegular),
                        Wrap(
                          spacing: 8.0,
                          runSpacing: 8,
                          children: _selectedUsers.map((user) {
                            return Chip(
                              label: Txt(user?.displayName ?? 'Unknown'),
                              onDeleted: () {
                                setState(() {
                                  _selectedUsers.remove(user);
                                });
                              },
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          if (_searchQuery.isNotEmpty)
            Expanded(
              child: ListView(shrinkWrap: true, children: [
                ..._getSuggestions(_searchQuery).map((user) {
                  final isSelected = _selectedUsers.contains(user);
                  return ListTile(
                      title: Text(user?.displayName ?? 'No Name'),
                      subtitle: Text(user?.email ?? 'No Email'),
                      trailing: IconButton(
                        onPressed: isSelected
                            ? () {
                                setState(() {
                                  if (_selectedUsers.contains(user)) {
                                    _selectedUsers.remove(user);
                                  }
                                });
                              }
                            : () {
                                setState(() {
                                  _selectedUsers.add(user);
                                });
                              },
                        icon: isSelected
                            ? Icon(Icons.check,
                                color: Theme.of(context).appColors.primary)
                            : const Icon(Icons.add),
                      ));
                }),
              ]),
            ),
        ],
      ),
    );
  }

  List<UserModel?> _getSuggestions(String query) {
    final allSuggestions = widget.users ?? [];

    // Only proceed if the query contains the '@' symbol
    if (!query.contains('@')) {
      return [];
    }

    return allSuggestions.where((suggestion) {
      final emailMatch =
          suggestion?.email.toLowerCase().contains(query.toLowerCase()) ??
              false;
      return emailMatch;
    }).toList();
  }
}
