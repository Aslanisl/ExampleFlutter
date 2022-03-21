// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manufactory_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ManufactoryDetailsResponseResults _$ManufactoryDetailsResponseResultsFromJson(
        Map<String, dynamic> json) =>
    ManufactoryDetailsResponseResults(
      (json['ManufacturerTypes'] as List<dynamic>?)
          ?.map((e) => ManufactoryDetailsResponseTypes.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      json['Mfr_CommonName'] as String?,
      json['Mfr_ID'] as int,
      json['Mfr_Name'] as String,
      (json['VehicleTypes'] as List<dynamic>)
          .map((e) => ManufactoryDetailsResponseVehicleTypes.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ManufactoryDetailsResponseResultsToJson(
        ManufactoryDetailsResponseResults instance) =>
    <String, dynamic>{
      'ManufacturerTypes': instance.manufacturerTypes,
      'Mfr_CommonName': instance.mfrCommonname,
      'Mfr_ID': instance.mfrId,
      'Mfr_Name': instance.mfrName,
      'VehicleTypes': instance.vehicleTypes,
    };

ManufactoryDetailsResponseTypes _$ManufactoryDetailsResponseTypesFromJson(
        Map<String, dynamic> json) =>
    ManufactoryDetailsResponseTypes(
      json['Name'] as String,
    );

Map<String, dynamic> _$ManufactoryDetailsResponseTypesToJson(
        ManufactoryDetailsResponseTypes instance) =>
    <String, dynamic>{
      'Name': instance.name,
    };

ManufactoryDetailsResponseVehicleTypes
    _$ManufactoryDetailsResponseVehicleTypesFromJson(
            Map<String, dynamic> json) =>
        ManufactoryDetailsResponseVehicleTypes(
          json['GVWRFrom'] as String?,
          json['GVWRTo'] as String?,
          json['IsPrimary'] as bool?,
          json['Name'] as String,
        );

Map<String, dynamic> _$ManufactoryDetailsResponseVehicleTypesToJson(
        ManufactoryDetailsResponseVehicleTypes instance) =>
    <String, dynamic>{
      'GVWRFrom': instance.gVWRFrom,
      'GVWRTo': instance.gVWRTo,
      'IsPrimary': instance.isPrimary,
      'Name': instance.name,
    };
