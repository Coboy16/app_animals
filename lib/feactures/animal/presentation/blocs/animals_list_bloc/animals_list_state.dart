part of 'animals_list_bloc.dart';

class AnimalsListState extends Equatable {
  final bool isLoadingList;
  final bool isLoadingAnimal;
  final bool isNoDate;
  final Animal? animalInfo;
  final Failure? failure;
  final int numerPageDog;
  final int numerPageCats;
  final int numerPageBunny;
  final int numerPageBirds;
  final int numerPageMouses;
  final List<Animal> listPageDogs;
  final List<Animal> listPageCats;
  final List<Animal> listPageBunnys;
  final List<Animal> listPageBirds;
  final List<Animal> listPageMouses;

  const AnimalsListState({
    this.isLoadingAnimal = false,
    this.isLoadingList = false,
    this.isNoDate = false,
    this.animalInfo,
    this.failure,
    this.numerPageDog = 0,
    this.numerPageCats = 0,
    this.numerPageBunny = 0,
    this.numerPageBirds = 0,
    this.numerPageMouses = 0,
    this.listPageDogs = const [],
    this.listPageCats = const [],
    this.listPageBunnys = const [],
    this.listPageBirds = const [],
    this.listPageMouses = const [],
  });

  AnimalsListState copyWith({
    bool? isLoadingAnimal,
    bool? isLoadingList,
    bool? isNoDate,
    Animal? animalInfo,
    Failure? failure,
    int? numerPageDog,
    int? numerPageCats,
    int? numerPageBunny,
    int? numerPageBirds,
    int? numerPageMouses,
    List<Animal>? listPageDogs,
    List<Animal>? listPageCats,
    List<Animal>? listPageBunnys,
    List<Animal>? listPageBirds,
    List<Animal>? listPageMouses,
  }) =>
      AnimalsListState(
        isLoadingList: isLoadingList ?? this.isLoadingList,
        isLoadingAnimal: isLoadingAnimal ?? this.isLoadingAnimal,
        isNoDate: isNoDate ?? this.isNoDate,
        animalInfo: animalInfo ?? this.animalInfo,
        failure: failure ?? this.failure,
        numerPageDog: numerPageDog ?? this.numerPageDog,
        numerPageCats: numerPageCats ?? this.numerPageCats,
        numerPageBunny: numerPageBunny ?? this.numerPageBunny,
        numerPageBirds: numerPageBirds ?? this.numerPageBirds,
        numerPageMouses: numerPageMouses ?? this.numerPageMouses,
        listPageDogs: listPageDogs ?? this.listPageDogs,
        listPageCats: listPageCats ?? this.listPageCats,
        listPageBunnys: listPageBunnys ?? this.listPageBunnys,
        listPageBirds: listPageBirds ?? this.listPageBirds,
        listPageMouses: listPageMouses ?? this.listPageMouses,
      );

  @override
  List<Object?> get props => [
        isLoadingList,
        isLoadingAnimal,
        isNoDate,
        animalInfo,
        failure,
        numerPageDog,
        numerPageCats,
        numerPageBunny,
        numerPageBirds,
        numerPageMouses,
        listPageDogs,
        listPageCats,
        listPageBunnys,
        listPageBirds,
        listPageMouses,
      ];
}
