// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manufactory_details_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ManufactureDetailsEntityAdapter
    extends TypeAdapter<ManufactoryDetailsEntity> {
  @override
  final int typeId = 3;

  @override
  ManufactoryDetailsEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ManufactoryDetailsEntity(
      (fields[0] as List?)?.cast<ManufactoryDetailsEntityTypes>(),
      fields[1] as String?,
      fields[2] as int,
      fields[3] as String,
      (fields[4] as List).cast<ManufactoryDetailsEntityVehicleTypes>(),
    );
  }

  @override
  void write(BinaryWriter writer, ManufactoryDetailsEntity obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.manufacturerTypes)
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
      other is ManufactureDetailsEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ManufactureDetailsTypesAdapter
    extends TypeAdapter<ManufactoryDetailsEntityTypes> {
  @override
  final int typeId = 4;

  @override
  ManufactoryDetailsEntityTypes read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ManufactoryDetailsEntityTypes(
      fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ManufactoryDetailsEntityTypes obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ManufactureDetailsTypesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ManufactureDetailsVehicleTypesAdapter
    extends TypeAdapter<ManufactoryDetailsEntityVehicleTypes> {
  @override
  final int typeId = 5;

  @override
  ManufactoryDetailsEntityVehicleTypes read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ManufactoryDetailsEntityVehicleTypes(
      fields[0] as String?,
      fields[1] as String?,
      fields[2] as bool?,
      fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ManufactoryDetailsEntityVehicleTypes obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.gVWRFrom)
      ..writeByte(1)
      ..write(obj.gVWRTo)
      ..writeByte(2)
      ..write(obj.isPrimary)
      ..writeByte(3)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ManufactureDetailsVehicleTypesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
