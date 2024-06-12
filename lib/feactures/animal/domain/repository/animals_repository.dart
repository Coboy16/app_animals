import 'package:dartz/dartz.dart';

import 'package:dog_app/core/errors/errors.dart';
import 'package:dog_app/feactures/animal/domain/entities/entities.dart';

abstract class AnimalsRepository {
  //Trae la lista de la API, segun el typo de animal y su pagina
  Future<Either<Failure, List<Animal>>> getListAnimals(String type, int page);
  //Retorna la informacion del animal de la API
  Future<Either<Failure, Animal>> getAnimal(String id);
  //Guarda el animal localmente
  Future<Either<Failure, bool>> saveAnimalFavorite(Animal animal);
  //Retorna la lista de animales guardados localmente
  Future<Either<Failure, List<Animal>>> getListAnimalsFavorites();
}
