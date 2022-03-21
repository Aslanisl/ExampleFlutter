// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_manufactures_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AllManufacturesEntityAdapter extends TypeAdapter<AllManufacturesEntity> {
  @override
  final int typeId = 0;

  @override
  AllManufacturesEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AllManufacturesEntity(
      (fields[0] as List).cast<ManufactureEntity>(),
    );
  }

  @override
  void write(BinaryWriter writer, AllManufacturesEntity obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.entities);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AllManufacturesEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ManufactureEntityAdapter extends TypeAdapter<ManufactureEntity> {
  @override
  final int typeId = 1;

  @override
  ManufactureEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ManufactureEntity(
      fields[0] as String?,
      fields[1] as String?,
      fields[2] as int,
      fields[3] as String,
      (fields[4] as List).cast<ManufactureVehicleTypesEntity>(),
    );
  }

  @override
  void write(BinaryWriter writer, ManufactureEntity obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.country)
      ..writeByte(1)
      ..write(obj.mfrCommonname)
      ..writeByte(2)
      ..write(obj.mfrId)
      ..writeByte(3)
      ..write(obj.mfrName)
      ..writeByte(4)
      ..write(obj.vehicleTypes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ManufactureEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ManufactureVehicleTypesEntityAdapter
    extends TypeAdapter<ManufactureVehicleTypesEntity> {
  @override
  final int typeId = 2;

  @override
  ManufactureVehicleTypesEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ManufactureVehicleTypesEntity(
      fields[0] as bool?,
      fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ManufactureVehicleTypesEntity obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.isPrimary)
      ..writeByte(1)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ManufactureVehicleTypesEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
