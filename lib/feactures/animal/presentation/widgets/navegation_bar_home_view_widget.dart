import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/feactures/animal/presentation/resources/resources.dart';
import '/shared/presentation/blocs/theme_bloc/theme_bloc.dart';
import '/feactures/animal/presentation/blocs/blocs.dart';

class NavegationBarHomeViewWidget extends StatefulWidget {
  const NavegationBarHomeViewWidget({super.key});

  @override
  State<NavegationBarHomeViewWidget> createState() =>
      _NavegationBarHomeViewWidgetState();
}

class _NavegationBarHomeViewWidgetState
    extends State<NavegationBarHomeViewWidget> {
  late NavegationBarBloc _navegationBarBloc;
  int categoryIndex = 0;

  @override
  void initState() {
    _navegationBarBloc = BlocProvider.of<NavegationBarBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, stateTheme) {
        return BlocBuilder<NavegationBarBloc, NavegationBarState>(
          builder: (context, state) {
            categoryIndex = state.indexCategory;
            return SizedBox(
              width: size.width,
              height: size.height * 0.13,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: listOfImage.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        top: 5, bottom: 5, right: 9, left: 9),
                    child: GestureDetector(
                      onTap: () {
                        setState(() => categoryIndex = index);
                        _navegationBarBloc.add(UpdateIndexCategoryNavegationEvent(categoryIndex));
                      },
                      child: Container(
                        child: _iconCategory(size, index, stateTheme.isDarkMode),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }

  Widget _iconCategory(Size size, int index, bool isDarkMode) {
    return Container(
      decoration: BoxDecoration(
        color: index == categoryIndex
            ? colorSelectCategory(isDarkMode)
            : colorBottomNavegation(isDarkMode),
        borderRadius: BorderRadius.circular(14),
      ),
      width: size.width * 0.18,
      child: Column(
        children: [
          SizedBox(height: size.height * 0.005),
          Image.asset(listOfImage[index],
              width: index == categoryIndex
                  ? size.width * 0.14
                  : size.width * 0.135),
          Text(
            listOfText[index],
            style: nameCategoryHomeView(isDarkMode),
          ),
        ],
      ),
    );
  }

  List<String> listOfImage = [
    'assets/images/dog.png',
    'assets/images/cat.png',
    'assets/images/bunny.png',
    'assets/images/birds.png',
    'assets/images/bunny.png',
  ];

  List<String> listOfText = ['Perros', 'Gatos', 'Conejos', 'Aves', 'Ratones'];
}
