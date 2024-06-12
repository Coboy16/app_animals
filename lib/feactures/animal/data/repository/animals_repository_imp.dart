import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '/feactures/animal/domain/entities/animals_entities.dart';
import '/feactures/animal/domain/repository/repository.dart';
import '/feactures/animal/data/datasources/datasources.dart';
import '/core/errors/failure.dart';

class AnimalsRepositoryImp implements AnimalsRepository {
  final AnimalRemoteDataSource animalRemoteDataSource;
  final AnimalLocalDataSource animalLocalDataSource;

  AnimalsRepositoryImp({
    required this.animalRemoteDataSource,
    required this.animalLocalDataSource,
  });

  @override
  Future<Either<Failure, Animal>> getAnimal(String id) async {
    try {
      final Animal respAnimal = await animalRemoteDataSource.getInfoAnimal(id);
      return Right(respAnimal);
    } on DioException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Animal>>> getListAnimals(String type, int page) async {
    try {
      final List<Animal> listPage = await animalRemoteDataSource.getListAnimalPage(type, page);
      return Right(listPage);
    } on DioException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Animal>>> getListAnimalsFavorites() async {
    try {
      final List<Animal> listFavo = await animalLocalDataSource.getListAnimalFavorites();
      return Right(listFavo);
    } on LocalFailure {
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> saveAnimalFavorite(Animal animal) async {
    try {
      final bool respSave = await animalLocalDataSource.saveFavoriteAnimal(animal);
      return Right(respSave);
    } on LocalFailure {
      return Left(LocalFailure());
    }
  }
}
