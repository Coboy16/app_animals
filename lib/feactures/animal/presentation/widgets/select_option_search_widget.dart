import 'package:flutter/material.dart';

class SelectOptionSearchWidget extends StatefulWidget {
  const SelectOptionSearchWidget({super.key});

  @override
  State<SelectOptionSearchWidget> createState() =>
      _SelectOptionSearchWidgetState();
}

class _SelectOptionSearchWidgetState extends State<SelectOptionSearchWidget> {
  List<String> options = ['Perros', 'Gatos', 'Conejos', 'Avez'];
  List<String> selectedOptions = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16, left: 16, bottom: 16, top: 2),
      child: Wrap(
        spacing: 8.0,
        children: options.map((option) {
          final isSelected = selectedOptions.contains(option);
          return ChoiceChip(
            label: Text(option),
            selected: isSelected,
            selectedColor: Colors.red,
            onSelected: (selected) {
              setState(() {
                if (selected) {
                  selectedOptions.add(option);
                } else {
                  selectedOptions.remove(option);
                }
              });
            },
            labelStyle: TextStyle(
              color: isSelected ? Colors.white : Colors.grey.shade800,
            ),
            backgroundColor: Colors.red[200],
            shape: StadiumBorder(
              side: BorderSide(
                color: isSelected ? Colors.red : Colors.transparent,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
