part of 'theme_bloc.dart';

@immutable
abstract class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object> get props => [];
}

class ThemeChanged extends ThemeEvent {
  final bool isDarkMode;
  const ThemeChanged(this.isDarkMode);

  @override
  List<Object> get props => [isDarkMode];
}
