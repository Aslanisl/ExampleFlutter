// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_manufactures_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllManufacturesResults _$AllManufacturesResultsFromJson(
        Map<String, dynamic> json) =>
    AllManufacturesResults(
      country: json['Country'] as String?,
      mfrCommonname: json['Mfr_CommonName'] as String?,
      mfrId: json['Mfr_ID'] as int,
      mfrName: json['Mfr_Name'] as String,
      vehicleTypes: (json['VehicleTypes'] as List<dynamic>?)
          ?.map((e) => AllManufacturesResultsVehicleTypes.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AllManufacturesResultsToJson(
        AllManufacturesResults instance) =>
    <String, dynamic>{
      'Country': instance.country,
      'Mfr_CommonName': instance.mfrCommonname,
      'Mfr_ID': instance.mfrId,
      'Mfr_Name': instance.mfrName,
      'VehicleTypes': instance.vehicleTypes,
    };

AllManufacturesResultsVehicleTypes _$AllManufacturesResultsVehicleTypesFromJson(
        Map<String, dynamic> json) =>
    AllManufacturesResultsVehicleTypes(
      isPrimary: json['IsPrimary'] as bool?,
      name: json['Name'] as String?,
    );

Map<String, dynamic> _$AllManufacturesResultsVehicleTypesToJson(
        AllManufacturesResultsVehicleTypes instance) =>
    <String, dynamic>{
      'IsPrimary': instance.isPrimary,
      'Name': instance.name,
    };
