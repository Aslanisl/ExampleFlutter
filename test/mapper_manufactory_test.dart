import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:test_project/data/api/response/all_manufactures_response.dart';
import 'package:test_project/data/api/response/manufactory_details_response.dart';
import 'package:test_project/data/db/entity/all_manufactures_entity.dart';
import 'package:test_project/data/db/entity/manufactory_details_entity.dart';
import 'package:test_project/data/mapper/mapper_manufactory.dart';
import 'package:test_project/data/repository/entity/manufactory.dart';
import 'package:test_project/data/repository/entity/manufactory_details.dart';

void main() {
  final MapperManufactory mapper = MapperManufactory();

  _checkManufacturesResults(AllManufacturesResults result, Manufactory manufactory) {
    expect(result.mfrId, manufactory.mfrId);
    expect(result.mfrName, manufactory.mfrName);
    expect(result.mfrCommonname, manufactory.mfrCommonname);
    expect(result.country, manufactory.country);
    expect(result.vehicleTypes?.length ?? 0, manufactory.vehicleTypes?.length ?? 0);

    if (result.vehicleTypes != null && result.vehicleTypes!.isNotEmpty) {
      for (int i = 0; i < result.vehicleTypes!.length; i++) {
        AllManufacturesResultsVehicleTypes vehicleType = result.vehicleTypes!.elementAt(i);
        ManufactoryVehicleTypes manufactoryVehicleType = manufactory.vehicleTypes!.elementAt(i);
        expect(vehicleType.name, manufactoryVehicleType.name);
        expect(vehicleType.isPrimary, manufactoryVehicleType.isPrimary);
      }
    }
  }

  AllManufacturesResponse _getAllManufacturesResponse() {
    final file = new File('test_resources/getallmanufacturers_success.json');
    final json = jsonDecode(file.readAsStringSync()) as Map<String, dynamic>;
    return AllManufacturesResponse(json);
  }

  test('mapResponse', () {
    AllManufacturesResponse response = _getAllManufacturesResponse();
    final manufactures = mapper.mapResponse(response);

    expect(response.results, isNotNull);
    expect(response.results!.isNotEmpty, true);
    expect(response.results!.length, manufactures.length);
    for (int i = 0; i < response.results!.length; i++) {
      AllManufacturesResults result = response.results!.elementAt(i);
      Manufactory manufactory = manufactures.elementAt(i);
      _checkManufacturesResults(result, manufactory);
    }
  });

  _checkManufacture(Manufactory manufactory, ManufactureEntity entity) {
    expect(entity.mfrId, manufactory.mfrId);
    expect(entity.mfrName, manufactory.mfrName);
    expect(entity.mfrCommonname, manufactory.mfrCommonname);
    expect(entity.country, manufactory.country);

    if (manufactory.vehicleTypes != null && manufactory.vehicleTypes!.isNotEmpty) {
      for (int i = 0; i < manufactory.vehicleTypes!.length; i++) {
        ManufactureVehicleTypesEntity vehicleType = entity.vehicleTypes.elementAt(i);
        ManufactoryVehicleTypes manufactoryVehicleType = manufactory.vehicleTypes!.elementAt(i);
        expect(vehicleType.name, manufactoryVehicleType.name);
        expect(vehicleType.isPrimary, manufactoryVehicleType.isPrimary);
      }
    }
  }

  test('mapManufactures', () {
    final manufactures = mapper.mapResponse(_getAllManufacturesResponse());
    AllManufacturesEntity allEntity = mapper.mapManufactures(manufactures);

    expect(allEntity.entities.length, manufactures.length);
    for (int i = 0; i < allEntity.entities.length; i++) {
      ManufactureEntity entity = allEntity.entities.elementAt(i);
      Manufactory manufactory = manufactures.elementAt(i);
      _checkManufacture(manufactory, entity);
    }
  });

  test('mapManufacturesEntity', () {
    var manufactures = mapper.mapResponse(_getAllManufacturesResponse());
    AllManufacturesEntity allEntity = mapper.mapManufactures(manufactures);
    manufactures = mapper.mapManufacturesEntity(allEntity);

    expect(allEntity.entities.length, manufactures.length);
    for (int i = 0; i < allEntity.entities.length; i++) {
      ManufactureEntity entity = allEntity.entities.elementAt(i);
      Manufactory manufactory = manufactures.elementAt(i);
      _checkManufacture(manufactory, entity);
    }
  });

  ManufactoryDetailsResponse _getManufactoryDetailsResponse() {
    final file = new File('test_resources/getmanufacturerdetails_success.json');
    final json = jsonDecode(file.readAsStringSync()) as Map<String, dynamic>;
    return ManufactoryDetailsResponse(json);
  }

  test('mapDetailsResponse', () {
    final response = _getManufactoryDetailsResponse();
    final details = mapper.mapDetailsResponse(response);

    expect(details, isNotNull);
    expect(response.results, isNotNull);
    expect(response.results!.isNotEmpty, true);

    ManufactoryDetailsResponseResults result = response.results!.first;
    expect(result.mfrCommonname, details!.mfrCommonname);
    expect(result.mfrName, details.mfrName);
    expect(result.mfrId, details.mfrId);
    expect(result.vehicleTypes.length, details.vehicleTypes.length);

    for (int i = 0; i < result.vehicleTypes.length; i++) {
      ManufactoryDetailsResponseVehicleTypes responseVehicleTypes = result.vehicleTypes.elementAt(i);
      ManufactoryDetailsVehicleTypes vehicleTypes = details.vehicleTypes.elementAt(i);
      expect(responseVehicleTypes.isPrimary, vehicleTypes.isPrimary);
      expect(responseVehicleTypes.name, vehicleTypes.name);
      expect(responseVehicleTypes.gVWRTo, vehicleTypes.gVWRTo);
      expect(responseVehicleTypes.gVWRFrom, vehicleTypes.gVWRFrom);
    }
  });

  _checkEntityDetails(ManufactoryDetailsEntity entity, ManufactoryDetails details) {
    expect(entity.mfrCommonname, details.mfrCommonname);
    expect(entity.mfrName, details.mfrName);
    expect(entity.mfrId, details.mfrId);

    for (int i = 0; i < entity.vehicleTypes.length; i++) {
      ManufactoryDetailsEntityVehicleTypes entityVehicleTypes = entity.vehicleTypes.elementAt(i);
      ManufactoryDetailsVehicleTypes vehicleTypes = details.vehicleTypes.elementAt(i);
      expect(entityVehicleTypes.isPrimary, vehicleTypes.isPrimary);
      expect(entityVehicleTypes.name, vehicleTypes.name);
      expect(entityVehicleTypes.gVWRTo, vehicleTypes.gVWRTo);
      expect(entityVehicleTypes.gVWRFrom, vehicleTypes.gVWRFrom);
    }
  }

  test('mapManufactoryDetails', () {
    final details = mapper.mapDetailsResponse(_getManufactoryDetailsResponse());
    expect(details, isNotNull);

    final entity = mapper.mapManufactoryDetails(details!);
    _checkEntityDetails(entity, details);
  });

  test('mapManufacturesDetailsEntity', () {
    var details = mapper.mapDetailsResponse(_getManufactoryDetailsResponse());
    expect(details, isNotNull);

    final entity = mapper.mapManufactoryDetails(details!);
    details = mapper.mapManufacturesDetailsEntity(entity);

    _checkEntityDetails(entity, details);
  });
}


