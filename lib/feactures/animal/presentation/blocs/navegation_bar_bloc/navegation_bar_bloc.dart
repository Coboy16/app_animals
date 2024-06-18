import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'navegation_bar_event.dart';
part 'navegation_bar_state.dart';

class NavegationBarBloc extends Bloc<NavegationBarEvent, NavegationBarState> {
  NavegationBarBloc() : super(const NavegationBarState()) {
    //actualiza la posicion del appbar en el homeAnimalScreen
    on<UpdateIndexNavegationEvent>(
        (event, emit) => emit(state.copyWith(index: event.index)));
  }
}
