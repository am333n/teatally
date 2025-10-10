import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teatally/core/app_colors.dart';
import 'package:teatally/core/styles/text/txt.dart';
import 'package:teatally/features/auth/infrastructure/credential_storage.dart';
import 'package:teatally/features/group/application/cubit/group_detail_cubit.dart';
import 'package:teatally/features/group/domain/item_model.dart';
import 'package:teatally/features/group/domain/session_model.dart';

class CounterButton extends StatefulWidget {
  const CounterButton({
    super.key,
    required this.item,
    required this.selectedItems,
  });

  final ItemModel? item;
  final List<SelectedItem>? selectedItems;

  @override
  _CounterButtonState createState() => _CounterButtonState();
}

class _CounterButtonState extends State<CounterButton> {
  String? _currentUserUid;

  @override
  void initState() {
    super.initState();
    _fetchUserId(); // Fetch the user ID once during widget initialization
  }

  Future<void> _fetchUserId() async {
    final currentUserUid = await CredentialStorage.getUid();
    setState(() {
      _currentUserUid = currentUserUid; // Store the user ID in the state
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (_currentUserUid == null) {
      // Show a loading indicator or placeholder if the user UID is not yet fetched
      return CircularProgressIndicator();
    }

    // Find the selected item based on item UID
    final selectedItem = widget.selectedItems?.firstWhere(
      (selectedItem) => selectedItem.itemUid == widget.item?.uid,
      orElse: () => const SelectedItem(
        itemUid: '',
        itemName: '',
        itemPrice: 0,
        totalCount: 0,
        selections: [],
      ),
    );

    // Find the user's selection for the current item
    final userSelection = selectedItem?.selections?.firstWhere(
      (selection) => selection.userUid == _currentUserUid,
      orElse: () => Selection(userUid: '', count: 0),
    );

    final itemCount = userSelection?.count ?? 0;

    return Container(
      width: size.width * 0.35,
      margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppIconButton(
              icon: Icons.remove,
              onPressed: () {
                if (itemCount != 0) {
                  context
                      .read<GroupDetailCubit>()
                      .incrementOrDecrementItemCount(
                          widget.item?.name,
                          widget.item?.uid,
                          widget.item?.groupId,
                          widget.item?.price,
                          widget.item?.categoryId,
                          false);
                }
              }),
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: itemCount > 0
                  ? AppColors.black
                  : AppColors.white.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Txt(
              itemCount.toString(),
              style: TxtStyle.bodyLBold,
              color: itemCount > 0
                  ? AppColors.white
                  : AppColors.black.withOpacity(0.3),
            ),
          ),
          AppIconButton(
              icon: Icons.add,
              onPressed: () {
                context.read<GroupDetailCubit>().incrementOrDecrementItemCount(
                    widget.item?.name,
                    widget.item?.uid,
                    widget.item?.groupId,
                    widget.item?.price,
                    widget.item?.categoryId,
                    true);
              })
        ],
      ),
    );
  }
}

class AppIconButton extends StatelessWidget {
  const AppIconButton({super.key, required this.icon, required this.onPressed});
  final IconData icon;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            shape: BoxShape.circle, color: AppColors.grey.withOpacity(0.5)),
        child: Icon(
          icon,
          color: AppColors.black,
        ),
      ),
    );
  }
}
