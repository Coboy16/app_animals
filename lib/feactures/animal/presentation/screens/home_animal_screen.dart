import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '/feactures/animal/presentation/resources/resources.dart';
import '/feactures/animal/presentation/widgets/widgets.dart';
import '/feactures/animal/presentation/blocs/blocs.dart';
import '/feactures/animal/presentation/views/views.dart';
import '/shared/presentation/blocs/blocs.dart';

class HomeAnimalScreen extends StatelessWidget {
  const HomeAnimalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: _appBar(size, state.isDarkMode),
          backgroundColor: colorBase(state.isDarkMode),
          bottomNavigationBar: const NavigationBarWidget(),
          body: BlocBuilder<NavegationBarBloc, NavegationBarState>(
            builder: (context, state) => _getViewNavegation(state.index),
          ),
        );
      },
    );
  }

  _appBar(Size size, bool darkMode) {
    return AppBar(
      backgroundColor: colorBase(darkMode),
      leading: Padding(
        padding: const EdgeInsets.only(left: 15, top: 18),
        child: FaIcon(
          FontAwesomeIcons.bars,
          size: 20,
          color: colorBase(!darkMode),
        ),
      ),
      title: Text('Hello Marco', style: appBarTitleName(darkMode)),
      titleSpacing: -10,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 15, top: 10),
          child: Badge(
            backgroundColor: const Color(0xffff3063),
            child: FaIcon(
              FontAwesomeIcons.solidBell,
              size: size.height * 0.026,
              color: colorBell(!darkMode),
            ),
          ),
        )
      ],
    );
  }

  Widget _getViewNavegation(int index) {
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
