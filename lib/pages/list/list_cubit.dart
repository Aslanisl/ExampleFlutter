import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/data/repository/entity/manufactory.dart';
import 'package:test_project/data/repository/repository_manufactory.dart';
import 'package:test_project/pages/list/list_state.dart';

class ListCubit extends Cubit<ListState> {
  final ManufactoryRepository _repository;

  final List<Manufactory> _manufactures = List.empty(growable: true);
  int _currentPage = 1;

  ListCubit(this._repository) : super(ListState());

  Future<void> loadManufactures(bool refresh) async {
    if (!refresh && (state.status == MainStatus.loading || state.status == MainStatus.fail)) {
      return;
    }
    emit(state.copyWith(status: MainStatus.loading));
    final result = await _repository.loadManufactures(_currentPage);
    if (result.value != null) {
      final items = result.value!;
      _manufactures.addAll(items);
      _currentPage++;
      emit(state.copyWith(
          status: MainStatus.success, manufactures: _manufactures, itHasMoreManufactures: items.length > 0));
    } else {
      emit(state.copyWith(status: MainStatus.fail, error: result.error));
    }
  }
}
