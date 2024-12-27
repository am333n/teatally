import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:teatally/core/app_colors.dart';
import 'package:teatally/core/styles/text/txt.dart';
import 'package:teatally/features/group/domain/session_model.dart';
import 'package:teatally/features/home/domain/users_model.dart';

class ProfileAndCountDisplay extends StatefulWidget {
  const ProfileAndCountDisplay(
      {super.key, required this.selectionsData, required this.users});
  final List<Selection> selectionsData;
  final List<UserModel>? users;
  @override
  State<ProfileAndCountDisplay> createState() => _ProfileAndCountDisplayState();
}

class _ProfileAndCountDisplayState extends State<ProfileAndCountDisplay> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: widget.selectionsData.length,
        itemBuilder: (context, index) {
          final memberSelection = widget.selectionsData[index];
          final userOfThisSelection =
              widget.users?.firstWhere((e) => e.uid == memberSelection.userUid);
          return GestureDetector(
            onDoubleTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Stack(
              children: [
                Transform.translate(
                  offset: const Offset(-20, 0),
                  child: AnimatedContainer(
                      duration: Durations.extralong4,
                      height: 30,
                      width: isExpanded ? 70 : 30,
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          color: Colors.blue),
                      child: Center(
                          child: AnimatedSwitcher(
                        duration: Durations.extralong4,
                        child: Txt(
                          isExpanded
                              ? userOfThisSelection?.displayName.toString() ??
                                  '-'
                              : userOfThisSelection?.displayName?[0]
                                      .toString() ??
                                  '',
                          color: Colors.black,
                        ),
                      ))),
                ),
                Positioned(
                  right: 0,
                  child: Container(
                      height: 30,
                      width: 30,
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: AppColors.grey),
                      child: Center(
                          child: Txt(
                        memberSelection.count.toString() ?? '',
                        color: Colors.black,
                      ))),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
