part of 'search_animal_bloc.dart';

sealed class SearchAnimalState extends Equatable {
  const SearchAnimalState();
  
  @override
  List<Object> get props => [];
}

final class SearchAnimalInitial extends SearchAnimalState {}
