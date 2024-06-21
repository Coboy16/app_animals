import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/feactures/animal/presentation/resources/resources.dart';
import '/feactures/animal/presentation/screens/screens.dart';
import '/feactures/animal/presentation/blocs/blocs.dart';
import '/shared/presentation/blocs/blocs.dart';

class WelcomeAnimalScreen extends StatelessWidget {
  const WelcomeAnimalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: colorBase(state.isDarkMode),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: size.height * 0.07),
                AutoSizeText('Bienvenido',
                    style: welcomeFontAppDog(state.isDarkMode)),
                SizedBox(height: size.height * 0.01),
                SizedBox(
                  width: size.width * 0.7,
                  child: AutoSizeText(
                    'Adopta una mascota y haz tu día a día mucho más feliz',
                    style: bodyFontAppDog(state.isDarkMode),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: size.height * 0.04),
                _imageContainer(size, state.isDarkMode),
                SizedBox(height: size.height * 0.07),
                _buttomText(context, size, state.isDarkMode),
                SizedBox(height: size.height * 0.02),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _imageContainer(Size size, bool isDarkMode) {
    final container = Padding(
      padding: const EdgeInsets.all(0.0),
      child: Container(
        width: size.width,
        height: size.height * 0.4,
        decoration: BoxDecoration(
          color: isDarkMode
              ? const Color.fromARGB(121, 255, 95, 95)
              : const Color(0xfffeeff2),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(90),
            bottomRight: Radius.circular(90),
            topLeft: Radius.circular(190),
            topRight: Radius.circular(190),
          ),
        ),
      ),
    );

    return SizedBox(
      height: size.height * 0.52,
      width: size.width,
      child: Stack(
        children: [
          Align(alignment: Alignment.bottomCenter, child: container),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 12),
              child: SizedBox(
                height: size.height * 0.56,
                child: Image.asset('assets/images/dopidopi.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buttomText(BuildContext context, Size size, bool isDarkMode) {
    return Column(
      children: [
        SizedBox(
          width: size.width * 0.7,
          child: AutoSizeText(
            '¿Quieres adoptar una mascota?',
            style: textAdoptaAppDog(isDarkMode),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: size.height * 0.02),
        _button(context, size, isDarkMode),
        SizedBox(height: size.height * 0.04),
      ],
    );
  }

  Widget _button(BuildContext context, Size size, bool isDarkMode) {
    final blocAnimal = BlocProvider.of<AnimalsListBloc>(context);

    return BlocBuilder<AnimalsListBloc, AnimalsListState>(
      builder: (context, state) {
        //Cambia de navegacion cuando ya se cargo la data
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (state.navationHome == true) {
            Navigator.pushAndRemoveUntil(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    const HomeAnimalScreen(),
                transitionDuration: const Duration(seconds: 0),
              ),
              (route) => false,
            );
          }
        });

        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: state.isLoadingList ? size.height * 0.06 : size.width * 0.6,
          height: size.height * 0.063,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(0),
              textStyle: const TextStyle(fontSize: 20),
              backgroundColor:
                  isDarkMode ? Colors.red[900] : const Color(0xfffa6e68),
            ),
            onPressed: () => blocAnimal.add(GetListAnimalsTypeAndPageEvent(
                type: 'dogs', page: (state.numerPageDog + 1))),
            child: state.isLoadingList
                ? SizedBox(
                    width: size.height * 0.035,
                    height: size.height * 0.035,
                    child: CircularProgressIndicator(
                      color: colorBase(isDarkMode),
                    ),
                  )
                : Text('Continuar', style: btnWelcomeFontAppDog(isDarkMode)),
          ),
        );
      },
    );
  }
}
