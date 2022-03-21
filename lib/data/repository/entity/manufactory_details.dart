class ManufactoryDetails {
  List<ManufactoryDetailsTypes>? manufactoryTypes;
  String? mfrCommonname;
  int mfrId;
  String mfrName;
  List<ManufactoryDetailsVehicleTypes> vehicleTypes;

  ManufactoryDetails(this.manufactoryTypes, this.mfrCommonname, this.mfrId, this.mfrName, this.vehicleTypes);
}

class ManufactoryDetailsTypes {
  String name;

  ManufactoryDetailsTypes(this.name);
}

class ManufactoryDetailsVehicleTypes {
  String? gVWRFrom;
  String? gVWRTo;
  bool? isPrimary;
  String name;

  ManufactoryDetailsVehicleTypes(this.gVWRFrom, this.gVWRTo, this.isPrimary, this.name);
}
