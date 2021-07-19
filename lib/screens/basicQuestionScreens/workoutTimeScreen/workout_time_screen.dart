import 'package:flutter/material.dart';
import 'package:morept_fitness_app/providers/questions/workout_time_provider.dart';
import 'package:morept_fitness_app/screens/basicQuestionScreens/widgets/back_to_previous_page.dart';
import 'package:morept_fitness_app/screens/basicQuestionScreens/widgets/header_text_for_questions.dart';
import 'package:morept_fitness_app/screens/equipmentQuestionScreens/equipmentQuestionIntroScreen/equipment_question_intro_screen.dart';
import 'package:provider/provider.dart';

class WorkoutTimeScreen extends StatelessWidget {
  const WorkoutTimeScreen({Key? key}) : super(key: key);
  static const String routeName = '/WorkoutTimeScreen';

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final List<WorkoutTime> _workout =
        Provider.of<WorkoutTimeProvider>(context).getWorkoutTimeList();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const BackToPreviousPageWidget(),
            const HeaderTextForQuestions(
              title: 'How long do you want to work out?',
            ),
            Expanded(
                child: ListView.builder(
              itemCount: _workout.length,
              itemBuilder: (BuildContext context, int index) =>
                  _WorkoutTimeTileWidget(
                workout: _workout[index],
                size: size,
              ),
            ))
          ],
        ),
      ),
    );
  }
}

class _WorkoutTimeTileWidget extends StatelessWidget {
  const _WorkoutTimeTileWidget({
    Key? key,
    required WorkoutTime workout,
    required this.size,
  })  : _workout = workout,
        super(key: key);

  final WorkoutTime _workout;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<WorkoutTimeProvider>(context, listen: false)
            .updateSelection(_workout.id);
        Navigator.of(context).pushNamed(EquipmentQuestionIntroScreen.routeName);
      },
      child: Container(
        height: 90,
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              width: 4,
              color: (_workout.isSelected == true)
                  ? Theme.of(context).primaryColor
                  : Colors.transparent),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              _workout.title,
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: size.width * 0.05,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              _workout.description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: size.width * 0.037,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
