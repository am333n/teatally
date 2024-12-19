import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teatally/core/app_colors.dart';
import 'package:teatally/core/styles/text/txt.dart';

import 'package:teatally/features/home/application/home_page_cubit.dart';

class SavedDataDialog extends StatelessWidget {
  final ValueNotifier<int> _rebuildNotifier = ValueNotifier<int>(0);

  SavedDataDialog({super.key});

  String extractDate(String key) {
    // Assuming the key format is 'selectedData_YYYY-MM-DD'
    final parts = key.split('_');
    if (parts.length == 2) {
      return parts[1];
    }
    return key; // Return the key as is if format is unexpected
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // _showSavedDialog(context);
      },
      child: Row(
        children: [
          Image.asset(
            'assets/bevimages/tealogo.png',
            height: 50,
            width: 50,
          ),
          const Txt(
            'TeaTally',
            style: TxtStyle.headerMSemiBold,
          ),
        ],
      ),
    );
  }

  // Future<dynamic> _showSavedDialog(BuildContext context) {
  //   return showModalBottomSheet(
  //       context: context,
  //       isScrollControlled: true,
  //       useSafeArea: true,
  //       builder: (BuildContext context) {
  //         return ValueListenableBuilder<int>(
  //           valueListenable: _rebuildNotifier,
  //           builder: (context, value, child) {
  //             return ListView(
  //               shrinkWrap: true,
  //               children: [
  //                 Padding(
  //                   padding:
  //                       const EdgeInsets.only(left: 15.0, right: 5, top: 10),
  //                   child: Row(
  //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                     children: [
  //                       const Txt(
  //                         'Saved Data',
  //                         style: TxtStyle.headerSBold,
  //                       ),
  //                       Row(
  //                         children: [
  //                           IconButton(
  //                             onPressed: () {
  //                               Navigator.of(context).pop();
  //                             },
  //                             icon: const Icon(
  //                               Icons.close,
  //                               size: 30,
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //                 const Divider(),
  //                 FutureBuilder<List<String>>(
  //                   future: context.read<HomePageCubit>().getSavedDates(),
  //                   builder: (context, snapshot) {
  //                     if (snapshot.connectionState ==
  //                         ConnectionState.waiting) {
  //                       return const Center(
  //                           child: CircularProgressIndicator());
  //                     } else if (snapshot.hasError) {
  //                       return const Center(
  //                           child: Text('Error fetching saved data'));
  //                     } else {
  //                       final savedDates = snapshot.data ?? [];
  //                       if (savedDates.isEmpty) {
  //                         return const SizedBox(
  //                           height: 100,
  //                           child: Center(
  //                               child: Txt(
  //                             'No saved data',
  //                             style: TxtStyle.headerSRegular,
  //                           )),
  //                         );
  //                       }
  //                       return Container(
  //                         padding: const EdgeInsets.symmetric(
  //                             vertical: 20, horizontal: 20),
  //                         child: Column(
  //                           mainAxisSize: MainAxisSize.min,
  //                           children: [
  //                             ListView.builder(
  //                               padding: EdgeInsets.zero,
  //                               physics: const NeverScrollableScrollPhysics(),
  //                               shrinkWrap: true,
  //                               itemCount: savedDates.length,
  //                               itemBuilder: (context, index) {
  //                                 final date = extractDate(savedDates[index]);
  //                                 return Row(
  //                                     mainAxisAlignment:
  //                                         MainAxisAlignment.spaceBetween,
  //                                     children: [
  //                                       Txt(date),
  //                                       Row(
  //                                         mainAxisSize: MainAxisSize.min,
  //                                         children: [
  //                                           IconButton(
  //                                             onPressed: () {
  //                                               context
  //                                                   .read<HomePageCubit>()
  //                                                   .loadSelectedData(
  //                                                       savedDates[index]);
  //                                               Navigator.of(context).pop();
  //                                             },
  //                                             icon: const Icon(
  //                                               Icons.visibility,
  //                                             ),
  //                                           ),
  //                                           IconButton(
  //                                             onPressed: () {
  //                                               context
  //                                                   .read<HomePageCubit>()
  //                                                   .deleteSavedData(
  //                                                       savedDates[index]);
  //                                               // Navigator.of(context).pop();
  //                                               _rebuildNotifier.value++;
  //                                             },
  //                                             icon: const Icon(
  //                                               Icons.delete,
  //                                               color: AppColors.black,
  //                                             ),
  //                                           ),
  //                                         ],
  //                                       ),
  //                                     ]);
  //                               },
  //                             ),
  //                           ],
  //                         ),
  //                       );
  //                     }
  //                   },
  //                 ),
  //                 Padding(
  //                   padding: const EdgeInsets.all(15),
  //                   child: Row(
  //                     children: [
  //                       Expanded(
  //                         child: InkWell(
  //                           onTap: () async {
  //                             await context
  //                                 .read<HomePageCubit>()
  //                                 .saveSelectedData();
  //                             // Notify the ValueNotifier to rebuild the FutureBuilder
  //                             _rebuildNotifier.value++;
  //                           },
  //                           child: Container(
  //                               alignment: Alignment.center,
  //                               padding: const EdgeInsets.symmetric(
  //                                   horizontal: 10, vertical: 10),
  //                               decoration: BoxDecoration(
  //                                   color: AppColors.lightGreen,
  //                                   borderRadius: BorderRadius.circular(15)),
  //                               child: const Txt(
  //                                 "Save",
  //                                 style: TxtStyle.bodyLBold,
  //                                 color: AppColors.white,
  //                               )),
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               ],
  //             );
  //           },
  //         );
  //       },
  //     );
  // }
}
