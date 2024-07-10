import 'package:dartz/dartz.dart';

import 'package:dog_app/core/errors/errors.dart';
import 'package:dog_app/feactures/animal/domain/repository/repository.dart';

class IsFavoriteAnimalUseCase {
  final AnimalsRepository animalsRepository;

  IsFavoriteAnimalUseCase({required this.animalsRepository});

  Future<Either<Failure, bool>> call(String id) =>
      animalsRepository.isFavoriteAnimal(id);
}
