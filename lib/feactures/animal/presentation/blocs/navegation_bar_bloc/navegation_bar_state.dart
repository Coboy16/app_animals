part of 'navegation_bar_bloc.dart';

class NavegationBarState extends Equatable {
  final int index;

  const NavegationBarState({this.index = 0});

  NavegationBarState copyWith({
    int? index,
  }) =>
      NavegationBarState(
        index: index ?? this.index,
      );

  @override
  List<Object> get props => [index];
}
