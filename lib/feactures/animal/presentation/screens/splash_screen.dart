// import 'package:flutter/material.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;
//   late Offset _buttonPosition;

//   bool _isAnimating = false;
//   bool _animationCompleted = false;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(seconds: 2),
//       vsync: this,
//     );
//     _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

//     // Añadir listener para detectar el final de la animación
//     _controller.addStatusListener((status) {
//       if (status == AnimationStatus.completed) {
//         setState(() {
//           _animationCompleted = true;
//         });
//         _navigateToHome();
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   void _animateButton() {
//     setState(() => _isAnimating = true);
//     _controller.forward();

//   }

//   void _getButtonPosition(GlobalKey key) {
//     final RenderBox renderBox =
//         key.currentContext!.findRenderObject() as RenderBox;
//     final Offset offset = renderBox.localToGlobal(Offset.zero);
//     setState(() {
//       _buttonPosition = Offset(offset.dx + renderBox.size.width / 2,
//           offset.dy + renderBox.size.height / 2);
//     });
//   }

//   void _navigateToHome(){
//     if(_animationCompleted){

//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     GlobalKey buttonKey = GlobalKey();

//     return Scaffold(
//       body: Stack(
//         children: [
//           if (_isAnimating)
//             AnimatedBuilder(
//               animation: _controller,
//               builder: (context, child) {
//                 return CustomPaint(
//                   size: size,
//                   painter:
//                       CirclePainter2(_animation.value, _buttonPosition, size),
//                 );
//               },
//             ),
//           Padding(
//             padding: const EdgeInsets.only(bottom: 10),
//             child: Align(
//               alignment: Alignment.topCenter,
//               child: AnimatedBuilder(
//                 animation: _controller,
//                 builder: (context, child) {
//                   return GestureDetector(
//                     onTap: () {
//                       _getButtonPosition(buttonKey);
//                       _animateButton();
//                     },
//                     child: Container(
//                       key: buttonKey,
//                       width: 200,
//                       height: 50,
//                       decoration: BoxDecoration(
//                         color: Colors.red,
//                         borderRadius: BorderRadius.circular(25),
//                       ),
//                       alignment: Alignment.center,
//                       child: const Text(
//                         'Press Me',
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class CirclePainter2 extends CustomPainter {
//   final double progress;
//   final Offset buttonPosition;
//   final Size screenSize;

//   CirclePainter2(this.progress, this.buttonPosition, this.screenSize);

//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = Colors.blue
//       ..style = PaintingStyle.fill;

//     // Ajuste el radio para asegurarse de que cubra toda la pantalla.
//     final maxRadius = (screenSize.width + screenSize.height) * 1.5;
//     final radius = progress * maxRadius;

//     canvas.drawCircle(
//       buttonPosition,
//       radius,
//       paint,
//     );
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return true;
//   }
// }
