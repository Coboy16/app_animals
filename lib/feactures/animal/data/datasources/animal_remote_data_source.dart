import 'package:dio/dio.dart';

import '/feactures/animal/domain/entities/entities.dart';
import '/feactures/animal/data/models/models.dart';
import '/core/errors/errors.dart';
import '/core/utils/utils.dart';

abstract class AnimalRemoteDataSource {
  Future<Animal> getInfoAnimal(String id);
  Future<List<Animal>> getListAnimalPage(String type, int page);
}

class AnimalRemoteDataSourceImplt extends AnimalRemoteDataSource {
  final Dio dio = Dio();
  @override
  Future<AnimalModel> getInfoAnimal(String id) async {
    final String url = '$apiAnimal/$id';
    final response = await dio.get(url);

    if (response.statusCode == 200) {
      final data = AnimalModel.fromJson(response.data);
      return data;
    } else {
      throw ServerFailure();
    }
  }

  @override
  Future<List<Animal>> getListAnimalPage(String type, int page) async {
    // final String url = '$apiAnimal/${page.toString()}';

    // final response = await dio.get(url);

    // if (response.statusCode == 200) {
    //   final data = AnimalModel.fromJson(response.data);
    //   return data;
    // } else {
    //   throw UnimplementedError();
    // }
    throw UnimplementedError();
  }
}
