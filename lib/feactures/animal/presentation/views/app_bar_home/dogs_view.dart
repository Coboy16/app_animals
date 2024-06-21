import 'package:dog_app/feactures/animal/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/feactures/animal/presentation/blocs/blocs.dart';
import '/feactures/animal/domain/entities/entities.dart';

class DogsView extends StatefulWidget {
  const DogsView({super.key});

  @override
  State<DogsView> createState() => _DogsViewState();
}

class _DogsViewState extends State<DogsView> {
  late AnimalsListBloc _animalsListBloc;

  @override
  void initState() {
    _animalsListBloc = BlocProvider.of<AnimalsListBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocBuilder<AnimalsListBloc, AnimalsListState>(
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.listPageDogs.length ~/ 2,
          itemBuilder: (context, index) {
            final listDogs = state.listPageDogs;
            final startIndex = index * 2;
            final endIndex = (index + 1) * 2;
            final columDogs = listDogs.sublist(startIndex,
                endIndex > listDogs.length ? listDogs.length : endIndex);

            return _rowTwoAnimals(
                columDogs[0], columDogs.length > 1 ? columDogs[1] : null, size);
          },
        );
      },
    );
  }

  Widget _rowTwoAnimals(Animal r_, Animal? l_, Size size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(width: size.width * 0.01),
        //Todo: -> Animal izquierda
        Padding(
          padding: const EdgeInsets.only(bottom: 23),
          child: GestureDetector(
            onTap: () {},
            child: _animalTem(r_, size),
          ),
        ),
        SizedBox(width: size.width * 0.01),
        //Todo: -> Animal derecha
        Padding(
          padding: const EdgeInsets.only(top: 23),
          child: GestureDetector(
            onTap: () {},
            child: _animalTem(
              l_!,
              size,
            ),
          ),
        ),
        SizedBox(width: size.width * 0.01),
      ],
    );
  }

  Widget _animalTem(Animal animal, Size size) {
    return AnimalCardWidget(
      urlImage: animal.profilePhoto,
      name: animal.name,
      race: animal.race,
      id: animal.id,
    );
  }
}
