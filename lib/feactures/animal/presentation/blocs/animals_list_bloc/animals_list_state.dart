part of 'animals_list_bloc.dart';

class AnimalsListState extends Equatable {
  final bool isLoadingList;
  final bool isLoadingAnimal;
  final Animal? animalInfo;
  final List<Animal> listPageAnimal;
  final Failure? failure;

  const AnimalsListState({
    this.isLoadingAnimal = false, 
    this.isLoadingList   = false,
    this.listPageAnimal  = const [],
    this.animalInfo,
    this.failure,
  });

  AnimalsListState copyWith({
    bool? isLoadingAnimal,
    bool? isLoadingList,
    Animal? animalInfo,
    List<Animal>? listPageAnimal,
    Failure? failure,
  }) =>
      AnimalsListState(
        isLoadingList: isLoadingList ?? this.isLoadingList,
        isLoadingAnimal: isLoadingAnimal ?? this.isLoadingAnimal,
        animalInfo: animalInfo ?? this.animalInfo,
        listPageAnimal: listPageAnimal ?? this.listPageAnimal,
        failure: failure ?? this.failure,
      );

  @override
  List<Object?> get props => [
        isLoadingList,
        isLoadingAnimal,
        animalInfo,
        listPageAnimal,
        failure,
      ];
}
