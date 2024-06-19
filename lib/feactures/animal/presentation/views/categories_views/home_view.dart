import 'package:dog_app/feactures/animal/presentation/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/feactures/animal/presentation/resources/resources.dart';
import '/shared/presentation/blocs/theme_bloc/theme_bloc.dart';
import '/feactures/animal/presentation/widgets/widgets.dart';
import '/feactures/animal/presentation/views/views.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 10, bottom: 5),
              child: Text('Categorias',
                  style: titleCategoryHomeView(state.isDarkMode)),
            ),
            const NavegationBarHomeViewWidget(),
            SizedBox(height: size.height * 0.02),
            SizedBox(
              height: size.height * 0.6,
              width: size.width,
              child: BlocBuilder<NavegationBarBloc, NavegationBarState>(
                builder: (context, state) => _getViewAppBarCategory(state.indexCategory),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _getViewAppBarCategory(int index) {
    switch (index) {
      case 0:
        return const DogsView();
      case 1:
        return const CatsView();
      case 2:
        return const BunnysView();
      case 3:
        return const BirdsView();
      default:
        return const MousesView();
    }
  }
}
