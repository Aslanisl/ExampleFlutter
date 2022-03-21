import 'package:test_project/data/api/response/all_manufactures_response.dart';
import 'package:test_project/data/api/response/manufactory_details_response.dart';
import 'package:test_project/data/db/entity/all_manufactures_entity.dart';
import 'package:test_project/data/db/entity/manufactory_details_entity.dart';
import 'package:test_project/data/repository/entity/manufactory.dart';
import 'package:test_project/data/repository/entity/manufactory_details.dart';

class MapperManufactory {
  List<Manufactory> mapResponse(AllManufacturesResponse response) {
    return response.results
            ?.map((result) => Manufactory(result.country, result.mfrCommonname, result.mfrId, result.mfrName,
                result.vehicleTypes?.map((e) => ManufactoryVehicleTypes(e.isPrimary, e.name)).toList()))
            .toList() ??
        List.empty();
  }

  AllManufacturesEntity mapManufactures(List<Manufactory> manufactures) {
    final mapList = manufactures.map((manufacture) {
      final mapVehicleList = manufacture.vehicleTypes
              ?.map((vehicle) => ManufactureVehicleTypesEntity(vehicle.isPrimary, vehicle.name))
              .toList() ??
          List.empty();

      return ManufactureEntity(
          manufacture.country, manufacture.mfrCommonname, manufacture.mfrId, manufacture.mfrName, mapVehicleList);
    }).toList();
    return AllManufacturesEntity(mapList);
  }

  List<Manufactory> mapManufacturesEntity(AllManufacturesEntity entity) {
    return entity.entities
        .map((entity) => Manufactory(entity.country, entity.mfrCommonname, entity.mfrId, entity.mfrName,
            entity.vehicleTypes.map((vehicle) => ManufactoryVehicleTypes(vehicle.isPrimary, vehicle.name)).toList()))
        .toList();
  }

  ManufactoryDetails? mapDetailsResponse(ManufactoryDetailsResponse response) {
    final ManufactoryDetailsResponseResults result;
    if ((response.results?.length ?? 0) > 0) {
      result = response.results!.first;
    } else {
      return null;
    }
    return ManufactoryDetails(
        result.manufacturerTypes?.map((type) => ManufactoryDetailsTypes(type.name)).toList(),
        result.mfrCommonname,
        result.mfrId,
        result.mfrName,
        result.vehicleTypes
            .map((type) => ManufactoryDetailsVehicleTypes(type.gVWRFrom, type.gVWRTo, type.isPrimary, type.name))
            .toList());
  }

  ManufactoryDetailsEntity mapManufactoryDetails(ManufactoryDetails details) {
    return ManufactoryDetailsEntity(
        details.manufactoryTypes?.map((type) => ManufactoryDetailsEntityTypes(type.name)).toList(),
        details.mfrCommonname,
        details.mfrId,
        details.mfrName,
        details.vehicleTypes
            .map((type) => ManufactoryDetailsEntityVehicleTypes(type.gVWRFrom, type.gVWRTo, type.isPrimary, type.name))
            .toList());
  }

  ManufactoryDetails mapManufacturesDetailsEntity(ManufactoryDetailsEntity entity) {
    return ManufactoryDetails(
        entity.manufacturerTypes?.map((type) => ManufactoryDetailsTypes(type.name)).toList(),
        entity.mfrCommonname,
        entity.mfrId,
        entity.mfrName,
        entity.vehicleTypes
            .map((type) => ManufactoryDetailsVehicleTypes(type.gVWRFrom, type.gVWRTo, type.isPrimary, type.name))
            .toList());
  }
}
