import 'package:flutter/material.dart';

class Sliderr extends StatefulWidget {
  const Sliderr({super.key});

  @override
  State<Sliderr> createState() => _SliderrState();
}

class _SliderrState extends State<Sliderr> {
  double _currentSliderValue = 20;
  double _currentDiscreteSliderValue = 60;
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    body: Center(
      child: Column(
        mainAxisSize: .min,
        children: [
            Slider(
              activeColor: Colors.green.shade300,
              thumbColor: Colors.white,
              value: _currentSliderValue,
              max: 100,
              onChanged: (double value){
                setState(() {
                  _currentSliderValue=value;
                });
              },
            ),
          Slider(
              value: _currentDiscreteSliderValue,
              max: 100,
              divisions: 10,
              label: _currentDiscreteSliderValue.round().toString(),
              onChanged: (double value){
                setState(() {
                  _currentDiscreteSliderValue=value;
                });
              },
            ),
        ],
      ),
    ),
  );
  }
}
