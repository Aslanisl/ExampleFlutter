import 'package:test_project/data/api/api_client.dart';
import 'package:test_project/data/api/response/all_manufactures_response.dart';
import 'package:test_project/data/api/response/manufactory_details_response.dart';
import 'package:test_project/data/base/result.dart';
import 'package:test_project/data/db/dao_manufactory.dart';
import 'package:test_project/data/mapper/mapper_manufactory.dart';
import 'package:test_project/data/repository/entity/manufactory.dart';
import 'package:test_project/data/repository/entity/manufactory_details.dart';

class ManufactoryRepository {
  ApiClient _api;
  DaoManufactory _dao;
  MapperManufactory _mapper;

  ManufactoryRepository(this._api, this._dao, this._mapper);

  Future<Result<List<Manufactory>>> loadManufactures(int page) async {
    final entity = await _dao.loadManufactures(page);
    if (entity != null) {
      return Result(value: _mapper.mapManufacturesEntity(entity));
    }
    Result<AllManufacturesResponse> result = await _api.loadManufactures(page);
    if (result.value != null) {
      final manufactures = _mapper.mapResponse(result.value!);
      await _dao.saveManufactures(page, _mapper.mapManufactures(manufactures));
      return Result(value: manufactures);
    }
    return Result(error: result.error);
  }

  Future<Result<ManufactoryDetails?>> loadManufactureDetails(int id) async {
    final entity = await _dao.loadManufactureDetails(id);
    if (entity != null) {
      return Result(value: _mapper.mapManufacturesDetailsEntity(entity));
    }
    Result<ManufactoryDetailsResponse> result = await _api.loadManufacture(id);
    if (result.value != null) {
      final manufactoryDetails = _mapper.mapDetailsResponse(result.value!);
      if (manufactoryDetails != null) {
        await _dao.saveManufactureDetails(manufactoryDetails.mfrId, _mapper.mapManufactoryDetails(manufactoryDetails));
      }
      return Result(value: manufactoryDetails);
    }
    return Result(error: result.error);
  }
}
