import 'package:dartz/dartz.dart';

import 'package:dog_app/core/errors/errors.dart';
import 'package:dog_app/feactures/animal/domain/entities/entities.dart';

abstract class AnimalsRepository {
  //todo: Remote Data
  //Trae la lista de la API, segun el typo de animal y su pagina
  Future<Either<Failure, List<Animal>>> getListAnimals(String type, int page);
  //Retorna la informacion del animal de la API
  Future<Either<Failure, Animal>> getAnimal(String id);

  //todo: Local Data
  //Retorna la lista de animales guardados localmente
  Future<Either<Failure, List<Animal>>> getListAnimalsFavorites();
  //Remueve un animal de la lista de favoritos localmente
  Future<Either<Failure, bool>> removeFavoriteAnimal(String id);
  //Verifica si un animal es favarito
  Future<Either<Failure, bool>> isFavoriteAnimal(String id);
  //Guarda el animal localmente
  Future<Either<Failure, bool>> addFavoriteAnimal(Animal animal);

}
