import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:morept_fitness_app/providers/questions/type_of_exercise_provider.dart';
import 'package:morept_fitness_app/screens/basicQuestionScreens/exerciseGoalsScreen/exercise_goals_screen.dart';
import 'package:morept_fitness_app/screens/basicQuestionScreens/widgets/back_to_previous_page.dart';
import 'package:morept_fitness_app/screens/basicQuestionScreens/widgets/header_text_for_questions.dart';
import 'package:provider/provider.dart';

class TypeOfExerciseScreen extends StatelessWidget {
  const TypeOfExerciseScreen({Key? key}) : super(key: key);
  static const String routeName = '/TypeOfExerciseScreen';

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    List<TypeOfExercise> _type =
        Provider.of<TypeOfExerciseProvider>(context).getExerciseTypeList();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const BackToPreviousPageWidget(),
            const HeaderTextForQuestions(title: 'What makes you move?'),
            Expanded(
              child: ListView.builder(
                itemCount: _type.length,
                itemBuilder: (BuildContext context, int index) {
                  return _ExerciseTypeTileWidget(
                    size: size,
                    typeOfExercise: _type[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ExerciseTypeTileWidget extends StatelessWidget {
  const _ExerciseTypeTileWidget(
      {Key? key, required this.size, required this.typeOfExercise})
      : super(key: key);

  final Size size;
  final TypeOfExercise typeOfExercise;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<TypeOfExerciseProvider>(context, listen: false)
            .updateSelection(typeOfExercise.id);
        print(Provider.of<TypeOfExerciseProvider>(context, listen: false)
            .getSelectedType()!
            .id);

        Navigator.of(context).pushNamed(ExerciseGoalsScreen.routeName);
      },
      child: Container(
        height: 140,
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              width: 4,
              color: (typeOfExercise.isSelected)
                  ? Theme.of(context).primaryColor
                  : Colors.transparent),
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
              bottom: 0,
              right: -20,
              child: Transform.rotate(
                angle: 50,
                child: Opacity(
                  opacity: 0.2,
                  child: Icon(
                    (typeOfExercise.id == 'fitness')
                        ? FontAwesomeIcons.smile
                        : (typeOfExercise.id == 'sport')
                            ? FontAwesomeIcons.dumbbell
                            : FontAwesomeIcons.heartbeat,
                    size: 120,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 10),
                  Text(
                    typeOfExercise.title,
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: size.width * 0.06,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    typeOfExercise.description,
                    style: TextStyle(
                      fontSize: size.width * 0.037,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
