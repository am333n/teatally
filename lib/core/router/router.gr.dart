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
/// [ExpenseDetailPage]
class ExpenseDetailRoute extends PageRouteInfo<ExpenseDetailRouteArgs> {
  ExpenseDetailRoute({
    Key? key,
    String? docID,
    List<PageRouteInfo>? children,
  }) : super(
          ExpenseDetailRoute.name,
          args: ExpenseDetailRouteArgs(
            key: key,
            docID: docID,
          ),
          initialChildren: children,
        );

  static const String name = 'ExpenseDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ExpenseDetailRouteArgs>(
          orElse: () => const ExpenseDetailRouteArgs());
      return ExpenseDetailPage(
        key: args.key,
        docID: args.docID,
      );
    },
  );
}

class ExpenseDetailRouteArgs {
  const ExpenseDetailRouteArgs({
    this.key,
    this.docID,
  });

  final Key? key;

  final String? docID;

  @override
  String toString() {
    return 'ExpenseDetailRouteArgs{key: $key, docID: $docID}';
  }
}

/// generated route for
/// [ExpenseFormPage]
class ExpenseFormRoute extends PageRouteInfo<ExpenseFormRouteArgs> {
  ExpenseFormRoute({
    Key? key,
    required String? sessionDocId,
    String? expenseDocID,
    List<PageRouteInfo>? children,
  }) : super(
          ExpenseFormRoute.name,
          args: ExpenseFormRouteArgs(
            key: key,
            sessionDocId: sessionDocId,
            expenseDocID: expenseDocID,
          ),
          initialChildren: children,
        );

  static const String name = 'ExpenseFormRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ExpenseFormRouteArgs>();
      return ExpenseFormPage(
        key: args.key,
        sessionDocId: args.sessionDocId,
        expenseDocID: args.expenseDocID,
      );
    },
  );
}

class ExpenseFormRouteArgs {
  const ExpenseFormRouteArgs({
    this.key,
    required this.sessionDocId,
    this.expenseDocID,
  });

  final Key? key;

  final String? sessionDocId;

  final String? expenseDocID;

  @override
  String toString() {
    return 'ExpenseFormRouteArgs{key: $key, sessionDocId: $sessionDocId, expenseDocID: $expenseDocID}';
  }
}

/// generated route for
/// [ExpenseListPage]
class ExpenseListRoute extends PageRouteInfo<ExpenseListRouteArgs> {
  ExpenseListRoute({
    Key? key,
    String? groupId,
    String? groupName,
    List<PageRouteInfo>? children,
  }) : super(
          ExpenseListRoute.name,
          args: ExpenseListRouteArgs(
            key: key,
            groupId: groupId,
            groupName: groupName,
          ),
          initialChildren: children,
        );

  static const String name = 'ExpenseListRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ExpenseListRouteArgs>(
          orElse: () => const ExpenseListRouteArgs());
      return ExpenseListPage(
        key: args.key,
        groupId: args.groupId,
        groupName: args.groupName,
      );
    },
  );
}

class ExpenseListRouteArgs {
  const ExpenseListRouteArgs({
    this.key,
    this.groupId,
    this.groupName,
  });

  final Key? key;

  final String? groupId;

  final String? groupName;

  @override
  String toString() {
    return 'ExpenseListRouteArgs{key: $key, groupId: $groupId, groupName: $groupName}';
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
/// [GroupDetailsEditPage]
class GroupDetailsEditRoute extends PageRouteInfo<void> {
  const GroupDetailsEditRoute({List<PageRouteInfo>? children})
      : super(
          GroupDetailsEditRoute.name,
          initialChildren: children,
        );

  static const String name = 'GroupDetailsEditRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const GroupDetailsEditPage();
    },
  );
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
