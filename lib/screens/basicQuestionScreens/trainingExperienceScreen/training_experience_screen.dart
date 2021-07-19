import 'package:flutter/material.dart';
import 'package:morept_fitness_app/providers/questions/training_experience_provider.dart';
import 'package:morept_fitness_app/screens/basicQuestionScreens/widgets/back_to_previous_page.dart';
import 'package:morept_fitness_app/screens/basicQuestionScreens/widgets/header_text_for_questions.dart';
import 'package:morept_fitness_app/screens/basicQuestionScreens/workoutTimeScreen/workout_time_screen.dart';
import 'package:provider/provider.dart';

class TrainingExperienceScreen extends StatelessWidget {
  const TrainingExperienceScreen({Key? key}) : super(key: key);
  static const String routeName = '/TrainingExperienceScreen';

  @override
  Widget build(BuildContext context) {
    final List<TrainingExterience> _experience =
        Provider.of<TrainingExperienceProvider>(context)
            .getTrainingExperienceList();
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const BackToPreviousPageWidget(),
            const HeaderTextForQuestions(
              title: '''What's your training experience?''',
            ),
            Expanded(
                child: ListView.builder(
              itemCount: _experience.length,
              itemBuilder: (BuildContext context, int index) =>
                  _TrainingExperienceTileWidget(
                experience: _experience[index],
                size: size,
              ),
            ))
          ],
        ),
      ),
    );
  }
}

class _TrainingExperienceTileWidget extends StatelessWidget {
  const _TrainingExperienceTileWidget({
    Key? key,
    required TrainingExterience experience,
    required this.size,
  })  : _experience = experience,
        super(key: key);

  final TrainingExterience _experience;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<TrainingExperienceProvider>(context, listen: false)
            .updateSelection(_experience.id);
        Navigator.of(context).pushNamed(WorkoutTimeScreen.routeName);
      },
      child: Container(
        height: 120,
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              width: 4,
              color: (_experience.isSelected == true)
                  ? Theme.of(context).primaryColor
                  : Colors.transparent),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              _experience.title,
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: size.width * 0.05,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              _experience.description,
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
