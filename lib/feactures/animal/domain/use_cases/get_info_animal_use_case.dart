import 'package:dartz/dartz.dart';

import '/core/errors/errors.dart';
import '/feactures/animal/domain/entities/entities.dart';
import '/feactures/animal/domain/repository/repository.dart';

class GetInfoAnimalUseCase {
  final AnimalsRepository animalsRepository;

  GetInfoAnimalUseCase({required this.animalsRepository});

  Future<Either<Failure, Animal>> call(String id) {
    return animalsRepository.getAnimal(id);
  }
}
