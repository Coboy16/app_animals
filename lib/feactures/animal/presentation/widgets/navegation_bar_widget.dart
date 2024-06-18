import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '/feactures/animal/presentation/resources/resources.dart';
import '/shared/presentation/blocs/theme_bloc/theme_bloc.dart';
import '/feactures/animal/presentation/blocs/blocs.dart';

class NavigationBarWidget extends StatefulWidget {
  const NavigationBarWidget({super.key});

  @override
  State<NavigationBarWidget> createState() => _NavigationBarWidgetState();
}

class _NavigationBarWidgetState extends State<NavigationBarWidget> {
  late NavegationBarBloc _navigationBarBloc;
  int currentIndex = 0;

  @override
  void initState() {
    _navigationBarBloc = BlocProvider.of<NavegationBarBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<NavegationBarBloc, NavegationBarState>(
      builder: (context, state) {
        currentIndex = state.index;
        return BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, stateTheme) {
            return Container(
              width: size.width,
              height: size.height * 0.085,
              decoration: BoxDecoration(
                color: colorAppBar(stateTheme.isDarkMode),
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(18)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 4,
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Center(
                child: SizedBox(
                  width: size.width * 0.92,
                  height: size.height * 0.08,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      listOfIcons.length,
                      (index) {
                        return Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() => currentIndex = index);
                              _navigationBarBloc.add(
                                  UpdateIndexNavegationEvent(currentIndex));
                            },
                            child: _iconNaviagate(
                                size, index, stateTheme.isDarkMode),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _iconNaviagate(Size size, int index, bool isDarkMode) {
    return Container(
      padding: const EdgeInsets.only(top: 9),
      color: colorAppBar(isDarkMode),
      child: Column(
        children: [
          Icon(
            listOfIcons[index],
            size: index == currentIndex ? size.width * .057 : size.width * .052,
            color: index == currentIndex
                ? const Color(0xffff3063)
                : const Color(0xffafc5c4),
          ),
          const SizedBox(height: 7),
          Text(
            listOfText[index],
            style: index == currentIndex
                ? iconFontNaviagtionON()
                : iconFontNaviagtionOFF(),
          ),
        ],
      ),
    );
  }

  List<IconData> listOfIcons = [
    FontAwesomeIcons.house,
    FontAwesomeIcons.solidHeart,
    FontAwesomeIcons.solidBell,
    FontAwesomeIcons.solidUser,
  ];

  List<String> listOfText = ['Inicio', 'Favoritos', 'Noticias', 'Perfil'];
}
