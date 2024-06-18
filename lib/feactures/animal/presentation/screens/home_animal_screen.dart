import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/feactures/animal/presentation/resources/resources.dart';
import '/feactures/animal/presentation/widgets/widgets.dart';
import '/feactures/animal/presentation/blocs/blocs.dart';
import '/feactures/animal/presentation/views/views.dart';
import '/shared/presentation/blocs/blocs.dart';

class HomeAnimalScreen extends StatelessWidget {
  const HomeAnimalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: colorBase(state.isDarkMode),
          bottomNavigationBar: const NavigationBarWidget(),
          body: BlocBuilder<NavegationBarBloc, NavegationBarState>(
            builder: (context, state) => _getViewAppBar(state.index),
          ),
        );
      },
    );
  }

  Widget _getViewAppBar(int index) {
    switch (index) {
      case 0:
        return const HomeView();
      case 1:
        return const FavoritesView();
      case 2:
        return const NotificationsView();
      default:
        return const PerfiView();
    }
  }
}
