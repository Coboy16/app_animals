part of 'animals_list_bloc.dart';

sealed class AnimalsListEvent extends Equatable {
  const AnimalsListEvent();

  @override
  List<Object> get props => [];
}

class IsDataListAnimalReadyEvent extends AnimalsListEvent {
  final bool isData;
  const IsDataListAnimalReadyEvent(this.isData);
}

class IsDataInfoAnimalReadyEvent extends AnimalsListEvent {
  final bool isData;
  const IsDataInfoAnimalReadyEvent(this.isData);
}

class GetInfoAnimalIdEvent extends AnimalsListEvent {
  final String id;
  const GetInfoAnimalIdEvent(this.id);
}
