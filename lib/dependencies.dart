import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:test_project/data/api/api_client.dart';
import 'package:test_project/data/db/dao_manufactory.dart';
import 'package:test_project/data/db/database.dart';
import 'package:test_project/data/mapper/mapper_manufactory.dart';
import 'package:test_project/data/repository/repository_manufactory.dart';
import 'package:test_project/pages/details/details_cubit.dart';
import 'package:test_project/pages/list/list_cubit.dart';

configDependencies() {
  final it = GetIt.instance;
  it.registerFactory(() => Client());
  it.registerSingleton(ApiClient(it.get()));
  it.registerSingleton(Database());
  it.registerFactory(() => DaoManufactory(it.get()));
  it.registerFactory(() => MapperManufactory());
  it.registerSingleton(ManufactoryRepository(it.get(), it.get(), it.get()));
  it.registerFactory(() => ListCubit(it.get()));

  it.registerFactory(() => DetailsCubit(it.get()));
}