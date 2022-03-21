import 'dart:convert';

import 'package:http/http.dart';
import 'package:test_project/data/api/response/all_manufactures_response.dart';
import 'package:test_project/data/api/response/api_response.dart';
import 'package:test_project/data/base/result.dart';

import 'response/manufactory_details_response.dart';

typedef RequestCondition = Future<Response> Function();
typedef ResultCondition<T extends ApiResponse> = T Function(dynamic json);

class ApiClient {
  final base_url = "https://vpic.nhtsa.dot.gov/api/";

  final Client _client;

  ApiClient(this._client);

  Future<Result<AllManufacturesResponse>> loadManufactures(int page) async {
    final response = await _makeRequest(
        () => _client.get(Uri.parse(base_url + "vehicles/getallmanufacturers?format=json&page=$page")));
    return _mapResult(response, (json) => AllManufacturesResponse(json));
  }

  Future<Result<ManufactoryDetailsResponse>> loadManufacture(int id) async {
    final response =
        await _makeRequest(() => _client.get(Uri.parse(base_url + "vehicles/getmanufacturerdetails/$id?format=json")));
    return _mapResult<ManufactoryDetailsResponse>(response, (json) => ManufactoryDetailsResponse(json));
  }

  Result<T> _mapResult<T extends ApiResponse>(Result<Map<String, dynamic>> response, ResultCondition<T> resultCondition) {
    if (response.value != null) {
      final result = resultCondition.call(response.value!);
      if (result.error != null) {
        return Result(error: result.error);
      }
      return Result(value: result);
    }
    return Result(error: response.error);
  }

  Future<Result<Map<String, dynamic>>> _makeRequest(RequestCondition request) async {
    try {
      final result = await request.call().timeout(Duration(seconds: 30));
      if (result.statusCode == 200) {
        var jsonResponse = jsonDecode(result.body) as Map<String, dynamic>;
        return Result(value: jsonResponse);
      }
      return Result(error: 'No internet exception');
    } catch (e) {
      print(e.toString());
      return Result(error: 'No internet exception');
    }
  }
}
