import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/feactures/animal/presentation/widgets/widgets.dart';
import '/feactures/animal/presentation/blocs/blocs.dart';

class CatsView extends StatefulWidget {
  const CatsView({super.key});

  @override
  State<CatsView> createState() => _CatsViewState();
}

class _CatsViewState extends State<CatsView> {
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

  void initListData() => _animalsListBloc.state.listPageCats.isEmpty ? incrementListData() : () {};  

  void incrementListData() => _animalsListBloc.add(GetListAnimalsTypeAndPageEvent(
          type: 'cats', page: (_animalsListBloc.state.numerPageCats + 1)));

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
        return state.initFirtList //Si no hay datos y es la primera lista que va cargar
            ? const CardsAnimalsLoadingWidget()
            : Stack(
                children: [
                  ListView.builder(
                    physics: const ClampingScrollPhysics(),
                    itemCount: state.listPageCats.length ~/ 2,
                    controller: _scrollController,
                    itemBuilder: (context, index) {
                      final listCats = state.listPageCats;
                      final startIndex = index * 2;
                      final endIndex = (index + 1) * 2;
                      final columCats = listCats.sublist(
                          startIndex, endIndex > listCats.length ? listCats.length : endIndex);
                      
                      return CenterWidgetsViewAnimal(
                        animalRight: columCats[0],
                        animalLeft: columCats.length > 1 ? columCats[1] : null,
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
