import 'package:get_it/get_it.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: depend_on_referenced_packages
import 'package:provider/single_child_widget.dart';

import '/feactures/animal/presentation/blocs/blocs.dart';

List<SingleChildWidget> getListBlocAnimal() {
  return [
    BlocProvider(create: (_) => GetIt.instance.get<AnimalsListBloc>()),
    BlocProvider(create: (_) => NavegationBarBloc()),
    BlocProvider(create: (_) => SearchAnimalBloc()),
  ];
}
