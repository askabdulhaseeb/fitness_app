import 'package:flutter/material.dart';

class ExerciseGoal {
  ExerciseGoal({
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

class ExerciseGoalProvider extends ChangeNotifier {
  // ignore: prefer_final_fields
  List<ExerciseGoal> _goal = <ExerciseGoal>[
    ExerciseGoal(
      id: 'start_moving',
      title: 'Start Moving',
      description: 'Get active and feel healthier.',
    ),
    ExerciseGoal(
      id: 'stay_young',
      title: 'Stay Young',
      description: 'Rejuvinate your body and feel better.',
    ),
    ExerciseGoal(
      id: 'tone_your_body',
      title: 'Tone Your Body',
      description: 'Get lean and improve definition.',
    ),
    ExerciseGoal(
      id: 'lose_weight',
      title: 'Lose Weight',
      description: 'Burn calories and increase metabolism.',
    ),
    ExerciseGoal(
      id: 'more_strength',
      title: 'More Strength',
      description: 'Build muscle and boost strength.',
    ),
  ];

  List<ExerciseGoal> getGoals() {
    return _goal;
  }

  ExerciseGoal? getExerciseGoalOfSpecificID(String id) {
    try {
      return _goal.firstWhere((ExerciseGoal element) => element.id == id);
    } catch (e) {
      return null;
    }
  }

  bool isAnySelected() {
    final int index =
        _goal.indexWhere((ExerciseGoal element) => element.isSelected == true);
    if (index == -1) return false;
    return true;
  }

  ExerciseGoal? getSelectedExerciseGoal() {
    if (isAnySelected()) {
      try {
        return _goal
            .firstWhere((ExerciseGoal element) => element.isSelected == true);
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  void updateSelection(String id) {
    if (_goal
            .firstWhere((ExerciseGoal element) => element.id == id)
            .isSelected ==
        false) {
      _goal.forEach((ExerciseGoal goal) {
        if (goal.isSelected == true) {
          final int index =
              _goal.indexWhere((ExerciseGoal element) => element.id == goal.id);
          goal.isSelected = false;
          _goal.removeAt(index);
          _goal.insert(index, goal);
        }
        if (goal.id == id) {
          final int index =
              _goal.indexWhere((ExerciseGoal element) => element.id == goal.id);
          goal.isSelected = true;
          _goal.removeAt(index);
          _goal.insert(index, goal);
        }
      });
      notifyListeners();
    }
  }
}
