import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/feactures/animal/presentation/widgets/widgets.dart';
import '/shared/presentation/blocs/theme_bloc/theme_bloc.dart';

class CardsAnimalsLoadingWidget extends StatelessWidget {
  const CardsAnimalsLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return ListView(
          children: [
            rowTwoCard(size, state.isDarkMode),   
            rowTwoCard(size, state.isDarkMode),   
          ],
        );
      },
    );
  }

  Widget rowTwoCard(Size size, bool isDarkMode){
    Widget loading = LoadingWidget(
      width: size.width * 0.43,
      height: size.height * 0.26,
      borderRadius: 16,
      isDarkMode: isDarkMode,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(width: size.width * 0.01),
        Padding(padding: const EdgeInsets.only(bottom: 23), child: loading ),
        SizedBox(width: size.width * 0.01),
        Padding(padding: const EdgeInsets.only(top: 23), child: loading ),
        SizedBox(width: size.width * 0.01),
      ],
    );
  }
}
