import 'package:hive_flutter/hive_flutter.dart';

import '/feactures/animal/domain/entities/entities.dart';
import '/feactures/animal/data/models/models.dart';
import '/core/errors/errors.dart';

abstract class AnimalLocalDataSource {
  Future<List<Animal>> getListAnimalFavorites();
  Future<bool> addFavoriteAnimal(Animal animal);
  Future<bool> removeFavoriteAnimal(String id);
  Future<bool> isFavoriteAnimal(String id);
}

class HiveAnimalLocalDataSourceImpl extends AnimalLocalDataSource {
  HiveAnimalLocalDataSourceImpl() {
    Hive.initFlutter();
  }

  //todo:Retorna los animales guardados en la base local
  @override
  Future<List<Animal>> getListAnimalFavorites() async {
    try {
      Box<dynamic> box = await Hive.openBox('animals');
      return box.values.map((animal) => AnimalModel.fromJson(animal)).toList();
    } catch (e) {
      throw LocalFailure();
    }
  }

  //todo:Guarda un animal localmente con su id
  @override
  Future<bool> addFavoriteAnimal(Animal animal) async {
    try {
      Box<dynamic> box = await Hive.openBox('animals');
      if (!box.containsKey(animal.id)) {
        await box.put(animal.id, AnimalModel.formEntities(animal).toJson());
        return true;
      }
      return false;
    } catch (e) {
      throw LocalFailure();
    }
  }
  
  @override
  Future<bool> isFavoriteAnimal(String id) async {
    try {
      Box<dynamic> box = await Hive.openBox('animals');
      return box.containsKey(id);
    } catch (e) {
      throw LocalFailure();
    }
  }
  
  @override
  Future<bool> removeFavoriteAnimal(String id) async {
    try {
      Box<dynamic> box = await Hive.openBox('animals');
      await box.delete(id);
      return true;
    } catch (e) {
      throw LocalFailure();
    }
  }
}
