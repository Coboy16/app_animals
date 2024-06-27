import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animate_do/animate_do.dart';

import '/feactures/animal/presentation/resources/resources.dart';
import '/feactures/animal/presentation/widgets/widgets.dart';
import '/feactures/animal/domain/entities/entities.dart';
import '/feactures/animal/presentation/blocs/blocs.dart';
import '/shared/presentation/blocs/blocs.dart';

class InfoAnimalScreen extends StatelessWidget {
  const InfoAnimalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, stateTheme) {
        return Scaffold(
          backgroundColor: colorBase(stateTheme.isDarkMode),
          appBar: _appBar(context, size, stateTheme.isDarkMode),
          body: BlocBuilder<AnimalsListBloc, AnimalsListState>(
            builder: (context, state) {
              return state.isLoadingAnimal
                  ?  LoadingInfoDeatilAnimalWidget(isDarkMode: stateTheme.isDarkMode)
                  : Column(
                      children: [
                        CarouselImageDetailWidget(listPhotos: state.animalInfo!.photos),
                        Expanded(child: _buttomPartAnimalInfo(state.animalInfo!, size, stateTheme.isDarkMode)),
                      ],
                    );
            },
          ),
        );
      },
    );
  }

  Widget _buttomPartAnimalInfo(Animal animalInfo, Size size, bool isDarkMode) {
    return Container(
      decoration: BoxDecoration(
        color: colorBottomNavegation(isDarkMode),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
      ),
      child: Column(
        children: [
          InfoDetailAnimalWidget(detailAnimal: animalInfo, isDarkMode: isDarkMode ),
          SizedBox(height: size.height * 0.02),
          InfoDetailButttonsWidget(name: animalInfo.name, isDarkMode: isDarkMode ),
          SizedBox(height: size.height * 0.01),
        ],
      ),
    );
  }

  _appBar(BuildContext context, Size size, bool isDarkMode) {
    return AppBar(
      elevation: 0,
      surfaceTintColor: colorTopDetailAnimal(isDarkMode),
      backgroundColor: colorTopDetailAnimal(isDarkMode),
      leading: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: FadeInLeft(child: const Icon(Icons.arrow_back_ios)),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 15),
          child: FadeInRight(
            child: FaIcon(
              FontAwesomeIcons.solidHeart,
              size: size.height * 0.025,
              color: colorHead(isDarkMode),
            ),
          ),
        ),
      ],
    );
  }
}
