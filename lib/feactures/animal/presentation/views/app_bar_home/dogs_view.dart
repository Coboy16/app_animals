import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/feactures/animal/presentation/screens/screens.dart';
import '/feactures/animal/presentation/widgets/widgets.dart';
import '/feactures/animal/presentation/blocs/blocs.dart';

class DogsView extends StatefulWidget {
  const DogsView({super.key});

  @override
  State<DogsView> createState() => _DogsViewState();
}

class _DogsViewState extends State<DogsView> {
  late AnimalsListBloc _animalsListBloc;
  late ScrollController _scrollController;

  @override
  void initState() {
    _animalsListBloc = BlocProvider.of<AnimalsListBloc>(context);
    _scrollController = ScrollController();
    super.initState();
    scrollControllerDogView();
  }

  void scrollControllerDogView() {
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        if (_scrollController.position.pixels != 0) {
          _animalsListBloc.add(GetListAnimalsTypeAndPageEvent(
              type: 'dogs', page: (_animalsListBloc.state.numerPageDog + 1)));
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnimalsListBloc, AnimalsListState>(
      builder: (context, state) {
        return Stack(
          children: [
            ListView.builder(
              physics: const ClampingScrollPhysics(),
              itemCount: state.listPageDogs.length ~/ 2,
              controller: _scrollController,
              itemBuilder: (context, index) {
                final listDogs = state.listPageDogs;
                final startIndex = index * 2;
                final endIndex = (index + 1) * 2;
                final columDogs = listDogs.sublist(startIndex,
                    endIndex > listDogs.length ? listDogs.length : endIndex);

                return CenterWidgetsViewAnimal(
                  animalRight: columDogs[0],
                  animalLeft: columDogs.length > 1 ? columDogs[1] : null,
                  onTapRight: () {
                    _animalsListBloc.add(GetInfoAnimalIdEvent(columDogs[0].id));
                    _navegation();
                  },
                  onTapLeft: () => _navegation(),
                );
              },
            ),
            if (state.isLoadingList) const CircularProgreesBottomWidget()
          ],
        );
      },
    );
  }

  void _navegation() => Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const InfoAnimalScreen(),
          transitionDuration: const Duration(seconds: 0),
        ),
      );
}
