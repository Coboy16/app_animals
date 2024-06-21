import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/feactures/animal/presentation/animations/animations.dart';
import '/feactures/animal/presentation/resources/resources.dart';
import '/feactures/animal/presentation/screens/screens.dart';
import '/feactures/animal/presentation/widgets/widgets.dart';
import '/feactures/animal/presentation/blocs/blocs.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '/shared/presentation/blocs/blocs.dart';

class WelcomeAnimalScreen extends StatefulWidget {
  const WelcomeAnimalScreen({super.key});

  @override
  State<WelcomeAnimalScreen> createState() => _WelcomeAnimalScreenState();
}

class _WelcomeAnimalScreenState extends State<WelcomeAnimalScreen>
    with SingleTickerProviderStateMixin {
  late AnimalsListBloc _animalsListBloc;
  late AnimationController _controller;
  late Animation<double> _animation;
  late Offset _buttonPosition;

  bool _isAnimating = false;

  @override
  void initState() {
    super.initState();
    _animalsListBloc = BlocProvider.of<AnimalsListBloc>(context);

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

    // listener para detectar el final de la animación
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animalsListBloc.add(const ReadyMovePageEvent(true));
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _animateButton() {
    setState(() => _isAnimating = true);
    _controller.forward();
  }

  void _getButtonPosition(GlobalKey key) {
    final RenderBox renderBox =
        key.currentContext!.findRenderObject() as RenderBox;
    final Offset offset = renderBox.localToGlobal(Offset.zero);
    setState(() {
      _buttonPosition = Offset(offset.dx + renderBox.size.width / 2,
          offset.dy + renderBox.size.height / 2);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    GlobalKey buttonKey = GlobalKey();

    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: colorBase(state.isDarkMode),
          body: SingleChildScrollView(
            child: Stack(
              children: [
                //contendo de la vista
                Column(
                  children: [
                    _textTop(size, state.isDarkMode),
                    WelcomeImageWidget(
                      assetsImage: 'assets/images/dopidopi.png',
                      isDarkMode: state.isDarkMode,
                    ),
                    SizedBox(height: size.height * 0.07),
                    _buttomText(size, buttonKey, state.isDarkMode),
                    SizedBox(height: size.height * 0.02),
                  ],
                ),

                //llena toda la pantalla del color
                if (_isAnimating)
                  AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return CustomPaint(
                        size: size,
                        painter: CirclePainter(
                          buttonPosition: _buttonPosition,
                          color: state.isDarkMode ? Colors.red[900] : const Color(0xfffa6e68),
                          progress: _animation.value,
                          screenSize: size,
                        ),
                      );
                    },
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _textTop(Size size, bool isDarkMode) {
    return Column(
      children: [
        SizedBox(height: size.height * 0.07),
        AutoSizeText('Bienvenido', style: welcomeFontAppDog(isDarkMode)),
        SizedBox(height: size.height * 0.01),
        SizedBox(
          width: size.width * 0.7,
          child: AutoSizeText(
            'Adopta una mascota y haz tu día a día mucho más feliz',
            style: bodyFontAppDog(isDarkMode),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: size.height * 0.04),
      ],
    );
  }

  Widget _buttomText(Size size, GlobalKey key, bool isDarkMode) {
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
        _button(size, key, isDarkMode),
        SizedBox(height: size.height * 0.04),
      ],
    );
  }

  Widget _button(Size size, GlobalKey key, bool isDarkMode) {
    return BlocBuilder<AnimalsListBloc, AnimalsListState>(
      builder: (context, state) {
        //Cambia de navegacion cuando ya se cargo la data

        // WidgetsBinding.instance.addPostFrameCallback((_) {
          if (state.navationHome == true) {
            Future.microtask(() {
              Navigator.pushAndRemoveUntil(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      const HomeAnimalScreen(),
                  transitionDuration: const Duration(seconds: 0),
                ),
                (route) => false,
              );
            });
          }
        // });

        return AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width:
                    state.isLoadingList ? size.height * 0.06 : size.width * 0.6,
                height: size.height * 0.063,
                child: ElevatedButton(
                  key: key,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(0),
                    textStyle: const TextStyle(fontSize: 20),
                    backgroundColor:
                        isDarkMode ? Colors.red[900] : const Color(0xfffa6e68),
                  ),
                  onPressed: () {
                    _animalsListBloc.add(GetListAnimalsTypeAndPageEvent(
                        type: 'dogs', page: (state.numerPageDog + 1)));
                    _getButtonPosition(key);
                    _animateButton();
                  },
                  child: state.isLoadingList
                      ? SizedBox(
                          width: size.height * 0.035,
                          height: size.height * 0.035)
                      : Text('Continuar',
                          style: btnWelcomeFontAppDog(isDarkMode)),
                ),
              );
            });
      },
    );
  }
}
