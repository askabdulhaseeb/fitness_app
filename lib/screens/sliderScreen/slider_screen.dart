import 'package:flutter/material.dart';

class SliderScreen extends StatelessWidget {
  static const routeName = '/SliderScreen';
  const SliderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Slider Screen'),
      ),
    );
  }
}
