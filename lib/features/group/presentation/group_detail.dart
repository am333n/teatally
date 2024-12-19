import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:teatally/core/styles/text/txt.dart';
import 'package:teatally/core/theme/presentation/app_theme.dart';
import 'package:teatally/features/home/domain/group_model.dart';

@RoutePage()
class GroupDetailPage extends StatelessWidget {
  const GroupDetailPage({super.key, required this.groupDetail});
  final GroupModel? groupDetail;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Txt(groupDetail?.name ?? ''),
            backgroundColor: context.theme.appColors.primary,
          ),
        ],
      ),
    );
  }
}
