import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:teatally/features/group/application/cubit/group_detail_state.dart';

class GroupDetailCubit extends Cubit<GroupDetailState> {
  GroupDetailCubit() : super(GroupDetailState.initial());
}
