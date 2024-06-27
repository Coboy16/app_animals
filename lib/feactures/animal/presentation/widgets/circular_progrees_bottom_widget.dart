import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/shared/presentation/blocs/theme_bloc/theme_bloc.dart';
import '/feactures/animal/presentation/resources/resources.dart';

class CircularProgreesBottomWidget extends StatelessWidget {
  const CircularProgreesBottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: SizedBox(
              width: size.height * 0.04,
              height: size.height * 0.04,
              child: CircularProgressIndicator(
                color: colorBase(state.isDarkMode),
                backgroundColor: const Color(0xffff3063),
              ),
            ),
          ),
        );
      },
    );
  }
}
