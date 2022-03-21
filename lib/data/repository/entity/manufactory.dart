class Manufactory {
  String? country;
  String? mfrCommonname;
  int mfrId;
  String mfrName;
  List<ManufactoryVehicleTypes>? vehicleTypes;

  Manufactory(this.country, this.mfrCommonname, this.mfrId, this.mfrName, this.vehicleTypes);

  @override
  String toString() {
    return 'Manufactory{country: $country, mfrCommonname: $mfrCommonname, mfrId: $mfrId, mfrName: $mfrName, vehicleTypes: $vehicleTypes}';
  }
}

class ManufactoryVehicleTypes {
  bool? isPrimary;
  String? name;

  ManufactoryVehicleTypes(this.isPrimary, this.name);
}
