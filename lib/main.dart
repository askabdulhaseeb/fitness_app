import 'package:flutter/material.dart';
import 'package:morept_fitness_app/providers/questions/exercise_goals_provider.dart';
import 'package:morept_fitness_app/providers/questions/training_experience_provider.dart';
import 'package:morept_fitness_app/providers/questions/type_of_exercise_provider.dart';
import 'package:morept_fitness_app/providers/questions/workout_time_provider.dart';
import 'package:provider/provider.dart';
import 'screens/auth/loginScreen/login_screen.dart';
import 'screens/auth/signupScreen/signup_screen.dart';
import 'screens/basicQuestionScreens/exerciseGoalsScreen/exercise_goals_screen.dart';
import 'screens/basicQuestionScreens/questionIntroScreen/question_intro_screen.dart';
import 'screens/basicQuestionScreens/trainingExperienceScreen/training_experience_screen.dart';
import 'screens/basicQuestionScreens/typeOfExerciseScreen/type_of_exercise_screen.dart';
import 'screens/basicQuestionScreens/workoutTimeScreen/workout_time_screen.dart';
import 'screens/equipmentQuestionScreens/equipmentQuestionIntroScreen/equipment_question_intro_screen.dart';
import 'screens/homeScreen/home_screen.dart';
import 'screens/introSliderScreen/intro_slider_screen.dart';
import 'screens/splashScreen/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // ignore: always_specify_types
        ChangeNotifierProvider.value(value: TypeOfExerciseProvider()),
        // ignore: always_specify_types
        ChangeNotifierProvider.value(value: ExerciseGoalProvider()),
        // ignore: always_specify_types
        ChangeNotifierProvider.value(value: TrainingExperienceProvider()),
        // ignore: always_specify_types
        ChangeNotifierProvider.value(value: WorkoutTimeProvider()),
      ],
      child: MaterialApp(
        title: 'More PT Fitness', // web link: https://morept.world/
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Colors.blue,
          splashColor: Colors.blue[200],
        ),
        home: const SplashScreen(),
        routes: <String, WidgetBuilder>{
          SplashScreen.routeName: (_) => const SplashScreen(),
          IntroSliderScreen.routeName: (_) => const IntroSliderScreen(),
          LoginScreen.routeName: (_) => const LoginScreen(),
          SignupScreen.routeName: (_) => const SignupScreen(),
          HomeScreen.routeName: (_) => const HomeScreen(),
          // Basic Questions
          QuestionIntroScreen.routeName: (_) => const QuestionIntroScreen(),
          TypeOfExerciseScreen.routeName: (_) => const TypeOfExerciseScreen(),
          ExerciseGoalsScreen.routeName: (_) => const ExerciseGoalsScreen(),
          TrainingExperienceScreen.routeName: (_) =>
              const TrainingExperienceScreen(),
          WorkoutTimeScreen.routeName: (_) => const WorkoutTimeScreen(),
          // Equipment Questions
          EquipmentQuestionIntroScreen.routeName: (_) =>
              const EquipmentQuestionIntroScreen(),
        },
      ),
    );
  }
}
