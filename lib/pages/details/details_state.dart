import 'package:equatable/equatable.dart';
import 'package:test_project/data/repository/entity/manufactory_details.dart';
import 'package:test_project/pages/base/main_status.dart';

class DetailsState extends Equatable {
  final MainStatus status;
  final ManufactoryDetails? details;
  final String? error;

  const DetailsState({
    this.status = MainStatus.loading,
    this.details,
    this.error = null
  });

  DetailsState copyWith({
    MainStatus? status,
    ManufactoryDetails? details,
    final String? error
  }) {
    return DetailsState(
        status: status ?? this.status,
        details: details ?? this.details,
        error: error ?? this.error
    );
  }

  @override
  List<Object?> get props => [status, details, error];
}
