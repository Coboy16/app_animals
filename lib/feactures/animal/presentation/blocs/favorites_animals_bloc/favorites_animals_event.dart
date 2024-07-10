part of 'favorites_animals_bloc.dart';

sealed class FavoritesAnimalsEvent extends Equatable {
  const FavoritesAnimalsEvent();

  @override
  List<Object> get props => [];
}

class UpdateListAnimalFavoritesEvent extends FavoritesAnimalsEvent {}

class ErrorFailureEvent extends FavoritesAnimalsEvent {
  final Failure failure;
  const ErrorFailureEvent(this.failure);
}


class AddFavoriteAnimalEvent extends FavoritesAnimalsEvent {
  final Animal animal;
  const AddFavoriteAnimalEvent({required this.animal});
}

class RemoveAnimalIsFavoriteEvent extends FavoritesAnimalsEvent {
  final String id;
  const RemoveAnimalIsFavoriteEvent(this.id);
}