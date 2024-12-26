import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:teatally/core/injection/injection.dart';
import 'package:teatally/core/router/router.dart';
import 'package:teatally/core/theme/application/cubit/theme_cubit.dart';
import 'package:teatally/core/theme/application/cubit/theme_state.dart';
import 'package:teatally/core/theme/presentation/app_theme.dart';
import 'package:teatally/features/auth/application/cubit/auth_cubit.dart';
import 'package:teatally/features/group/application/cubit/group_detail_cubit.dart';
import 'package:teatally/features/home/application/home_page_cubit.dart';
import 'package:teatally/features/home/presentation/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final appRouter = getIt<AppRouter>();
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => getIt<ThemeCubit>()),
          BlocProvider(create: (context) => getIt<HomePageCubit>()),
          BlocProvider(create: (context) => getIt<AuthCubit>()),
          BlocProvider(create: (context) => getIt<GroupDetailCubit>()),
        ],
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            final currentTheme = state.themeType;
            final isdarkMode = state.isDarkMode;
            return MaterialApp.router(
              title: 'TeaTally',
              scaffoldMessengerKey:
                  GetIt.I<GlobalKey<ScaffoldMessengerState>>(),
              theme: AppTheme.getThemeData(currentTheme, false),
              darkTheme: AppTheme.getThemeData(currentTheme, true),
              themeMode: isdarkMode ? ThemeMode.dark : ThemeMode.light,
              routerDelegate: appRouter.delegate(),
              routeInformationParser: appRouter.defaultRouteParser(),
            );
          },
        )

        //  MaterialApp(
        //   title: 'TeaTally',
        //   theme: ThemeData(
        //     colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xffafd170)),
        //     useMaterial3: true,
        //   ),
        //   home: const HomePage(),
        // ),
        );
  }
}
