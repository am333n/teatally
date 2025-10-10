import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:teatally/core/app_colors.dart';
import 'package:teatally/core/styles/text/txt.dart';
import 'package:teatally/core/theme/presentation/app_theme.dart';
import 'package:teatally/features/group/domain/session_model.dart';
import 'package:teatally/features/home/domain/users_model.dart';

class ProfileAndCountDisplay extends StatefulWidget {
  const ProfileAndCountDisplay({
    super.key,
    required this.selectionsData,
    required this.users,
    this.maxDisplayCount = 2, // 👈 configurable
  });

  final List<Selection> selectionsData;
  final List<UserModel>? users;
  final int maxDisplayCount;

  @override
  State<ProfileAndCountDisplay> createState() => _ProfileAndCountDisplayState();
}

class _ProfileAndCountDisplayState extends State<ProfileAndCountDisplay> {
  @override
  Widget build(BuildContext context) {
    final hasMore = widget.selectionsData.length > widget.maxDisplayCount;
    final displayCount = hasMore
        ? widget.maxDisplayCount + 1 // include extra "..." bubble
        : widget.selectionsData.length;

    return GestureDetector(
      onLongPress: () {
        _showUserListBottomSheet(context);
      },
      child: SizedBox(
        height: 50,
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: displayCount,
          itemBuilder: (context, index) {
            // 👇 Handle "..." item
            if (hasMore && index == widget.maxDisplayCount) {
              return Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Transform.translate(
                      offset: const Offset(-20, 0),
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.more_horiz,
                            size: 20,
                            color: context.theme.appColors.fontPrimary,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }

            // 👇 Normal selection items
            final memberSelection = widget.selectionsData[index];
            final userOfThisSelection = widget.users?.firstWhere(
              (e) => e.uid == memberSelection.userUid,
              orElse: () =>
                  const UserModel(uid: '', displayName: '', email: ''),
            );

            return Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Transform.translate(
                    offset: const Offset(-20, 0),
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue.withOpacity(0.1),
                        image: userOfThisSelection?.photoURL != null &&
                                userOfThisSelection!.photoURL!.isNotEmpty
                            ? DecorationImage(
                                image: NetworkImage(
                                    userOfThisSelection!.photoURL!),
                                fit: BoxFit.cover,
                              )
                            : null,
                      ),
                      child: userOfThisSelection?.photoURL == null ||
                              userOfThisSelection!.photoURL!.isEmpty
                          ? Center(
                              child: Text(
                                userOfThisSelection?.displayName?.isNotEmpty ==
                                        true
                                    ? userOfThisSelection!.displayName![0]
                                        .toUpperCase()
                                    : '',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          : null,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: Container(
                      height: 30,
                      width: 30,
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.grey,
                      ),
                      child: Center(
                        child: Text(
                          memberSelection.count.toString(),
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void _showUserListBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Selected Users",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.selectionsData.length,
                  itemBuilder: (context, index) {
                    final selection = widget.selectionsData[index];
                    final user = widget.users
                        ?.firstWhere((u) => u.uid == selection.userUid);
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: (user?.photoURL != null &&
                                user!.photoURL!.isNotEmpty)
                            ? NetworkImage(user.photoURL!)
                            : null,
                        backgroundColor: Colors.blueAccent.withOpacity(0.2),
                        child:
                            (user?.photoURL == null || user!.photoURL!.isEmpty)
                                ? Text(
                                    user?.displayName?.isNotEmpty == true
                                        ? user!.displayName![0].toUpperCase()
                                        : '?',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  )
                                : null,
                      ),
                      title: Txt(user?.displayName ?? "Unknown User"),
                      trailing: Txt(
                        "x${selection.count}",
                        style: TxtStyle.bodyLSemiBold,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
