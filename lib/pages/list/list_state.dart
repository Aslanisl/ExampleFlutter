import 'package:equatable/equatable.dart';
import 'package:test_project/data/repository/entity/manufactory.dart';

enum MainStatus { init, loading, success, fail }

class ListState extends Equatable {
  final MainStatus status;
  final List<Manufactory>? manufactures;
  final bool itHasMoreManufactures;
  final String? error;

  const ListState({
    this.status = MainStatus.init,
    this.manufactures,
    this.itHasMoreManufactures = true,
    this.error = null
  });

  ListState copyWith({
    MainStatus? status,
    List<Manufactory>? manufactures,
    bool? itHasMoreManufactures,
    final String? error
  }) {
    return ListState(
        status: status ?? this.status,
        manufactures: manufactures ?? this.manufactures,
        itHasMoreManufactures: itHasMoreManufactures ?? this.itHasMoreManufactures,
        error: error ?? this.error
    );
  }

  @override
  List<Object?> get props => [status, manufactures, itHasMoreManufactures, error];
}
