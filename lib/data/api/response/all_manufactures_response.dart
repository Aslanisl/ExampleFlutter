import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:test_project/data/api/response/api_response.dart';

part 'all_manufactures_response.g.dart';

class AllManufacturesResponse extends ApiResponse<AllManufacturesResults> {

  AllManufacturesResponse(Map<String, dynamic> json) : super(json);

  @override
  AllManufacturesResults fromJson(Map<String, dynamic> json) {
    return AllManufacturesResults.fromJson(json);
  }
}

@JsonSerializable()
class AllManufacturesResults {
  @JsonKey(name: "Country")
  String? country;
  @JsonKey(name: "Mfr_CommonName")
  String? mfrCommonname;
  @JsonKey(name: "Mfr_ID")
  int mfrId;
  @JsonKey(name: "Mfr_Name")
  String mfrName;
  @JsonKey(name: "VehicleTypes")
  List<AllManufacturesResultsVehicleTypes>? vehicleTypes;

  AllManufacturesResults(
      {required this.country,
      required this.mfrCommonname,
      required this.mfrId,
      required this.mfrName,
      required this.vehicleTypes});

  factory AllManufacturesResults.fromJson(Map<String, dynamic> json) => _$AllManufacturesResultsFromJson(json);

  Map<String, dynamic> toJson() => _$AllManufacturesResultsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AllManufacturesResultsVehicleTypes {
  @JsonKey(name: "IsPrimary")
  bool? isPrimary;
  @JsonKey(name: "Name")
  String? name;

  AllManufacturesResultsVehicleTypes({required this.isPrimary, required this.name});

  factory AllManufacturesResultsVehicleTypes.fromJson(Map<String, dynamic> json) =>
      _$AllManufacturesResultsVehicleTypesFromJson(json);

  Map<String, dynamic> toJson() => _$AllManufacturesResultsVehicleTypesToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
