import 'package:flutter/material.dart';

class SliderScreen extends StatelessWidget {
  const SliderScreen({Key? key}) : super(key: key);
  static const String routeName = '/SliderScreen';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Slider Screen'),
      ),
    );
  }
}
