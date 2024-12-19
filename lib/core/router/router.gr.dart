// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

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
