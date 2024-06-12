import 'package:bloc/bloc.dart';
import 'package:dog_app/core/errors/errors.dart';
import 'package:dog_app/feactures/animal/domain/entities/entities.dart';
import 'package:equatable/equatable.dart';

part 'animals_list_event.dart';
part 'animals_list_state.dart';

class AnimalsListBloc extends Bloc<AnimalsListEvent, AnimalsListState> {
  AnimalsListBloc() : super(const AnimalsListState()) {
    on<AnimalsListEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
