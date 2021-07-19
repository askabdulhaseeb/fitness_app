import 'package:flutter/material.dart';
import 'package:morept_fitness_app/providers/questions/exercise_goals_provider.dart';
import 'package:morept_fitness_app/screens/basicQuestionScreens/trainingExperienceScreen/training_experience_screen.dart';
import 'package:morept_fitness_app/screens/basicQuestionScreens/widgets/back_to_previous_page.dart';
import 'package:morept_fitness_app/screens/basicQuestionScreens/widgets/header_text_for_questions.dart';
import 'package:provider/provider.dart';

class ExerciseGoalsScreen extends StatelessWidget {
  const ExerciseGoalsScreen({Key? key}) : super(key: key);
  static const String routeName = '/ExerciseGoalsScreen';
  @override
  Widget build(BuildContext context) {
    final List<ExerciseGoal> _goal =
        Provider.of<ExerciseGoalProvider>(context).getGoals();
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const BackToPreviousPageWidget(),
            const HeaderTextForQuestions(title: '''What's your goal?'''),
            Expanded(
              child: ListView.builder(
                itemCount: _goal.length,
                itemBuilder: (BuildContext context, int index) {
                  return _ExerciseGoalsTileWidget(
                    goal: _goal[index],
                    size: size,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _ExerciseGoalsTileWidget extends StatelessWidget {
  const _ExerciseGoalsTileWidget({
    Key? key,
    required ExerciseGoal goal,
    required this.size,
  })  : _goal = goal,
        super(key: key);

  final ExerciseGoal _goal;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<ExerciseGoalProvider>(context, listen: false)
            .updateSelection(_goal.id);
        Navigator.of(context).pushNamed(TrainingExperienceScreen.routeName);
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
              color: (_goal.isSelected == true)
                  ? Theme.of(context).primaryColor
                  : Colors.transparent),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              _goal.title,
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: size.width * 0.05,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              _goal.description,
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
