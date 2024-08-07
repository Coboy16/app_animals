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
    } on DioException catch (e) {
      print('error:  $e');
      //TODO:MEJORAR
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Animal>>> getListAnimals(type, int page) async {
    try {
      final mapAnimal = await animalRemoteDataSource.getListAnimalPage(type, page);
      final List<Animal> listPage = mapAnimal.animalsListPage[type] ?? [];
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
  Future<Either<Failure, bool>> addFavoriteAnimal(Animal animal) async {
    try {
      final bool respSave = await animalLocalDataSource.addFavoriteAnimal(animal);
      return Right(respSave);
    } on LocalFailure {
      return Left(LocalFailure());
    }
  }
  
  @override
  Future<Either<Failure, bool>> isFavoriteAnimal(String id) async {
    try {
      final bool respSave = await animalLocalDataSource.isFavoriteAnimal(id);
      return Right(respSave);
    } on LocalFailure {
      return Left(LocalFailure());
    }
  }
  
  @override
  Future<Either<Failure, bool>> removeFavoriteAnimal(String id) async {
    try {
      final bool respSave = await animalLocalDataSource.removeFavoriteAnimal(id);
      return Right(respSave);
    } on LocalFailure {
      return Left(LocalFailure());
    }
  }
}
