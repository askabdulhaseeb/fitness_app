import 'package:flutter/material.dart';
import 'package:morept_fitness_app/screens/basicQuestionScreens/widgets/back_to_previous_page.dart';
import 'package:morept_fitness_app/screens/basicQuestionScreens/widgets/header_text_for_questions.dart';

class EquipmentQuestionIntroScreen extends StatelessWidget {
  const EquipmentQuestionIntroScreen({Key? key}) : super(key: key);
  static const String routeName = '/EquipmentQuestionIntroScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const BackToPreviousPageWidget(),
            const HeaderTextForQuestions(title: 'Do you use any equipment?'),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 60,
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.centerLeft,
                child: const Text('Yes, Add equipment'),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 60,
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.centerLeft,
                child: Text('Not yet'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
