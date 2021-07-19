import 'package:flutter/material.dart';

class TrainingExterience {
  TrainingExterience({
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

class TrainingExperienceProvider extends ChangeNotifier {
  // ignore: prefer_final_fields
  List<TrainingExterience> _experience = <TrainingExterience>[
    TrainingExterience(
      id: 'beginner',
      title: 'Beginner',
      description: '''I'm starting to train now.''',
    ),
    TrainingExterience(
      id: 'intermediate',
      title: 'Intermediate',
      description:
          '''I've been training for about 3 months and know a thing or more.''',
    ),
    TrainingExterience(
        id: 'advanced',
        title: 'Advanced',
        description:
            '''Training is my thing. I've been working out regularly for over 3 months.''')
  ];

  void updateSelection(String id) {
    // ignore: avoid_function_literals_in_foreach_calls
    if (_experience
            .firstWhere((TrainingExterience element) => element.id == id)
            .isSelected ==
        false) {
      _experience.forEach((TrainingExterience experience) {
        if (experience.isSelected == true) {
          final int index = _experience.indexWhere(
              (TrainingExterience element) => element.id == experience.id);
          experience.isSelected = false;
          _experience.removeAt(index);
          _experience.insert(index, experience);
        }
        if (experience.id == id) {
          final int index = _experience.indexWhere(
              (TrainingExterience element) => element.id == experience.id);
          experience.isSelected = true;
          _experience.removeAt(index);
          _experience.insert(index, experience);
        }
      });
      // final TrainingExterience experience =
      //     _experience.firstWhere((TrainingExterience element) => element.id == id);
      // experience.isSelected = true;
      // final int index =
      //     _experience.indexWhere((TrainingExterience element) => element.id == id);

      // _experience.removeAt(index);
      // _experience.insert(index, experience);
    }
    notifyListeners();
  }

  bool isAnySelected() {
    final int index = _experience
        .indexWhere((TrainingExterience element) => element.isSelected == true);
    if (index == -1) return false;
    return true;
  }

  TrainingExterience? getSelectedExperience() {
    if (isAnySelected()) {
      return _experience.firstWhere(
          (TrainingExterience element) => element.isSelected == true);
    }
    return null;
  }

  TrainingExterience getExperienceOfSpecificID(String id) {
    return _experience
        .firstWhere((TrainingExterience element) => element.id == id);
  }

  List<TrainingExterience> getTrainingExperienceList() {
    return _experience;
  }
}
