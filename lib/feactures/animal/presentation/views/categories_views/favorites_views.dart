import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/feactures/animal/presentation/blocs/blocs.dart';
import '/feactures/animal/presentation/resources/resources.dart';
import '/feactures/animal/presentation/widgets/widgets.dart';

class FavoritesView extends StatefulWidget {
  const FavoritesView({super.key});

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  late FavoritesAnimalsBloc _favoritesAnimalsBloc;

  @override
  void initState() {
    _favoritesAnimalsBloc = BlocProvider.of<FavoritesAnimalsBloc>(context);
    _favoritesAnimalsBloc.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<FavoritesAnimalsBloc, FavoritesAnimalsState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 10, bottom: 5),
              child: Text('Mascotas', style: titleCategoryHomeView(false)),
            ),
            SizedBox(
              width: size.width,
              height: size.height * 0.65,
              child: ListView.builder(
                itemCount: state.listFavorites.length,
                itemBuilder: (context, index) {
                  return ContainerFavoriteAnimalWidget(
                    ide: state.listFavorites[index].id,
                    image: state.listFavorites[index].profilePhoto,
                    name: state.listFavorites[index].name,
                    raza: state.listFavorites[index].race,
                    sexo: state.listFavorites[index].sexo,
                    colorSexo: !_sexoMascota(state.listFavorites[index].sexo),
                    edad: '${state.listFavorites[index].age} Años',
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  bool _sexoMascota(String sexo) => sexo == 'Macho' ? true : false;
}
