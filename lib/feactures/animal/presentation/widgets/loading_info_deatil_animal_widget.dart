import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';

import '/feactures/animal/presentation/resources/resources.dart';
import '/feactures/animal/presentation/widgets/widgets.dart';

class LoadingInfoDeatilAnimalWidget extends StatelessWidget {
  final bool? isDarkMode;
  const LoadingInfoDeatilAnimalWidget({super.key, this.isDarkMode = false});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(children: [
      _corouselImage(size),
      Expanded(child: _bottomPart(size)),
    ]);
  }

  Widget _corouselImage(Size size){
    return Container(
      width: size.width, 
      height: size.height * 0.34, 
      color: colorTopDetailAnimal(isDarkMode!),
      child: CarouselSlider(
            options: CarouselOptions(
              height: size.height * 0.3,
              autoPlay: false,
              aspectRatio: 2.0,
              enlargeCenterPage: true,
            ),
            items: [
              LoadingWidget(
                width: size.width,
                height: size.height * 0.3,
                borderRadius: 16,
                isDarkMode: isDarkMode,
              ),
            ],
          ),  
    );
  }

  Widget _bottomPart(Size size) {
    return Container(
      width: size.width,
      decoration: BoxDecoration(
        color: colorBottomNavegation(isDarkMode!),
        boxShadow: [
          BoxShadow(
            color: isDarkMode!
                ? Colors.white.withOpacity(0.08)
                : Colors.black.withOpacity(0.1),
            spreadRadius: 0.1,
            blurRadius: isDarkMode! ? 0 : 15,
            offset: Offset(0, isDarkMode! ? -1.5 : -13),
          ),
        ],
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24), bottom: Radius.zero),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _nameAndRaza(size),
            _containerInfo(size),
            SizedBox(height: size.height * 0.015),
            _vacunateContainer(size),
            SizedBox(height: size.height * 0.018),
            _ubicationInfo(size),
            SizedBox(height: size.height * 0.018),
            _containerSobre(size),
            SizedBox(height: size.height * 0.018),
            _containerButtons(size),
          ],
        ),
      ),
    );
  }

  Widget _nameAndRaza(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: size.height * 0.025),
        LoadingWidget(
            width: size.width * 0.3,
            height: size.height * 0.045,
            isDarkMode: isDarkMode),
        SizedBox(height: size.height * 0.009),
        LoadingWidget(
            width: size.width * 0.4,
            height: size.height * 0.031,
            isDarkMode: isDarkMode),
        SizedBox(height: size.height * 0.015),
      ],
    );
  }

  Widget _vacunateContainer(Size size) => LoadingWidget(
      width: size.width * 0.4,
      height: size.height * 0.038,
      isDarkMode: isDarkMode);

  Widget _containerInfo(Size size) => LoadingWidget(
      width: size.width * 0.83,
      height: size.height * 0.07,
      isDarkMode: isDarkMode);

  Widget _ubicationInfo(Size size) => LoadingWidget(
      width: size.width * 0.9,
      height: size.height * 0.05,
      isDarkMode: isDarkMode);

  Widget _containerSobre(Size size) => LoadingWidget(
      width: size.width * 0.9,
      height: size.height * 0.085,
      isDarkMode: isDarkMode);

  Widget _containerButtons(Size size) => LoadingWidget(
      width: size.width * 0.9,
      height: size.height * 0.075,
      isDarkMode: isDarkMode);
}
