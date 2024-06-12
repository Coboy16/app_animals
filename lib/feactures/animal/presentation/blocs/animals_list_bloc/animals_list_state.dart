part of 'animals_list_bloc.dart';

class AnimalsListState extends Equatable {
  final bool isLoading;
  final Animal? animalInfo;
  final List<Animal> listPageAnimal;
  final Failure? failure;

  const AnimalsListState({
    this.isLoading = false,
    this.listPageAnimal = const [],
    this.animalInfo,
    this.failure,
  });

  AnimalsListState copyWith({
    bool? isLoading,
    Animal? animalInfo,
    List<Animal>? listPageAnimal,
    Failure? failure,
  }) =>
      AnimalsListState(
        isLoading: isLoading ?? this.isLoading,
        animalInfo: animalInfo ?? this.animalInfo,
        listPageAnimal: listPageAnimal ?? this.listPageAnimal,
        failure: failure ?? this.failure,
      );

  @override
  List<Object?> get props => [
        isLoading,
        animalInfo,
        listPageAnimal,
        failure,
      ];
}
