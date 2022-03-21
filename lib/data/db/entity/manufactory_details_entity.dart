import 'package:hive_flutter/hive_flutter.dart';

import 'entity_types.dart';
part 'manufacture_details_entity.g.dart';

@HiveType(typeId: MANUFACTORY_DETAILS_ENTITY_TYPE_ID)
class ManufactoryDetailsEntity {
  @HiveField(0)
  List<ManufactoryDetailsEntityTypes>? manufacturerTypes;
  @HiveField(1)
  String? mfrCommonname;
  @HiveField(2)
  int mfrId;
  @HiveField(3)
  String mfrName;
  @HiveField(4)
  List<ManufactoryDetailsEntityVehicleTypes> vehicleTypes;

  ManufactoryDetailsEntity(
      this.manufacturerTypes, this.mfrCommonname, this.mfrId, this.mfrName, this.vehicleTypes);
}

@HiveType(typeId: MANUFACTORY_DETAILS_TYPES_TYPE_ID)
class ManufactoryDetailsEntityTypes {
  @HiveField(0)
  String name;

  ManufactoryDetailsEntityTypes(this.name);
}

@HiveType(typeId: MANUFACTORY_DETAILS_VEHICLE_TYPES_TYPE_ID)
class ManufactoryDetailsEntityVehicleTypes {
  @HiveField(0)
  String? gVWRFrom;
  @HiveField(1)
  String? gVWRTo;
  @HiveField(2)
  bool? isPrimary;
  @HiveField(3)
  String name;

  ManufactoryDetailsEntityVehicleTypes(this.gVWRFrom, this.gVWRTo, this.isPrimary, this.name);
}
