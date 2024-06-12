import 'package:dartz/dartz.dart';

import 'package:dog_app/core/errors/errors.dart';
import 'package:dog_app/feactures/animal/domain/entities/entities.dart';
import 'package:dog_app/feactures/animal/domain/repository/repository.dart';

class SaveAnimalFavoriteUseCase {
  final AnimalsRepository animalsRepository;

  SaveAnimalFavoriteUseCase({required this.animalsRepository});

  Future<Either<Failure, bool>> call(Animal animal) =>
      animalsRepository.saveAnimalFavorite(animal);
}
