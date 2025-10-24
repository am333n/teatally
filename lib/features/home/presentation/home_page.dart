import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:teatally/core/app_colors.dart';
import 'package:teatally/core/common/notification_service.dart';
import 'package:teatally/core/infrastructure/failure_handler.dart';
import 'package:teatally/core/injection/injection.dart';
import 'package:teatally/core/router/router.dart';
import 'package:teatally/core/styles/text/txt.dart';
import 'package:teatally/core/styles/text/txt_styles.dart';
import 'package:teatally/core/theme/presentation/app_theme.dart';
import 'package:teatally/core/widgets/common_widgets.dart';
import 'package:teatally/core/widgets/dialog_helpers.dart';
import 'package:teatally/features/auth/application/cubit/auth_cubit.dart';
import 'package:teatally/features/home/application/home_page_cubit.dart';
import 'package:teatally/features/home/application/home_page_state.dart';
import 'package:teatally/features/home/presentation/components/add%20group/add_group_dialog.dart';
import 'package:teatally/features/home/presentation/components/add%20group/components/color_mapper.dart';
import 'package:teatally/features/home/presentation/components/add%20group/components/icon_mapper.dart';
import 'package:teatally/features/group/presentation/components/item%20display/components/item_background.dart';
import 'package:teatally/features/group/presentation/components/item%20display/components/counter_button.dart';
import 'package:teatally/features/group/presentation/components/item%20display/components/item_label.dart';
import 'package:teatally/features/home/presentation/components/groups_listing.dart';
import 'package:teatally/features/home/presentation/components/profile_button.dart';
import 'package:teatally/features/home/presentation/components/app_title.dart';
import 'package:teatally/features/home/presentation/components/search_and_add_header.dart';
import 'package:teatally/features/home/presentation/components/summary_bottom_sheet.dart';
import 'package:teatally/features/home/presentation/components/total_display.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int? selectedBeverageTypeIndex;
  @override
  void initState() {
    getIt<NotificationService>().initialize();
    context.read<HomePageCubit>().loadGroups();

    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: RefreshIndicator(
      onRefresh: () {
        return context.read<HomePageCubit>().loadGroups();
      },
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: false,
            backgroundColor: context.theme.appColors.backgroundPrimary,
            expandedHeight: 80,
            collapsedHeight: kToolbarHeight,
            flexibleSpace: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppTitle(),
                    ProfileButton(
                      onTap: () async {
                        await DialogHelpers.confirmDeleteDialog(
                            context: context,
                            title: 'Sign Out?',
                            message:
                                'Are you sure you want to sign out of your account?',
                            onConfirmed: () {
                              // context.read<AuthCubit>().signOut();
                            },
                            onCanceled: () {},
                            confirmButtonText: 'Confirm');
                      },
                    ),
                  ],
                ),
              ),
            ),

            // bottom: PreferredSize(
            //   preferredSize: const Size.fromHeight(80.0),
            //   child: SizedBox(
            //     height: 80.0,
            //     child: ListView.builder(
            //       scrollDirection: Axis.horizontal,
            //       itemCount: beverageTypes.length +
            //           1, // +1 for the Clear chip
            //       itemBuilder: (context, index) {
            //         if (index == 0) {
            //           return Padding(
            //             padding: const EdgeInsets.symmetric(
            //                 horizontal: 8.0),
            //             child: ChoiceChip(
            //               showCheckmark: false,
            //               label: Txt(
            //                 'All',
            //                 color: selectedBeverageTypeIndex == null
            //                     ? Colors.white
            //                     : AppColors.black,
            //               ),
            //               shape: RoundedRectangleBorder(
            //                   borderRadius:
            //                       BorderRadius.circular(30)),
            //               padding: const EdgeInsets.all(10),
            //               selected: selectedBeverageTypeIndex == null,
            //               backgroundColor: AppColors.grey,
            //               side: BorderSide.none,
            //               selectedColor: AppColors.black,
            //               onSelected: (selected) {
            //                 setState(() {
            //                   selectedBeverageTypeIndex = null;
            //                 });
            //               },
            //             ),
            //           );
            //         }
            //         final beverageTypeItem = beverageTypes[
            //             index - 1]; // Adjust index for beverageTypes
            //         return Padding(
            //           padding:
            //               const EdgeInsets.symmetric(horizontal: 8.0),
            //           child: ChoiceChip(
            //             showCheckmark: false,
            //             label: Txt(
            //               beverageTypeItem.displayName,
            //               color:
            //                   selectedBeverageTypeIndex == index - 1
            //                       ? Colors.white
            //                       : AppColors.black,
            //             ),
            //             shape: RoundedRectangleBorder(
            //                 borderRadius: BorderRadius.circular(30)),
            //             padding: const EdgeInsets.all(10),
            //             selected:
            //                 selectedBeverageTypeIndex == index - 1,
            //             backgroundColor: AppColors.grey,
            //             side: BorderSide.none,
            //             selectedColor: AppColors.black,
            //             onSelected: (selected) {
            //               setState(() {
            //                 selectedBeverageTypeIndex =
            //                     selected ? index - 1 : null;
            //               });
            //             },
            //           ),
            //         );
            //       },
            //     ),
            //   ),
            // ),
          ),

          const SearchAndAddButtonHeader(),
          const SliverFillRemaining(child: const GroupsListing()),

          // SliverGrid(
          //   gridDelegate:
          //       const SliverGridDelegateWithFixedCrossAxisCount(
          //     crossAxisCount:
          //         2, // You can change the number of columns here
          //     crossAxisSpacing: 10.0,
          //     mainAxisSpacing: 10.0,
          //   ),
          //   delegate: SliverChildBuilderDelegate(
          //     (context, index) {
          //       final beverageItem = filteredBeverages[index];
          //       final bgColor =
          //           Color(int.parse('0xff${beverageItem.bgColor}'));
          //       final darkerColor = bgColor
          //           .withOpacity(0.4); // Adjust opacity for darkness
          //       return Stack(
          //         children: [
          //           ItemBackgroundImage(
          //               bgColor: bgColor,
          //               darkerColor: darkerColor,
          //               size: size,
          //               beverageItem: beverageItem),
          //           ItemLabel(beverageItem: beverageItem),
          //           Positioned(
          //             right: 0,
          //             child: Container(
          //               // margin: EdgeInsets.all(5),
          //               padding: const EdgeInsets.symmetric(
          //                   horizontal: 10, vertical: 8),
          //               decoration: const BoxDecoration(
          //                   color: AppColors.lightYellow,
          //                   borderRadius: BorderRadius.only(
          //                       topRight: Radius.circular(22),
          //                       bottomLeft: Radius.circular(12))),
          //               child: RichText(
          //                 text: TextSpan(
          //                   children: [
          //                     txtSpan(
          //                       context,
          //                       text: '₹',
          //                       style: TxtStyle.bodySRegular,
          //                     ),
          //                     txtSpan(
          //                       context,
          //                       text: beverageItem.rate.toString(),
          //                       style: TxtStyle.bodySRegular,
          //                     )
          //                   ],
          //                 ),
          //               ),
          //             ),
          //           ),
          //           Positioned(
          //             bottom: 0,
          //             child: CounterButton(
          //               beverageItem: beverageItem,
          //               selectedBeverages: selectedBeverages,
          //             ),
          //           ),
          //         ],
          //       );
          //     },
          //     childCount: filteredBeverages.length,
          //   ),
          // ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 80,
            ),
          )
        ],
      ),
    )));
  }
}
