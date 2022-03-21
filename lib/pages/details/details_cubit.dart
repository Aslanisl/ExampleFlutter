import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/data/repository/repository_manufactory.dart';
import 'package:test_project/pages/base/main_status.dart';

import 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  final ManufactoryRepository _repository;
  int _manufactoryId = 0;

  DetailsCubit(this._repository) : super(DetailsState());

  initManufactoryId(int id) {
    _manufactoryId = id;
  }

  Future<void> loadManufactoryDetails() async {
    emit(state.copyWith(status: MainStatus.loading));
    final result = await _repository.loadManufactureDetails(_manufactoryId);
    if (result.value != null) {
      emit(state.copyWith(status: MainStatus.success, details: result.value!));
    } else {
      emit(state.copyWith(status: MainStatus.fail, error: result.error));
    }
  }
}
