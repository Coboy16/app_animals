import 'package:dartz/dartz.dart';

import 'package:dog_app/core/errors/errors.dart';
import 'package:dog_app/feactures/animal/domain/entities/entities.dart';
import 'package:dog_app/feactures/animal/domain/repository/repository.dart';

class GetListFavoritesAnimalUseCase {
  final AnimalsRepository animalsRepository;

  GetListFavoritesAnimalUseCase({required this.animalsRepository});

  Future<Either<Failure, List<Animal>>> call() =>
      animalsRepository.getListAnimalsFavorites();
}
