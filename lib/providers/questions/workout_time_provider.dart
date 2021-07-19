import 'package:flutter/material.dart';

class WorkoutTime {
  WorkoutTime({
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

class WorkoutTimeProvider extends ChangeNotifier {
  // ignore: prefer_final_fields
  List<WorkoutTime> _workout = <WorkoutTime>[
    WorkoutTime(
      id: '20',
      title: '20 minutes',
      description: '5 workouts per week',
    ),
    WorkoutTime(
      id: '30',
      title: '30 minutes',
      description: '4 workouts per week',
    ),
    WorkoutTime(
      id: '40',
      title: '40 minutes',
      description: '3 workouts per week',
    ),
  ];

  void updateSelection(String id) {
    // ignore: avoid_function_literals_in_foreach_calls
    if (_workout
            .firstWhere((WorkoutTime element) => element.id == id)
            .isSelected ==
        false) {
      _workout.forEach((WorkoutTime workout) {
        if (workout.isSelected == true) {
          final int index = _workout
              .indexWhere((WorkoutTime element) => element.id == workout.id);
          workout.isSelected = false;
          _workout.removeAt(index);
          _workout.insert(index, workout);
        }
        if (workout.id == id) {
          final int index = _workout
              .indexWhere((WorkoutTime element) => element.id == workout.id);
          workout.isSelected = true;
          _workout.removeAt(index);
          _workout.insert(index, workout);
        }
      });
      // final WorkoutTime workout =
      //     _workout.firstWhere((WorkoutTime element) => element.id == id);
      // workout.isSelected = true;
      // final int index =
      //     _workout.indexWhere((WorkoutTime element) => element.id == id);

      // _workout.removeAt(index);
      // _workout.insert(index, workout);
    }
    notifyListeners();
  }

  bool isAnySelected() {
    final int index = _workout
        .indexWhere((WorkoutTime element) => element.isSelected == true);
    if (index == -1) return false;
    return true;
  }

  WorkoutTime? getSelectedWorkoutTime() {
    if (isAnySelected()) {
      return _workout
          .firstWhere((WorkoutTime element) => element.isSelected == true);
    }
    return null;
  }

  WorkoutTime getWorkoutTimeOfSpecificID(String id) {
    return _workout.firstWhere((WorkoutTime element) => element.id == id);
  }

  List<WorkoutTime> getWorkoutTimeList() {
    return _workout;
  }
}
