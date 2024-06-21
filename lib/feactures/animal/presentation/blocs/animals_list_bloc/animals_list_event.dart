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

class UpdateIsNotDateEvent extends AnimalsListEvent {
  final bool isNotData;
  const UpdateIsNotDateEvent(this.isNotData);
}

class ReadyMovePageEvent extends AnimalsListEvent {
  final bool isReady;
  const ReadyMovePageEvent(this.isReady);
}

class GetInfoAnimalIdEvent extends AnimalsListEvent {
  final String id;
  const GetInfoAnimalIdEvent(this.id);
}

class GetListAnimalsTypeAndPageEvent extends AnimalsListEvent {
  final String type;
  final int page;

  const GetListAnimalsTypeAndPageEvent({
    required this.type,
    required this.page,
  });
}

class UpdateListPageDogEvent extends AnimalsListEvent {
  final int updatePage;
  const UpdateListPageDogEvent(this.updatePage);
}

class UpdateListPageCatsEvent extends AnimalsListEvent {
  final int updatePage;
  const UpdateListPageCatsEvent(this.updatePage);
}

class UpdateListPageBunnyEvent extends AnimalsListEvent {
  final int updatePage;
  const UpdateListPageBunnyEvent(this.updatePage);
}

class UpdateListPageBirdsEvent extends AnimalsListEvent {
  final int updatePage;
  const UpdateListPageBirdsEvent(this.updatePage);
}

class UpdateListPageMousesEvent extends AnimalsListEvent {
  final int updatePage;
  const UpdateListPageMousesEvent(this.updatePage);
}
