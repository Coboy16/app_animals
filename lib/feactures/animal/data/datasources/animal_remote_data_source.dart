import 'package:dio/dio.dart';

import '/feactures/animal/domain/entities/entities.dart';
import '/feactures/animal/data/models/models.dart';
import '/core/errors/errors.dart';
import '/core/utils/utils.dart';

abstract class AnimalRemoteDataSource {
  Future<Animal> getInfoAnimal(String id);
  Future<AnimalPageModel> getListAnimalPage(String type, int page);
}

class AnimalRemoteDataSourceImplt extends AnimalRemoteDataSource {
  final Dio dio = Dio();
  @override
  Future<AnimalModel> getInfoAnimal(String id) async {
    final String url = '$apiAnimal/$id';    
    final response = await dio.get(url);

    if (response.statusCode == 200) {
      return AnimalModel.fromJson(response.data);
    } else {
      //TODO:MEJORAR EL SERVERFAILURE
      throw ServerFailure();
    }
  }

  @override
  Future<AnimalPageModel> getListAnimalPage(String type, int page) async {
    final String url = '$apiAnimal/$type/${page.toString()}';
    final response = await dio.get(url);

    if (response.statusCode == 200) {
      return AnimalPageModel.fromJson(response.data);
    } else {
      throw ServerFailure();
    }
  }
}
