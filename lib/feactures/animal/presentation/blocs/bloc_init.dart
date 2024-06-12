import 'package:flutter_bloc/flutter_bloc.dart';

import '/feactures/animal/presentation/blocs/blocs.dart';

List<BlocProvider> getListBlocAnimal() {
  return [
    BlocProvider(create: (context) => AnimalsListBloc()),
    BlocProvider(create: (context) => SearchAnimalBloc()),
  ];
}
