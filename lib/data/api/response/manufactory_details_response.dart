import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

import 'api_response.dart';

part 'manufactory_details_response.g.dart';

class ManufactoryDetailsResponse extends ApiResponse<ManufactoryDetailsResponseResults> {

  ManufactoryDetailsResponse(Map<String, dynamic> json) : super(json);

  @override
  ManufactoryDetailsResponseResults fromJson(Map<String, dynamic> json) {
    return ManufactoryDetailsResponseResults.fromJson(json);
  }
}

@JsonSerializable()
class ManufactoryDetailsResponseResults {
  @JsonKey(name: "ManufacturerTypes")
  List<ManufactoryDetailsResponseTypes>? manufacturerTypes;
  @JsonKey(name: "Mfr_CommonName")
  String? mfrCommonname;
  @JsonKey(name: "Mfr_ID")
  int mfrId;
  @JsonKey(name: "Mfr_Name")
  String mfrName;
  @JsonKey(name: "VehicleTypes")
  List<ManufactoryDetailsResponseVehicleTypes> vehicleTypes;

  ManufactoryDetailsResponseResults(
      this.manufacturerTypes, this.mfrCommonname, this.mfrId, this.mfrName, this.vehicleTypes);

  factory ManufactoryDetailsResponseResults.fromJson(Map<String, dynamic> json) =>
      _$ManufactoryDetailsResponseResultsFromJson(json);

  Map<String, dynamic> toJson() => _$ManufactoryDetailsResponseResultsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ManufactoryDetailsResponseTypes {
  @JsonKey(name: "Name")
  String name;

  ManufactoryDetailsResponseTypes(this.name);

  factory ManufactoryDetailsResponseTypes.fromJson(Map<String, dynamic> json) =>
      _$ManufactoryDetailsResponseTypesFromJson(json);

  Map<String, dynamic> toJson() => _$ManufactoryDetailsResponseTypesToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ManufactoryDetailsResponseVehicleTypes {
  @JsonKey(name: "GVWRFrom")
  String? gVWRFrom;
  @JsonKey(name: "GVWRTo")
  String? gVWRTo;
  @JsonKey(name: "IsPrimary")
  bool? isPrimary;
  @JsonKey(name: "Name")
  String name;

  ManufactoryDetailsResponseVehicleTypes(this.gVWRFrom, this.gVWRTo, this.isPrimary, this.name);

  factory ManufactoryDetailsResponseVehicleTypes.fromJson(Map<String, dynamic> json) =>
      _$ManufactoryDetailsResponseVehicleTypesFromJson(json);

  Map<String, dynamic> toJson() => _$ManufactoryDetailsResponseVehicleTypesToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
