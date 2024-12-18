import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:teatally/core/widgets/app_card.dart';
import 'package:teatally/core/widgets/color_picker.dart';
import 'package:teatally/core/widgets/common_widgets.dart';
import 'package:teatally/core/widgets/form_components.dart';
import 'package:teatally/features/auth/infrastructure/credential_storage.dart';
import 'package:teatally/features/home/application/home_page_cubit.dart';
import 'package:teatally/features/home/domain/group_model.dart';
import 'package:teatally/features/home/domain/users_model.dart';
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

  @override
  void initState() {
    super.initState();

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
      child: AppCardWithTitle(
        title: 'Add Group',
        action: const CloseButton(),
        foregroundColor: foregroundColor,
        children: [
          FormBuilder(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Group Name Field
                  FormComponents.formBuilderTextField(context,
                      fieldName: 'name',
                      label: 'Group Name',
                      hintText: 'Enter group name',
                      isRequired: true),
                  FormComponents.formBuilderTextField(context,
                      fieldName: 'desc',
                      label: 'Description',
                      hintText: 'Enter group description',
                      isRichText: true),
                  ColorPickerWidget(onColorSelected: (colorCode, color) {
                    setState(() {
                      foregroundColor = color;
                    });
                  }),
                  FormComponents.formBuilderTextField(
                    context,
                    fieldName: '',
                    label: '',
                    hintText: 'Search users',
                    controller: _searchController,
                  ),
                  const SizedBox(height: 16),
                  // Display Selected Users
                  if (_selectedUsers.isNotEmpty)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Selected Users:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Wrap(
                          spacing: 8.0,
                          children: _selectedUsers.map((user) {
                            return Chip(
                              label: Text(user?.displayName ?? 'Unknown'),
                              onDeleted: () {
                                setState(() {
                                  _selectedUsers.remove(user);
                                });
                              },
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  // Display Suggestions
                  if (_searchQuery.isNotEmpty)
                    Column(
                      children: _getSuggestions(_searchQuery).map((user) {
                        final isSelected = _selectedUsers.contains(user);
                        return ListTile(
                          title: Text(user?.displayName ?? 'No Name'),
                          subtitle: Text(user?.email ?? 'No Email'),
                          trailing: isSelected
                              ? const Icon(Icons.check, color: Colors.green)
                              : IconButton(
                                  icon: const Icon(Icons.add),
                                  onPressed: () {
                                    setState(() {
                                      _selectedUsers.add(user);
                                    });
                                  },
                                ),
                        );
                      }).toList(),
                    ),
                  CommonWidgets.coloredTextButton(context, text: 'Create',
                      onPressed: () async {
                    final formState = _formKey.currentState;
                    final currentUser = await CredentialStorage.getUid();
                    var selectedMemebers =
                        _selectedUsers.map((user) => user!.uid).toList();
                    selectedMemebers.add(currentUser ?? '');
                    if ((formState?.validate() ?? false) &&
                        selectedMemebers.isNotEmpty) {
                      var uuid = Uuid();
                      final groupData = GroupModel(
                          uid: uuid.v1(),
                          name: formState?.fields['name']?.value,
                          description: formState?.fields['desc']?.value,
                          createdBy: currentUser ?? '',
                          createdAt: DateTime.now(),
                          updatedAt: DateTime.now(),
                          members: selectedMemebers,
                          admin: currentUser ?? '',
                          icon: '',
                          color: '');
                      await context
                          .read<HomePageCubit>()
                          .createGroup(groupData);
                    }
                  })
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<UserModel?> _getSuggestions(String query) {
    final allSuggestions = widget.users ?? [];

    if (query.isEmpty) {
      return allSuggestions;
    }

    return allSuggestions.where((suggestion) {
      final emailMatch =
          suggestion?.email.toLowerCase().contains(query.toLowerCase()) ??
              false;
      return emailMatch;
    }).toList();
  }
}
