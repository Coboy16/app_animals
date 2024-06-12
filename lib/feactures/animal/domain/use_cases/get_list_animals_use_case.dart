import 'package:dartz/dartz.dart';

import '/core/errors/errors.dart';
import '/feactures/animal/domain/repository/repository.dart';
import '/feactures/animal/domain/entities/entities.dart';

class GetListAnimalsPageUseCase {
  final AnimalsRepository animalsRepository;

  GetListAnimalsPageUseCase({required this.animalsRepository});

  Future<Either<Failure, List<Animal>>> call(String type, int page) =>
      animalsRepository.getListAnimals(type, page);
}
