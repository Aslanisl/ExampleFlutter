import 'package:test_project/data/db/database.dart';
import 'package:test_project/data/db/entity/manufactory_details_entity.dart';

import 'entity/all_manufactures_entity.dart';

class DaoManufactory {

  final Database database;

  DaoManufactory(this.database);

  Future<AllManufacturesEntity?> loadManufactures(int page) async {
    return await database.get('manufactures', page);
  }

  Future<void> saveManufactures(int page, AllManufacturesEntity entity) async {
    return await database.put('manufactures', page, entity);
  }

  Future<ManufactoryDetailsEntity?> loadManufactureDetails(int id) async {
    return await database.get('manufacture_details', id);
  }

  Future<void> saveManufactureDetails(int id, ManufactoryDetailsEntity entity) async {
    return await database.put('manufacture_details', id, entity);
  }
}
