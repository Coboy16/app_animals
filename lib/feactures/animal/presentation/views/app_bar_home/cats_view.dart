import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/feactures/animal/presentation/widgets/widgets.dart';
import '/feactures/animal/domain/entities/entities.dart';
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

  void initListData() => _animalsListBloc.add(GetListAnimalsTypeAndPageEvent(
      type: 'cats', page: (_animalsListBloc.state.numerPageCats + 1)));

  void scrollControllerDogView() {
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        if (_scrollController.position.pixels != 0) {
          initListData();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

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
                          startIndex,
                          endIndex > listCats.length
                              ? listCats.length
                              : endIndex);

                      return _rowTwoAnimals(columCats[0],
                          columCats.length > 1 ? columCats[1] : null, size);
                    },
                  ),
                  if(!state.initFirtList) //si la primera lista inicial ya esta cargada 
                    if (state.isLoadingList)
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: SizedBox(
                            width: size.height * 0.04,
                            height: size.height * 0.04,
                            child: const CircularProgressIndicator(
                              color: Colors.white,
                              backgroundColor: Color(0xffff3063),
                            ),
                          ),
                        ),
                      ),
                ],
              );
      },
    );
  }

  Widget _rowTwoAnimals(Animal r_, Animal? l_, Size size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(width: size.width * 0.01),
        //Todo: -> Animal izquierda
        Padding(
          padding: const EdgeInsets.only(bottom: 23),
          child: GestureDetector(
            onTap: () {},
            child: _animalTem(r_, size),
          ),
        ),
        SizedBox(width: size.width * 0.01),
        //Todo: -> Animal derecha
        Padding(
          padding: const EdgeInsets.only(top: 23),
          child: GestureDetector(
            onTap: () {},
            child: _animalTem(l_!, size),
          ),
        ),
        SizedBox(width: size.width * 0.01),
      ],
    );
  }

  Widget _animalTem(Animal animal, Size size) {
    return AnimalCardWidget(
      urlImage: animal.profilePhoto,
      name: animal.name,
      race: animal.race,
      id: animal.id,
    );
  }
}
