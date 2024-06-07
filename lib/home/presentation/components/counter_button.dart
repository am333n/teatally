import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teatally/core/app_colors.dart';
import 'package:teatally/core/styles/text_widget.dart';
import 'package:teatally/home/application/home_page_cubit.dart';
import 'package:teatally/home/domain/beverages.dart';
import 'package:teatally/home/domain/item.dart';

class CounterButton extends StatelessWidget {
  const CounterButton({
    super.key,
    required this.beverageItem,
    required this.selectedBeverages,
  });

  final Beverage beverageItem;
  final List<ItemCounter> selectedBeverages;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final itemCount =
        selectedBeverages.any((item) => item.id == beverageItem.id)
            ? selectedBeverages
                .firstWhere((item) => item.id == beverageItem.id)
                .count
            : 0;
    return Container(
      width: size.width * 0.35,
      margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 25),
      decoration: BoxDecoration(
        // color: AppColors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(22),
        // border: Border.all(),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppIconButton(
              icon: Icons.remove,
              onPressed: () {
                context.read<HomePageCubit>().removeItem(beverageItem.id);
              }),
          Container(
            padding: const EdgeInsets.all(15),
            // padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            decoration: BoxDecoration(
                // border: Border.all(color: AppColors.lightYellow),
                color: itemCount > 0
                    ? AppColors.black
                    : AppColors.white.withOpacity(0.2),
                shape: BoxShape.circle),
            child: Txt(
              itemCount.toString(),
              style: TxtStyle.bodyBold,
              color: itemCount > 0
                  ? AppColors.white
                  : AppColors.black.withOpacity(0.3),
            ),
          ),
          AppIconButton(
              icon: Icons.add,
              onPressed: () {
                context.read<HomePageCubit>().addItem(beverageItem.id);
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
