import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:teatally/core/app_colors.dart';
import 'package:teatally/core/styles/text/txt.dart';
import 'package:teatally/features/group/domain/group_details_state_model.dart';
import 'package:teatally/features/group/domain/item_model.dart';
import 'package:teatally/features/group/domain/session_model.dart';
import 'package:teatally/features/group/presentation/components/item%20display/components/profile_and_count_display.dart';
import 'package:teatally/features/home/domain/users_model.dart';

class MemberSelectionsDisplay extends StatelessWidget {
  const MemberSelectionsDisplay({
    super.key,
    required this.session,
    this.item,
    required this.members,
  });

  final SessionModel? session;
  final List<UserModel>? members;
  final ItemModel? item;

  @override
  Widget build(BuildContext context) {
    if (item == null) {
      return const SizedBox.shrink();
      // return Text('No item selected');
    }

    // Find the selected item in the session
    final selectedItem = session?.selectedItems?.firstWhere(
      (selectedItem) => selectedItem.itemUid == item?.uid,
      orElse: () => const SelectedItem(
        itemUid: '',
        itemName: '',
        totalCount: 0,
        selections: [],
      ),
    );

    // Map the member selections to the new data class
    final memberSelections = selectedItem?.selections
        ?.where((selection) =>
            members?.any((member) => member.uid == selection.userUid) ?? false)
        .map((selection) {
      // final member = loadedStateData.members!.firstWhere(
      //   (m) => m.uid == selection.userUid,
      // );
      return selection;
      // return MemberItemSelection(
      //   userId: member.uid,
      //   displayName: member.displayName,
      //   photoUrl: member.photoURL,
      //   itemCount: selection.count ?? 0,
      // );
    }).toList();

    if (memberSelections == null || memberSelections.isEmpty) {
      return const SizedBox.shrink();
      // return Text('No members have selected this item');
    }
    return ProfileAndCountDisplay(
        selectionsData: memberSelections, users: members);
    // Build the UI
    // return SizedBox(
    //   height: 50,
    //   child: ListView.builder(
    //     physics: NeverScrollableScrollPhysics(),
    //     shrinkWrap: true,
    //     scrollDirection: Axis.horizontal,
    //     itemCount: memberSelections.length,
    //     itemBuilder: (context, index) {
    //       final memberSelection = memberSelections[index];
    //       final userOfThisSelection = loadedStateData.members
    //           ?.firstWhere((e) => e.uid == memberSelection.userUid);
    //       return Stack(
    //         children: [
    //           Transform.translate(
    //             offset: Offset(-20, 0),
    //             child: Container(
    //                 height: 30,
    //                 width: 30,
    //                 padding: EdgeInsets.all(5),
    //                 decoration: BoxDecoration(
    //                     shape: BoxShape.circle, color: Colors.blue),
    //                 child: Center(
    //                     child: Txt(
    //                   userOfThisSelection?.displayName?[0].toString() ?? '',
    //                   color: Colors.black,
    //                 ))),
    //           ),
    //           Container(
    //               height: 30,
    //               width: 30,
    //               padding: EdgeInsets.all(5),
    //               decoration: BoxDecoration(
    //                   shape: BoxShape.circle, color: AppColors.grey),
    //               child: Center(
    //                   child: Txt(
    //                 memberSelection.count.toString() ?? '',
    //                 color: Colors.black,
    //               ))),
    //         ],
    //       );
    //       // ListTile(
    //       // leading: CircleAvatar(
    //       //     radius: 20,
    //       //     child: Text(
    //       //       // (memberSelection.displayName?.isNotEmpty ?? false)
    //       //       //     ? (memberSelection.displayName?[0] ?? '-').toUpperCase()
    //       //       //     : '?',
    //       //       style: const TextStyle(color: Colors.white),
    //       //     )),
    //       // title: ,
    //       // subtitle: Text('${memberSelection.itemCount} items'),
    //       // );
    //     },
    //   ),
    // );
  }
}

class MemberItemSelection {
  final String userId;
  final String? displayName;
  final String? photoUrl;
  final int itemCount;

  MemberItemSelection({
    required this.userId,
    this.displayName,
    this.photoUrl,
    required this.itemCount,
  });
}
