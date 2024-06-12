import 'package:hive_flutter/hive_flutter.dart';

import '/feactures/animal/domain/entities/entities.dart';
import '/feactures/animal/data/models/models.dart';
import '/core/errors/errors.dart';

abstract class AnimalLocalDataSource {
  Future<bool> saveFavoriteAnimal(Animal animal);
  Future<List<Animal>> getListAnimalFavorites();
}

class HiveAnimalLocalDataSourceImpl extends AnimalLocalDataSource {
  HiveAnimalLocalDataSourceImpl() {
    Hive.initFlutter();
  }

  //Guarda un animal localmente con su id
  @override
  Future<bool> saveFavoriteAnimal(Animal animal) async {
    try {
      Box<dynamic> box = await Hive.openBox('animals');
      box.put(animal.id, AnimalModel.formEntities(animal).toJson());
      return true;
    } catch (e) {
      throw LocalFailure();
    }
  }

  //Retorna los animales guardados en la base local
  @override
  Future<List<Animal>> getListAnimalFavorites() async {
    try {
      Box<dynamic> box = await Hive.openBox('animals');
      return box.values.map((animal) => AnimalModel.fromJson(animal)).toList();
    } catch (e) {
      throw LocalFailure();
    }
  }
}
