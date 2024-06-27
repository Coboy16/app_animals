import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '/core/errors/errors.dart';
import '/feactures/animal/domain/entities/entities.dart';
import '/feactures/animal/domain/use_cases/use_cases.dart';

part 'animals_list_event.dart';
part 'animals_list_state.dart';

class AnimalsListBloc extends Bloc<AnimalsListEvent, AnimalsListState> {
  final GetInfoAnimalUseCase _getInfoAnimalUseCase;
  final GetListAnimalsPageUseCase _getListAnimalsPageUseCase;

  AnimalsListBloc(this._getInfoAnimalUseCase, this._getListAnimalsPageUseCase)
      : super(const AnimalsListState()) {
    //Retorna la informacion de una animal
    on<GetInfoAnimalIdEvent>((event, emit) async {
      emit(state.copyWith(isLoadingAnimal: true));
      final resp = await _getInfoAnimalUseCase(event.id);

      resp.fold(
        (failure) => emit(state.copyWith(failure: failure)),
        (animal) => emit(state.copyWith(animalInfo: animal)),
      );

      emit(state.copyWith(isLoadingAnimal: false));
    });

    on<GetListAnimalsTypeAndPageEvent>((event, emit) async {
      emit(state.copyWith(isLoadingList: true));

      void notIsDateList() {
        add(const UpdateIsNotDateEvent(true));
        add(UpdateListPageDogEvent(event.page - 1));
        emit(state.copyWith(isLoadingList: false));
      }

      // Verifica si es la primera página para cargar las dos primeras páginas
      if (event.page == 1) {
        emit(state.copyWith(initFirtList: true));
        final resptListFirt = await _firstListAnimals(event.page, event.type);

        resptListFirt.fold(
          (failure) => emit(state.copyWith(failure: failure)),
          (listFirtAnimal) {
            switch (event.type) {
              case 'dogs':
                emit(state.copyWith(listPageDogs: listFirtAnimal));
                add(UpdateListPageDogEvent(event.page + 1));
                add(const ReadyMovePageEvent(true));
                emit(state.copyWith(isLoadingList: false));
                break;
              case 'cats':
                emit(state.copyWith(listPageCats: listFirtAnimal));
                add(UpdateListPageCatsEvent(event.page + 1));
                emit(state.copyWith(initFirtList: false));
                emit(state.copyWith(isLoadingList: false));
                break;
              case 'bunnys':
                emit(state.copyWith(listPageBunnys: listFirtAnimal));
                add(UpdateListPageBunnyEvent(event.page + 1));
                emit(state.copyWith(isLoadingList: false));
                break;
              case 'birds':
                emit(state.copyWith(listPageBirds: listFirtAnimal));
                add(UpdateListPageBirdsEvent(event.page + 1));
                emit(state.copyWith(isLoadingList: false));
                break;
              case 'mouses':
                emit(state.copyWith(listPageMouses: listFirtAnimal));
                add(UpdateListPageMousesEvent(event.page + 1));
                emit(state.copyWith(isLoadingList: false));
                break;
            }
          },
        );
      } else {
        // Maneja las peticiones subsecuentes y la actualización de las listas
        final respList = await _getListAnimalsPageUseCase(event.type, event.page);

        await respList.fold(
          (failure) async => emit(state.copyWith(failure: failure)),
          (listAnimal) async {
            switch (event.type) {
              case 'dogs':
                if (listAnimal.isEmpty) {
                  notIsDateList();
                } else {
                  final List<Animal> updatedList = List.from(state.listPageDogs)..addAll(listAnimal);
                  emit(state.copyWith(listPageDogs: updatedList));
                  add(UpdateListPageDogEvent(event.page));
                  emit(state.copyWith(isLoadingList: false));
                }
                break;
              case 'cats':
                if (listAnimal.isEmpty) {
                  notIsDateList();
                } else {
                  final List<Animal> updatedList = List.from(state.listPageCats)..addAll(listAnimal);
                  emit(state.copyWith(listPageCats: updatedList));
                  add(UpdateListPageCatsEvent(event.page));
                  emit(state.copyWith(isLoadingList: false));
                }
                break;
              case 'bunnys':
                if (listAnimal.isEmpty) {
                  notIsDateList();
                } else {
                  final List<Animal> updatedList = List.from(state.listPageBunnys)..addAll(listAnimal);
                  emit(state.copyWith(listPageBunnys: updatedList));
                  emit(state.copyWith(isLoadingList: false));
                }
                break;
              case 'birds':
                if (listAnimal.isEmpty) {
                  notIsDateList();
                } else {
                  final List<Animal> updatedList = List.from(state.listPageBirds)..addAll(listAnimal);
                  emit(state.copyWith(listPageBirds: updatedList));
                  emit(state.copyWith(isLoadingList: false));
                }
                break;
              case 'mouses':
                if (listAnimal.isEmpty) {
                  notIsDateList();
                } else {
                  final List<Animal> updatedList = List.from(state.listPageMouses)..addAll(listAnimal);
                  emit(state.copyWith(listPageMouses: updatedList));
                  emit(state.copyWith(isLoadingList: false));
                }
                break;
            }
          },
        );
      }
    });

    //Cambia el estado si no trae data de la lista
    on<UpdateIsNotDateEvent>((event, emit) => emit(state.copyWith(isNoDate: event.isNotData)));
    
    //Cambia de estado para poder pasar al home
    on<ReadyMovePageEvent>((event, emit) => emit(state.copyWith(navationHome: event.isReady)));

    //Loading inicial al cargar la lista
    on<InitFirtListEvent>((event, emit) => emit(state.copyWith(initFirtList: event.initList)));


    //Actualiza las paginas del tipo de animal
    on<UpdateListPageDogEvent>((event, emit) => emit(state.copyWith(numerPageDog: event.updatePage)));
    on<UpdateListPageCatsEvent>((event, emit) => emit(state.copyWith(numerPageCats: event.updatePage)));
    on<UpdateListPageBunnyEvent>((event, emit) => emit(state.copyWith(numerPageBunny: event.updatePage)));
    on<UpdateListPageBirdsEvent>((event, emit) => emit(state.copyWith(numerPageBirds: event.updatePage)));
    on<UpdateListPageMousesEvent>((event, emit) => emit(state.copyWith(numerPageMouses: event.updatePage)));
  }

  //Trae los listado de data es decir 8 elementos en la lista
  Future<Either<Failure, List<Animal>>> _firstListAnimals(int pageAnimal, String type) async {
    List<Animal> listCombined = [];

    try {
      final respList = await _getListAnimalsPageUseCase(type, pageAnimal);

      return await respList.fold(
        (failure) => Left(failure),
        (listAnimal) async {
          listCombined = listAnimal;

          // Realiza la segunda petición
          final respListTwo = await _getListAnimalsPageUseCase(type, pageAnimal + 1);

          return respListTwo.fold(
            (failure) => Left(failure),
            (listAnimalTwo) {
              listCombined.addAll(listAnimalTwo);
              return Right(listCombined);
            },
          );
        },
      );
    } on ServerFailure {
      return Left(ServerFailure());
    }
  }
}
