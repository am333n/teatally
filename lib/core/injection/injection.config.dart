// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:teatally/core/common/device_info_service.dart' as _i919;
import 'package:teatally/core/common/local_notification_service.dart' as _i67;
import 'package:teatally/core/common/notification_service.dart' as _i446;
import 'package:teatally/core/common/notification_service_remote_service.dart'
    as _i818;
import 'package:teatally/core/common/notification_service_repository.dart'
    as _i52;
import 'package:teatally/core/network/dio/dio_module.dart' as _i1044;
import 'package:teatally/core/theme/application/cubit/theme_cubit.dart'
    as _i121;
import 'package:teatally/core/theme/infrastrucutre/theme_repo.dart' as _i777;
import 'package:teatally/features/auth/application/cubit/auth_cubit.dart'
    as _i769;
import 'package:teatally/features/auth/infrastructure/auth_remote.dart'
    as _i653;
import 'package:teatally/features/auth/infrastructure/auth_repository.dart'
    as _i400;
import 'package:teatally/features/expense/application/cubit/expense_cubit.dart'
    as _i475;
import 'package:teatally/features/expense/infrastructure/expense_remote_service.dart'
    as _i888;
import 'package:teatally/features/expense/infrastructure/expense_repository.dart'
    as _i229;
import 'package:teatally/features/group/application/cubit/group_detail_cubit.dart'
    as _i416;
import 'package:teatally/features/group/infrastructure/group_remote_service.dart'
    as _i962;
import 'package:teatally/features/group/infrastructure/group_repository.dart'
    as _i681;
import 'package:teatally/features/home/application/home_page_cubit.dart'
    as _i111;
import 'package:teatally/features/home/infrastructure/home_remote.dart'
    as _i911;
import 'package:teatally/features/home/infrastructure/home_repository.dart'
    as _i813;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<_i818.NotificationServiceRemoteService>(
        () => _i818.NotificationServiceRemoteService());
    gh.factory<_i777.ThemeRepository>(() => _i777.ThemeRepository());
    gh.factory<_i911.HomeRemoteService>(() => _i911.HomeRemoteService());
    gh.factory<_i888.ExpenseRemoteService>(() => _i888.ExpenseRemoteService());
    gh.factory<_i653.AuthRemoteService>(() => _i653.AuthRemoteService());
    gh.factory<_i962.GroupRemoteService>(() => _i962.GroupRemoteService());
    gh.lazySingleton<_i919.DeviceInfoService>(() => _i919.DeviceInfoService());
    gh.lazySingleton<_i67.LocalNotificationService>(
        () => _i67.LocalNotificationService());
    gh.singleton<_i121.ThemeCubit>(
        () => _i121.ThemeCubit(gh<_i777.ThemeRepository>()));
    gh.factory<_i229.ExpenseRepository>(
        () => _i229.ExpenseRepository(gh<_i888.ExpenseRemoteService>()));
    gh.singleton<_i361.Dio>(
      () => registerModule.commonInstance,
      instanceName: 'commonInstance',
    );
    gh.factory<_i813.HomeRepository>(
        () => _i813.HomeRepository(gh<_i911.HomeRemoteService>()));
    gh.factory<_i400.AuthRepository>(
        () => _i400.AuthRepository(gh<_i653.AuthRemoteService>()));
    gh.factory<_i111.HomePageCubit>(
        () => _i111.HomePageCubit(gh<_i813.HomeRepository>()));
    gh.factory<_i681.GroupRepository>(
        () => _i681.GroupRepository(gh<_i962.GroupRemoteService>()));
    gh.factory<_i52.NotificationServiceRepository>(() =>
        _i52.NotificationServiceRepository(
            gh<_i818.NotificationServiceRemoteService>()));
    gh.singleton<_i769.AuthCubit>(
        () => _i769.AuthCubit(gh<_i400.AuthRepository>()));
    gh.factory<_i475.ExpenseCubit>(
        () => _i475.ExpenseCubit(gh<_i229.ExpenseRepository>()));
    gh.factory<_i416.GroupDetailCubit>(() => _i416.GroupDetailCubit(
          gh<_i681.GroupRepository>(),
          gh<_i52.NotificationServiceRepository>(),
        ));
    gh.singleton<_i446.NotificationService>(() =>
        _i446.NotificationService(gh<_i52.NotificationServiceRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i1044.RegisterModule {}
