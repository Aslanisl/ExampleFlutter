import 'package:hive_flutter/hive_flutter.dart';

import 'entity/all_manufactures_entity.dart';
import 'entity/manufactory_details_entity.dart';

class Database {
  bool _inited = false;

  _checkInit() async {
    if (_inited) {
      return;
    }
    await Hive.initFlutter();
    Hive.registerAdapter(AllManufacturesEntityAdapter());
    Hive.registerAdapter(ManufactureEntityAdapter());
    Hive.registerAdapter(ManufactureVehicleTypesEntityAdapter());

    Hive.registerAdapter(ManufactureDetailsEntityAdapter());
    Hive.registerAdapter(ManufactureDetailsTypesAdapter());
    Hive.registerAdapter(ManufactureDetailsVehicleTypesAdapter());
    _inited = true;
  }

  Future<dynamic> get(String boxName, dynamic key) async {
    await _checkInit();
    return (await _getBox(boxName)).get(key);
  }

  Future<void> put(String boxName, dynamic key, dynamic entity) async {
    await _checkInit();
    (await _getBox(boxName)).put(key, entity);
  }

  Future<Box> _getBox(String name) async {
    return await Hive.openBox(name);
  }
}