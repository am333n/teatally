import 'dart:convert';

import 'package:dartz/dartz.dart';

import 'package:injectable/injectable.dart';
import 'package:teatally/core/infrastructure/failure.dart';

@Injectable()
class ThemeRepository {
  // final ThemeRemoteSerive _remoteService;

  ThemeRepository();
  // Future<Either<Failure, String>> updateUserPreference({
  //   bool? isDarkMode,
  //   String? themeColor,
  //   String? fontSize,
  // }) async {
  // try {
  //   final response = await _remoteService.updateUserPreference(
  //       isDarkMode: isDarkMode, themeColor: themeColor, fontSize: fontSize);
  //   return response.when(
  //       success: (data) {
  //         return const Right('Preference Updated Successfully');
  //       },
  //       failure: (failureMessage) =>
  //           Left(FailureHandler.getFailureFromMessage(failureMessage)));
  // } on DioException catch (e) {
  //   return FailureHandler.handleFailure(e);
  // }
}

  // Future<Either<Failure, Map<String, dynamic>>> fetchUserPreference() async {
  //   try {
  //     final response = await _remoteService.fetchUserPreference();
  //     return response.when(
  //         success: (data) {
  //           Map<String, dynamic> userPreferences = {
  //             "IsDarkMode": data["IsDarkMode"],
  //             "ThemeColor": data["ThemeColor"],
  //             "FontSize": data["FontSize"],
  //           };
  //           return Right(userPreferences);
  //         },
  //         failure: (failureMessage) =>
  //             Left(FailureHandler.getFailureFromMessage(failureMessage)));
  //   } on DioException catch (e) {
  //     return FailureHandler.handleFailure(e);
  //   }
  // }

