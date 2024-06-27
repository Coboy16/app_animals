import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/feactures/animal/presentation/blocs/blocs.dart';
import '/feactures/animal/presentation/widgets/widgets.dart';

class BunnysView extends StatefulWidget {
  const BunnysView({super.key});

  @override
  State<BunnysView> createState() => _BunnysViewState();
}

class _BunnysViewState extends State<BunnysView> {
  late AnimalsListBloc _animalsListBloc;
  late ScrollController _scrollController;

  @override
  void initState() {
    _animalsListBloc = BlocProvider.of<AnimalsListBloc>(context);
    initListData();
    _scrollController = ScrollController();
    super.initState();
    scrollControllerDogView();
  }

  void initListData() => _animalsListBloc.state.listPageBunnys.isEmpty ? incrementListData() : () {};

  void incrementListData() =>
      _animalsListBloc.add(GetListAnimalsTypeAndPageEvent(
          type: 'bunnys', page: (_animalsListBloc.state.numerPageBunny + 1)));

  void scrollControllerDogView() {
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        if (_scrollController.position.pixels != 0) incrementListData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnimalsListBloc, AnimalsListState>(
      builder: (context, state) {
        return state.numerPageBunny == 1 //TODO: Cambiar por una variable en el state
            ? const CardsAnimalsLoadingWidget()
            : Stack(
                children: [
                  ListView.builder(
                    physics: const ClampingScrollPhysics(),
                    itemCount: state.listPageBunnys.length ~/ 2,
                    controller: _scrollController,
                    itemBuilder: (context, index) {
                      final listBunny = state.listPageBunnys;
                      final startIndex = index * 2;
                      final endIndex = (index + 1) * 2;
                      final columBunny = listBunny.sublist(startIndex,endIndex > listBunny.length
                                          ? listBunny.length
                                          : endIndex);

                    return CenterWidgetsViewAnimal(
                      animalRight: columBunny[0],
                      animalLeft: columBunny.length > 1 ? columBunny[1] : null,
                      onTapRight: () {},
                      onTapLeft: () {},
                    );
                    },
                  ),
                  if (state.isLoadingList) const CircularProgreesBottomWidget()
                ],
              );
      },
    );
  }
}
