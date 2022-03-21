import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test_project/data/api/api_client.dart';

import 'api_client_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  final client = MockClient();
  final ApiClient api = new ApiClient(client);

  test('loadManufactures success', () async {
    final page = 1;

    final file = new File('test_resources/getallmanufacturers_success.json');
    final testResponse = http.Response(file.readAsStringSync(), 200, headers: {
      HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
    });

    when(client.get(Uri.parse(api.base_url + "vehicles/getallmanufacturers?format=json&page=$page")))
        .thenAnswer((_) async => testResponse);

    final result = await api.loadManufactures(page);
    expect(result.error, isNull);
    expect(result.value, isNotNull);
    expect(result.value!.results, isNotNull);
    expect(result.value!.results!.isNotEmpty, true);
    expect(result.value!.results!.first, isNotNull);
  });

  test('loadManufactures error', () async {
    final page = 1;

    final file = new File('test_resources/getallmanufacturers_error.json');
    final testResponse = http.Response(file.readAsStringSync(), 200, headers: {
      HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
    });

    when(client.get(Uri.parse(api.base_url + "vehicles/getallmanufacturers?format=json&page=$page")))
        .thenAnswer((_) async => testResponse);

    final result = await api.loadManufactures(page);
    expect(result.error, isNotNull);
    expect(result.value, isNull);
  });

  test('loadManufactures empty', () async {
    final page = 1;

    final file = new File('test_resources/getallmanufacturers_empty.json');
    final testResponse = http.Response(file.readAsStringSync(), 200, headers: {
      HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
    });

    when(client.get(Uri.parse(api.base_url + "vehicles/getallmanufacturers?format=json&page=$page")))
        .thenAnswer((_) async => testResponse);

    final result = await api.loadManufactures(page);
    expect(result.error, isNull);
    expect(result.value, isNotNull);
  });

  test('loadManufacture success', () async {
    int id = 1;
    final file = new File('test_resources/getmanufacturerdetails_success.json');
    final testResponse = http.Response(file.readAsStringSync(), 200, headers: {
      HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
    });

    when(client.get(Uri.parse(api.base_url + "vehicles/getmanufacturerdetails/$id?format=json")))
        .thenAnswer((_) async => testResponse);

    final result = await api.loadManufacture(id);
    expect(result.error, isNull);
    expect(result.value, isNotNull);
  });

  test('loadManufacture empty', () async {
    int id = 1;
    final file = new File('test_resources/getmanufacturerdetails_empty.json');
    final testResponse = http.Response(file.readAsStringSync(), 200, headers: {
      HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
    });

    when(client.get(Uri.parse(api.base_url + "vehicles/getmanufacturerdetails/$id?format=json")))
        .thenAnswer((_) async => testResponse);

    final result = await api.loadManufacture(id);
    expect(result.error, isNull);
    expect(result.value, isNotNull);
  });
}
