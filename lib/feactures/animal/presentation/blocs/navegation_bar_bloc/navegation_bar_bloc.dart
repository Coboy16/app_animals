import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'navegation_bar_event.dart';
part 'navegation_bar_state.dart';

class NavegationBarBloc extends Bloc<NavegationBarEvent, NavegationBarState> {
  NavegationBarBloc() : super(const NavegationBarState()) {
    
    //actualiza la posicion del bottonNavegation en el homeAnimalScreen
    on<UpdateIndexNavegationEvent>(
        (event, emit) => emit(state.copyWith(index: event.index)));
  
    //actualiza la posicion del las categorias
    on<UpdateIndexCategoryNavegationEvent>(
        (event, emit) => emit(state.copyWith(indexCategory: event.indexCategory)));
  
  
  }
}
