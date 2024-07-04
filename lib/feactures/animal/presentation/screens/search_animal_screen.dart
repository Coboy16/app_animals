import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '/feactures/animal/presentation/resources/resources.dart';
import '/shared/presentation/blocs/theme_bloc/theme_bloc.dart';
import '/feactures/animal/presentation/widgets/widgets.dart';

class SearchAnimalScreen extends StatelessWidget {
  const SearchAnimalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: colorBase(state.isDarkMode),
          appBar: AppBar(
            elevation: 0,
            surfaceTintColor: colorBase(state.isDarkMode),
            backgroundColor: colorBase(state.isDarkMode),
            toolbarHeight: size.height * 0.08,
            title: SearchWidget(isDarkMode: state.isDarkMode),
          ),
          body: const Column(
            children: [
              SelectOptionSearchWidget(),
            ],
          ),
        );
      },
    );
  }
}
