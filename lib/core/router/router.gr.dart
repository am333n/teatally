// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

/// generated route for
/// [AddItemPage]
class AddItemRoute extends PageRouteInfo<AddItemRouteArgs> {
  AddItemRoute({
    Key? key,
    required CategoriesModel? categoryDetail,
    required GroupModel? groupDetails,
    List<PageRouteInfo>? children,
  }) : super(
          AddItemRoute.name,
          args: AddItemRouteArgs(
            key: key,
            categoryDetail: categoryDetail,
            groupDetails: groupDetails,
          ),
          initialChildren: children,
        );

  static const String name = 'AddItemRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AddItemRouteArgs>();
      return AddItemPage(
        key: args.key,
        categoryDetail: args.categoryDetail,
        groupDetails: args.groupDetails,
      );
    },
  );
}

class AddItemRouteArgs {
  const AddItemRouteArgs({
    this.key,
    required this.categoryDetail,
    required this.groupDetails,
  });

  final Key? key;

  final CategoriesModel? categoryDetail;

  final GroupModel? groupDetails;

  @override
  String toString() {
    return 'AddItemRouteArgs{key: $key, categoryDetail: $categoryDetail, groupDetails: $groupDetails}';
  }
}

/// generated route for
/// [AuthScreen]
class AuthRoute extends PageRouteInfo<AuthRouteArgs> {
  AuthRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          AuthRoute.name,
          args: AuthRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args =
          data.argsAs<AuthRouteArgs>(orElse: () => const AuthRouteArgs());
      return AuthScreen(key: args.key);
    },
  );
}

class AuthRouteArgs {
  const AuthRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'AuthRouteArgs{key: $key}';
  }
}

/// generated route for
/// [GroupDetailPage]
class GroupDetailRoute extends PageRouteInfo<GroupDetailRouteArgs> {
  GroupDetailRoute({
    Key? key,
    required GroupModel? groupDetail,
    List<PageRouteInfo>? children,
  }) : super(
          GroupDetailRoute.name,
          args: GroupDetailRouteArgs(
            key: key,
            groupDetail: groupDetail,
          ),
          initialChildren: children,
        );

  static const String name = 'GroupDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<GroupDetailRouteArgs>();
      return GroupDetailPage(
        key: args.key,
        groupDetail: args.groupDetail,
      );
    },
  );
}

class GroupDetailRouteArgs {
  const GroupDetailRouteArgs({
    this.key,
    required this.groupDetail,
  });

  final Key? key;

  final GroupModel? groupDetail;

  @override
  String toString() {
    return 'GroupDetailRouteArgs{key: $key, groupDetail: $groupDetail}';
  }
}

/// generated route for
/// [GroupDetailsViewPage]
class GroupDetailsViewRoute extends PageRouteInfo<GroupDetailsViewRouteArgs> {
  GroupDetailsViewRoute({
    Key? key,
    required GroupModel? groupDetails,
    List<PageRouteInfo>? children,
  }) : super(
          GroupDetailsViewRoute.name,
          args: GroupDetailsViewRouteArgs(
            key: key,
            groupDetails: groupDetails,
          ),
          initialChildren: children,
        );

  static const String name = 'GroupDetailsViewRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<GroupDetailsViewRouteArgs>();
      return GroupDetailsViewPage(
        key: args.key,
        groupDetails: args.groupDetails,
      );
    },
  );
}

class GroupDetailsViewRouteArgs {
  const GroupDetailsViewRouteArgs({
    this.key,
    required this.groupDetails,
  });

  final Key? key;

  final GroupModel? groupDetails;

  @override
  String toString() {
    return 'GroupDetailsViewRouteArgs{key: $key, groupDetails: $groupDetails}';
  }
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomePage();
    },
  );
}
