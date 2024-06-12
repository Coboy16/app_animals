import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/feactures/animal/presentation/blocs/blocs.dart';

class WelcomeAnimalScreen extends StatelessWidget {
  const WelcomeAnimalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const String id = '6659781a3a7cf76e91805cd5';
    final blocAnimal = BlocProvider.of<AnimalsListBloc>(context);
    return Scaffold(
      body: BlocBuilder<AnimalsListBloc, AnimalsListState>(
        builder: (context, state) {
          return Column(
            children: [
              const Spacer(),
              const Center(child: Text('Welcome App Dog GET')),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  blocAnimal.add(const GetInfoAnimalIdEvent(id));
                },
                // child: const Text('Upload Date'),
                child: state.isLoadingAnimal
                    ? const CircularProgressIndicator()
                    : const Text('Upload Date'),
              ),
              const Spacer(),
            ],
          );
        },
      ),
    );
  }
}
