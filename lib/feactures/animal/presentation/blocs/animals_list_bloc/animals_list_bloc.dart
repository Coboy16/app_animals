import 'package:bloc/bloc.dart';
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
    //
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
      final respList = await _getListAnimalsPageUseCase(event.type, event.page);

      respList.fold(
        (failure) => emit(state.copyWith(failure: failure)),
        (listAnimal) => emit(state.copyWith(listPageAnimal: listAnimal)),
      );

      print('bloc');
      print('${state.listPageAnimal.length}');
      print('bloc');
      emit(state.copyWith(isLoadingList: false));
    });
  }
}
