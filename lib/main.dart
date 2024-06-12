import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'feactures/animal/presentation/blocs/blocs.dart';
import 'feactures/animal/presentation/screens/screens.dart';
import 'shared/presentation/blocs/bloc_init.dart';
import 'shared/presentation/themes/themes.dart';
import 'shared/presentation/blocs/blocs.dart';
import 'core/injection/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await init();
  runApp(MultiBlocProvider(providers: getListBloc(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = MediaQuery.of(context).platformBrightness == Brightness.dark;
    BlocProvider.of<ThemeBloc>(context).add(ThemeChanged(theme));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Dog',
      home: const WelcomeAnimalScreen(),
      themeMode: ThemeMode.system,
      theme: Themes.light,
      darkTheme: Themes.dark,
    );
  }
}
