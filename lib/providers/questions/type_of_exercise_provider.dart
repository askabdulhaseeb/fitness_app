import 'package:flutter/material.dart';

class TypeOfExercise {
  TypeOfExercise({
    required this.id,
    required this.title,
    required this.description,
    this.isSelected = false,
  });
  final String id;
  final String title;
  final String description;
  bool isSelected;
}

class TypeOfExerciseProvider extends ChangeNotifier {
  // ignore: prefer_final_fields
  List<TypeOfExercise> _types = <TypeOfExercise>[
    TypeOfExercise(
      id: 'fitness',
      title: 'Fitness',
      description: 'Getting in shape and fell better.',
    ),
    TypeOfExercise(
      id: 'sport',
      title: 'Sport',
      description: 'Upping my game in my favorite sport.',
    ),
    TypeOfExercise(
      id: 'health_and_lifestyle',
      title: 'Health & Lifestyle',
      description: 'Working out with a program fit for my medical condition.',
    ),
  ];

  void updateSelection(String id) {
    // ignore: avoid_function_literals_in_foreach_calls
    if (_types
            .firstWhere((TypeOfExercise element) => element.id == id)
            .isSelected ==
        false) {
      _types.forEach((TypeOfExercise type) {
        if (type.isSelected == true) {
          final int index = _types
              .indexWhere((TypeOfExercise element) => element.id == type.id);
          type.isSelected = false;
          _types.removeAt(index);
          _types.insert(index, type);
        }
        if (type.id == id) {
          final int index = _types
              .indexWhere((TypeOfExercise element) => element.id == type.id);
          type.isSelected = true;
          _types.removeAt(index);
          _types.insert(index, type);
        }
      });
      // final TypeOfExercise type =
      //     _types.firstWhere((TypeOfExercise element) => element.id == id);
      // type.isSelected = true;
      // final int index =
      //     _types.indexWhere((TypeOfExercise element) => element.id == id);

      // _types.removeAt(index);
      // _types.insert(index, type);
    }
    notifyListeners();
  }

  bool isAnySelected() {
    final int index = _types
        .indexWhere((TypeOfExercise element) => element.isSelected == true);
    if (index == -1) return false;
    return true;
  }

  TypeOfExercise? getSelectedType() {
    if (isAnySelected()) {
      return _types
          .firstWhere((TypeOfExercise element) => element.isSelected == true);
    }
    return null;
  }

  TypeOfExercise getExerciseOfSpecificID(String id) {
    return _types.firstWhere((TypeOfExercise element) => element.id == id);
  }

  List<TypeOfExercise> getExerciseTypeList() {
    return _types;
  }
}
