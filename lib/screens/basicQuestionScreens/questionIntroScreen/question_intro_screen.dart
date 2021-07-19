import 'package:flutter/material.dart';
import 'package:morept_fitness_app/config/app_images.dart';
import 'package:morept_fitness_app/screens/basicQuestionScreens/typeOfExerciseScreen/type_of_exercise_screen.dart';

class QuestionIntroScreen extends StatelessWidget {
  const QuestionIntroScreen({Key? key}) : super(key: key);
  static const String routeName = '/QuestionIntroScreen';

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              iDefaultEquipment1,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.black38,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _basicIntroSheet(size),
              _createProgramButton(context, size),
            ],
          )
        ],
      ),
    );
  }

  GestureDetector _createProgramButton(BuildContext context, Size size) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(TypeOfExerciseScreen.routeName);
      },
      child: Container(
        height: 70,
        width: double.infinity,
        margin: const EdgeInsets.all(20),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          'Create Program',
          style: TextStyle(
            fontSize: size.width * 0.06,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }

  Container _basicIntroSheet(Size size) {
    final TextStyle simpleTextStyle = TextStyle(
      color: Colors.white70,
      fontSize: size.width * 0.04,
      fontWeight: FontWeight.w500,
    );
    return Container(
      height: size.height / 2,
      width: double.infinity,
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            'Hi gyummy!',
            overflow: TextOverflow.fade,
            maxLines: 1,
            style: TextStyle(
              fontWeight: FontWeight.w900,
              color: Colors.white,
              fontSize: size.width * 0.07,
            ),
          ),
          Text(
            "Welcome to More PT!",
            style: simpleTextStyle,
          ),
          Text(
            "We are here to help you achieve superior results faster.",
            style: simpleTextStyle,
          ),
          Text(
            "Answer a few questions and create your personalized program with me.",
            style: simpleTextStyle,
          ),
          Text(
            "Ready to start?",
            style: simpleTextStyle,
          ),
        ],
      ),
    );
  }
}
