import 'package:hive/hive.dart';
import 'package:test_project/data/db/entity/entity_types.dart';

part 'all_manufactures_entity.g.dart';

@HiveType(typeId: ALL_MANUFACTURES_ENTITY_TYPE_ID)
class AllManufacturesEntity {
  @HiveField(0)
  List<ManufactureEntity> entities;

  AllManufacturesEntity(this.entities);
}

@HiveType(typeId: MANUFACTURE_ENTITY_TYPE_ID)
class ManufactureEntity {
  @HiveField(0)
  String? country;
  @HiveField(1)
  String? mfrCommonname;
  @HiveField(2)
  int mfrId;
  @HiveField(3)
  String mfrName;
  @HiveField(4)
  List<ManufactureVehicleTypesEntity> vehicleTypes;

  ManufactureEntity(this.country, this.mfrCommonname, this.mfrId, this.mfrName, this.vehicleTypes);
}

@HiveType(typeId: MANUFACTURE_VEHICLE_TYPES_TYPE_ID)
class ManufactureVehicleTypesEntity {
  @HiveField(0)
  bool? isPrimary;
  @HiveField(1)
  String? name;

  ManufactureVehicleTypesEntity(this.isPrimary, this.name);
}
