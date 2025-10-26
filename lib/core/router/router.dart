import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:teatally/core/injection/injection.dart';
import 'package:teatally/features/auth/application/cubit/auth_cubit.dart';
import 'package:teatally/features/auth/presentation/auth_screen.dart';
import 'package:teatally/features/expense/presentation/expense_detail_page.dart';
import 'package:teatally/features/expense/presentation/expense_list_page.dart';
import 'package:teatally/features/group/domain/categories_model.dart';
import 'package:teatally/features/group/presentation/components/add_item_page.dart';
import 'package:teatally/features/group/presentation/pages/group_details.dart';
import 'package:teatally/features/group/presentation/pages/group_details_edit_page.dart';
import 'package:teatally/features/home/domain/users_model.dart';
import 'package:teatally/features/home/presentation/components/add%20group/group_form.dart';
import 'package:teatally/features/home/presentation/home_page.dart';
import 'package:teatally/features/expense/presentation/expense_form_page.dart';

import '../../features/group/presentation/group_detail.dart';
import '../../features/home/domain/group_model.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        _buildRoute(page: HomeRoute.page),
        _buildRoute(page: GroupDetailsViewRoute.page),
        _buildRoute(page: AuthRoute.page, initial: true, guards: [AuthGuard()]),
        _buildRoute(page: AddItemRoute.page),
        _buildRoute(page: GroupDetailRoute.page),
        _buildRoute(page: ExpenseFormRoute.page),
        _buildRoute(page: ExpenseListRoute.page),
        _buildRoute(page: ExpenseDetailRoute.page),
        _buildRoute(page: GroupFormRoute.page),
      ];

  AutoRoute _buildRoute({
    required PageInfo page,
    List<AutoRouteGuard> guards = const [],
    bool initial = false,
  }) {
    return AutoRoute(
      page: page,
      guards: guards,
      initial: initial,
    );
  }
}

class AuthGuard extends AutoRouteGuard {
  AuthGuard();
  @override
  Future<void> onNavigation(
      NavigationResolver resolver, StackRouter router) async {
    final isUserLoggedIn = getIt<AuthCubit>().state.status is Authenticated;
    if (isUserLoggedIn) {
      router.replace(const HomeRoute());
    } else {
      resolver.next();
    }
  }
}
