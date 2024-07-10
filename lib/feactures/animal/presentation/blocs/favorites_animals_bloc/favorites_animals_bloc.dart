import 'package:bloc/bloc.dart';

import 'package:dog_app/core/errors/errors.dart';
import 'package:dog_app/feactures/animal/domain/entities/entities.dart';
import 'package:dog_app/feactures/animal/domain/use_cases/use_cases.dart';
import 'package:equatable/equatable.dart';

part 'favorites_animals_event.dart';
part 'favorites_animals_state.dart';

class FavoritesAnimalsBloc extends Bloc<FavoritesAnimalsEvent, FavoritesAnimalsState> {
  final GetListFavoritesAnimalUseCase _getListFavoritesAnimalUseCase;
  final IsFavoriteAnimalUseCase _isFavoriteAnimalUseCase;
  final RemoveFavoriteAnimalUseCase _removeFavoriteAnimalUseCase;
  final SaveAnimalFavoriteUseCase _saveAnimalFavoriteUseCase;

  FavoritesAnimalsBloc(
      this._getListFavoritesAnimalUseCase,
      this._isFavoriteAnimalUseCase,
      this._removeFavoriteAnimalUseCase,
      this._saveAnimalFavoriteUseCase)
      : super(const FavoritesAnimalsState()) {
    on<ErrorFailureEvent>(
        (event, emit) => emit(state.copyWith(failure: event.failure)));

    on<AddFavoriteAnimalEvent>((event, emit) async {
      final addAnimal = await _saveAnimalFavoriteUseCase(event.animal);
      addAnimal.fold(
        (failure) => emit(state.copyWith(failure: failure)),
        (addAnimal) => emit(state.copyWith(isFavoriteAnimal: addAnimal)),
      );
    });

    on<UpdateListAnimalFavoritesEvent>((event, emit) async {
      final list = await _getListFavoritesAnimalUseCase();
      list.fold(
        (failure) => emit(state.copyWith(failure: failure)),
        (list) => emit(state.copyWith(listFavorites: list)),
      );
    });

    on<RemoveAnimalIsFavoriteEvent>((event, emit) async {
      final addAnimal = await _removeFavoriteAnimalUseCase(event.id);
      addAnimal.fold(
        (failure) => emit(state.copyWith(failure: failure)),
        (removeAnimal) => emit(state.copyWith(isFavoriteAnimal: removeAnimal)),
      );
      add(UpdateListAnimalFavoritesEvent());
    });
  }

  //todo: Carga la data al iniciar
  void init() {
    add(UpdateListAnimalFavoritesEvent());
  }

  void toogleFavorite(Animal animal) async {
    final isFavorite = await isVerifidFavorite(animal.id);
    if (isFavorite) {
      // Agrego el animal a la lista de favoritos
      add(AddFavoriteAnimalEvent(animal: animal));
    } else {
      // Elimino el animal de la data
      add(RemoveAnimalIsFavoriteEvent(animal.id));
    }
  }

  Future<bool> isVerifidFavorite(String id) async {
    bool isFavorite = false;
    final resp = await _isFavoriteAnimalUseCase(id);

    resp.fold(
      (failure) => add(ErrorFailureEvent(failure)),
      (resp) { isFavorite = resp; },
    );

    return isFavorite;
  }
}
