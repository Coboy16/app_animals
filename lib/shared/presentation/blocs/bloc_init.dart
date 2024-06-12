import '/feactures/animal/presentation/blocs/bloc_init.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/shared/presentation/blocs/blocs.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> getListBloc() {
  return [
    BlocProvider(create: (context) => ThemeBloc()),
    ...getListBlocAnimal()
  ];
}
