import 'package:injectable/injectable.dart';
import 'package:teatally/core/infrastructure/base_repository.dart';
import 'package:teatally/features/expense/infrastructure/expense_remote_service.dart';
import 'package:teatally/features/home/domain/users_model.dart';

@injectable
class ExpenseRepository with BaseRepo {
  final ExpenseRemoteService _remoteService;

  ExpenseRepository(this._remoteService);

  RepoResponse<List<UserModel>> getGroupMemberDetails(List<String> ids) {
    return super.getListData(
        () => _remoteService.getGroupMemberDetails(ids), UserModel.fromJson);
  }
}
