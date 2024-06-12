import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '/core/errors/errors.dart';
import '/feactures/animal/domain/entities/entities.dart';
import '/feactures/animal/domain/use_cases/use_cases.dart';

part 'animals_list_event.dart';
part 'animals_list_state.dart';

class AnimalsListBloc extends Bloc<AnimalsListEvent, AnimalsListState> {
  final GetInfoAnimalUseCase _getInfoAnimalUseCase;
  AnimalsListBloc(this._getInfoAnimalUseCase) : super(const AnimalsListState()) {
    on<GetInfoAnimalIdEvent>((event, emit) async {
      emit(state.copyWith(isLoadingAnimal: true));
      final resp = await _getInfoAnimalUseCase(event.id);

      resp.fold(
        (failure) => emit(state.copyWith(failure: failure)),
        (animal) => emit(state.copyWith(animalInfo: animal)),
      );
      print('data');
      print(state.animalInfo?.id);
      print(state.animalInfo?.name);
      print('data');

      emit(state.copyWith(isLoadingAnimal: false));
    });
  }
}
