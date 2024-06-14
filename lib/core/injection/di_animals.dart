import 'package:get_it/get_it.dart';

import '/feactures/animal/data/datasources/datasources.dart';
import '/feactures/animal/domain/repository/repository.dart';
import '/feactures/animal/domain/use_cases/use_cases.dart';
import '/feactures/animal/data/repository/repository.dart';
import '/feactures/animal/presentation/blocs/blocs.dart';

final diAnimal = GetIt.instance;

Future<void> init() async {
  //DataSource
  diAnimal.registerLazySingleton<AnimalRemoteDataSource>(
      () => AnimalRemoteDataSourceImplt());

  diAnimal.registerLazySingleton<AnimalLocalDataSource>(
      () => HiveAnimalLocalDataSourceImpl());

  //Repository
  diAnimal.registerLazySingleton<AnimalsRepository>(() => AnimalsRepositoryImp(
        animalLocalDataSource: diAnimal(),
        animalRemoteDataSource: diAnimal(),
      ));

  //UseCase
  diAnimal.registerLazySingleton(() => GetInfoAnimalUseCase(animalsRepository: diAnimal()));

  diAnimal.registerLazySingleton(() => GetListAnimalsPageUseCase(animalsRepository: diAnimal()));
  
  diAnimal.registerLazySingleton(() => GetListFavoritesAnimalUseCase(animalsRepository: diAnimal()));
  
  diAnimal.registerLazySingleton(() => SaveAnimalFavoriteUseCase(animalsRepository: diAnimal()));


  //Bloc
  diAnimal.registerFactory(() => AnimalsListBloc(diAnimal(), diAnimal()));
}
