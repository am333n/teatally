import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:teatally/core/styles/text/txt.dart';
import 'package:teatally/core/theme/presentation/app_theme.dart';
import 'package:teatally/core/widgets/common_widgets.dart';
import 'package:teatally/features/home/domain/group_model.dart';
import 'package:teatally/features/home/presentation/components/add%20group/components/icon_mapper.dart';

@RoutePage()
class GroupDetailsViewPage extends StatelessWidget {
  const GroupDetailsViewPage({super.key, required this.groupDetails});
  final GroupModel? groupDetails;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Theme.of(context).appColors.primary,
            automaticallyImplyLeading: true,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              background: Center(
                  child: Padding(
                padding: const EdgeInsets.only(bottom: kToolbarHeight),
                child: Image.asset(
                  IconMapper.getPathFromCode(
                    groupDetails?.icon,
                  ),
                  color: context.theme.appColors.formBackground,
                ),
              )),
              title: Txt(
                groupDetails?.name ?? '-',
                style: TxtStyle.headerMSemiBold,
                color: Colors.white,
              ),
            ),
          ),
          SliverList.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                return ListTile();
              })
        ],
      ),
    ));
  }
}
