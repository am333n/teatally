import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:teatally/core/theme/application/cubit/theme_state.dart';
import 'package:teatally/core/theme/infrastrucutre/theme_repo.dart';
import 'package:teatally/core/theme/presentation/app_theme.dart';
import 'package:teatally/core/widgets/toast.dart';

@singleton
class ThemeCubit extends Cubit<ThemeState> {
  late ThemeData _currentThemeData;
  final ThemeRepository _repository;
  ThemeCubit(this._repository)
      : super(ThemeState(
            themeType: AppThemeType.defaultTheme,
            isDarkMode: false,
            isUpdating: false)) {
    _currentThemeData =
        AppTheme.getThemeData(state.themeType, state.isDarkMode);
    loadThemePreferences(shouldFetchFromServer: true);
  }

  ThemeData get currentThemeData => _currentThemeData;

  Future<void> loadThemePreferences(
      {required bool shouldFetchFromServer}) async {
    try {
      // final userPreference = await CredentialStorage.getUserPreference();
      // final String? colorCode = userPreference[CredentialStorage.themeColorKey];
      // final themeType = getThemeTypeFromColorCode(colorCode ?? '#337ab7');
      // final isDarkMode =
      //     userPreference[CredentialStorage.isDarkModeKey] ?? false;

      emit(ThemeState(
        themeType: AppThemeType.defaultTheme,
        isDarkMode: false,
        isUpdating: false,
      ));

      if (shouldFetchFromServer) {
        await fetchUserPreferenceFromServer();
      }
      await _updateThemeData(shouldUpdateServer: false);
    } catch (localError) {
      log("Error loading theme from local storage: $localError");
      try {
        await fetchUserPreferenceFromServer();
        await _updateThemeData(shouldUpdateServer: false);
      } catch (apiError) {
        log("Error loading theme from server: $apiError");

        emit(ThemeState(
          themeType: AppThemeType.defaultTheme,
          isDarkMode: false,
          isUpdating: false,
        ));
      }
    }
  }

  Future<void> fetchUserPreferenceFromServer() async {
    // final response = await _repository.fetchUserPreference();
    // response.fold((l) {
    //   // Toast.showError(l);
    // }, (r) {
    //   emit(ThemeState(
    //       themeType: getThemeTypeFromColorCode(r['ThemeColor']),
    //       isDarkMode: r['IsDarkMode'],
    //       isUpdating: false));
    // });
  }

  Future<void> setTheme(AppThemeType theme) async {
    final isDarkMode = state.isDarkMode;
    emit(ThemeState(
        themeType: theme, isDarkMode: isDarkMode, isUpdating: false));
    _updateThemeData();
  }

  Future<void> resetTheme() async {
    emit(ThemeState(
        themeType: AppThemeType.defaultTheme,
        isDarkMode: false,
        isUpdating: false));
    _updateThemeData(shouldUpdateServer: false);
  }

  void toggleDarkMode(bool isDarkMode) {
    emit(ThemeState(
        themeType: state.themeType, isDarkMode: isDarkMode, isUpdating: false));
    _updateThemeData();
  }

  Future<void> _updateThemeData({bool shouldUpdateServer = true}) async {
    _currentThemeData =
        AppTheme.getThemeData(state.themeType, state.isDarkMode);
    // await CredentialStorage.updateUserPreference(
    //     isDarkMode: state.isDarkMode,
    //     themeColor: getColorCodeFromThemeType(state.themeType));
    if (shouldUpdateServer) {
      // await updateThemePreferenceServer();
    }
  }

  // Future<void> updateThemePreferenceServer() async {
  //   final isDarkMode = state.isDarkMode;
  //   final themeMode = state.themeType;
  //   emit(ThemeState(
  //       themeType: themeMode, isDarkMode: isDarkMode, isUpdating: true));
  //   final response = await _repository.updateUserPreference(
  //       isDarkMode: isDarkMode,
  //       themeColor: getColorCodeFromThemeType(themeMode),
  //       fontSize: 'font-normal');
  //   response.fold((l) {
  //     // Toast.showError(l);
  //     emit(ThemeState(
  //         themeType: themeMode, isDarkMode: isDarkMode, isUpdating: false));
  //   }, (r) {
  //     // Toast.showSuccess(r);
  //     emit(ThemeState(
  //         themeType: themeMode, isDarkMode: isDarkMode, isUpdating: false));
  //   });
  // }

  AppThemeType getThemeTypeFromColorCode(String colorCode) {
    const Map<String, AppThemeType> colorMap = {
      '#337ab7': AppThemeType.defaultTheme,
    };
    return colorMap[colorCode] ?? AppThemeType.defaultTheme;
  }
}

String getColorCodeFromThemeType(AppThemeType themeType) {
  const Map<AppThemeType, String> themeMap = {
    AppThemeType.defaultTheme: '#337ab7',
  };

  return themeMap[themeType] ?? '#337ab7';
}

ThemeData activeTheme() {
  final themeCubit = GetIt.I<ThemeCubit>();
  return themeCubit.currentThemeData;
}
