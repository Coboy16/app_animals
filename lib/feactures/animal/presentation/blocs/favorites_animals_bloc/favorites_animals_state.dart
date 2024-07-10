part of 'favorites_animals_bloc.dart';

class FavoritesAnimalsState extends Equatable {
  final List<Animal> listFavorites;
  final bool isFavoriteAnimal;
  final Failure? failure;

  const FavoritesAnimalsState({
    this.failure, 
    this.isFavoriteAnimal = false, 
    this.listFavorites = const []
  });

  FavoritesAnimalsState copyWith({
    List<Animal>? listFavorites,
    bool? isFavoriteAnimal,
    Failure? failure
  }) =>
      FavoritesAnimalsState(
        listFavorites: listFavorites ?? this.listFavorites, 
        isFavoriteAnimal: isFavoriteAnimal ?? this.isFavoriteAnimal,
        failure: failure ?? this.failure
      );

  @override
  List<Object?> get props => [listFavorites , isFavoriteAnimal, failure];
}
