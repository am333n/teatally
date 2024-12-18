// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:teatally/core/theme/application/cubit/theme_cubit.dart'
    as _i121;
import 'package:teatally/core/theme/infrastrucutre/theme_repo.dart' as _i777;
import 'package:teatally/features/auth/application/cubit/auth_cubit.dart'
    as _i769;
import 'package:teatally/features/auth/infrastructure/auth_remote.dart'
    as _i653;
import 'package:teatally/features/auth/infrastructure/auth_repository.dart'
    as _i400;
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
    gh.factory<_i777.ThemeRepository>(() => _i777.ThemeRepository());
    gh.factory<_i911.HomeRemoteService>(() => _i911.HomeRemoteService());
    gh.singleton<_i121.ThemeCubit>(
        () => _i121.ThemeCubit(gh<_i777.ThemeRepository>()));
    gh.factory<_i813.HomeRepository>(
        () => _i813.HomeRepository(gh<_i911.HomeRemoteService>()));
    gh.factory<_i111.HomePageCubit>(
        () => _i111.HomePageCubit(gh<_i813.HomeRepository>()));
    gh.factory<_i653.AuthRemoteService>(
        () => _i653.AuthRemoteService(gh<_i59.FirebaseAuth>()));
    gh.factory<_i400.AuthRepository>(
        () => _i400.AuthRepository(gh<_i653.AuthRemoteService>()));
    gh.factory<_i769.AuthCubit>(
        () => _i769.AuthCubit(gh<_i400.AuthRepository>()));
    return this;
  }
}
