import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teatally/core/styles/text/txt.dart';
import 'package:teatally/features/group/application/cubit/group_detail_cubit.dart';
import 'package:teatally/features/group/application/cubit/group_detail_state.dart';
import 'package:teatally/features/group/presentation/components/item%20display/item_display_container.dart';
import 'package:teatally/features/home/presentation/components/groups_listing.dart';

class ItemsListing extends StatelessWidget {
  const ItemsListing({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GroupDetailCubit, GroupDetailState>(
      builder: (context, state) {
        return state.itemsState.when(
          loading: () => SliverFillRemaining(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
          loaded: (data) {
            if (data.isEmpty) {
              return SliverFillRemaining(
                  child: Center(
                      child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white),
                child: NoItemPlaceHolder(
                    image: 'assets/bevimages/biscuit.gif',
                    label: 'Your list is feeling a little empty'),
              )));
            }
            return SliverPadding(
              padding: const EdgeInsets.all(10),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:
                      2, // You can change the number of columns here
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final item = data[index];
                    return ItemDisplayContainer(
                      key: ValueKey(item.uid),
                      item: item,
                    );
                  },
                  childCount: data?.length ?? 0,
                ),
              ),
            );
          },
          error: (failure) => Center(child: Txt(failure.toString())),
        );
      },
    );
  }
}
