import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teatally/core/app_colors.dart';
import 'package:teatally/core/router/router.dart';
import 'package:teatally/core/styles/text/txt.dart';
import 'package:teatally/core/styles/text/txt_styles.dart';
import 'package:teatally/core/theme/presentation/app_theme.dart';
import 'package:teatally/core/widgets/common_widgets.dart';
import 'package:teatally/features/auth/application/cubit/auth_cubit.dart';
import 'package:teatally/features/home/application/home_page_cubit.dart';
import 'package:teatally/features/home/application/home_page_state.dart';
import 'package:teatally/features/home/presentation/components/add_group_dialog.dart';
import 'package:teatally/features/home/presentation/components/background_image.dart';
import 'package:teatally/features/home/presentation/components/counter_button.dart';
import 'package:teatally/features/home/presentation/components/item_label.dart';
import 'package:teatally/features/home/presentation/components/profile_button.dart';
import 'package:teatally/features/home/presentation/components/saved_data_dialog.dart';
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
  void didChangeDependencies() {
    context.read<HomePageCubit>().loadGroups();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: AppColors.lightYellow,
      floatingActionButton: FloatingActionButton(
        tooltip: 'Reset',
        backgroundColor: AppColors.lightGreen,
        onPressed: () async {
          await context.read<HomePageCubit>().getAllUsers().then((users) {
            showGeneralDialog(
                context: context,
                pageBuilder: (context, _, __) {
                  return SafeArea(
                      child: Material(child: AddGroupDialog(users: users)));
                });
          });
        },
        child: const Icon(
          Icons.restart_alt,
          size: 30,
          color: Colors.white,
        ),
      ),
      body: BlocBuilder<HomePageCubit, HomePageState>(
        builder: (context, state) {
          return state.when(
            loading: () => const Center(
              child: CupertinoActivityIndicator(),
            ),
            loaded: (groups) {
              // final filteredBeverages = selectedBeverageTypeIndex != null
              //     ? beverageTypes[selectedBeverageTypeIndex!].beverages
              //     : beverageTypes.expand((type) => type.beverages).toList();

              return SafeArea(
                child: CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      centerTitle: false,
                      title: SavedDataDialog(),
                      backgroundColor:
                          context.theme.appColors.backgroundPrimary,
                      actions: [
                        ProfileButton(
                          onTap: () {
                            context.read<AuthCubit>().signOut();
                          },
                        ),

                        // InkWell(
                        //   onTap: () {
                        //     // if (total > 0) {
                        //     //   showModalBottomSheet(
                        //     //       context: context,
                        //     //       useSafeArea: true,
                        //     //       isScrollControlled: true,
                        //     //       builder: (context) {
                        //     //         return SummaryBottomSheet(
                        //     //           beverageTypes: beverageTypes,
                        //     //           selectedBeverages: selectedBeverages,
                        //     //         );
                        //     //       });
                        //     // }
                        //   },
                        //   child: TotalDisplay(
                        //     total: total,
                        //   ),
                        // )
                      ],
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
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 20.0, left: 15, bottom: 10),
                        child: Text(
                          'Groups',
                          style: TextStyles.getTextStyle(
                                  context, TxtStyle.headerLSemiBold)
                              .copyWith(fontSize: 45),
                        ),
                      ),
                    ),
                    SearchAndAddButtonHeader(),
                    SliverList.builder(
                        itemCount: 100,
                        itemBuilder: (context, index) {
                          // final item = groups?[index];
                          return InkWell(
                            onTap: () {
                              // AutoRouter.of(context)
                              //     .push(GroupDetailRoute(groupDetail: item));
                            },
                            child: Container(
                              margin: const EdgeInsets.only(top: 10),
                              padding: const EdgeInsets.all(10),
                              color: Colors.white,
                              child: Row(
                                children: [Txt(index.toString())],
                              ),
                            ),
                          );
                        }),
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
              );
            },
          );
        },
      ),
    );
  }
}
