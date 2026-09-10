import 'package:flutter/material.dart';

class ExampleCheckBox extends StatefulWidget {
  const ExampleCheckBox({super.key});
  @override
  State<ExampleCheckBox> createState() => _ExampleCheckBoxState();
}

class _ExampleCheckBoxState extends State<ExampleCheckBox> {
  bool? isCheck = true;
  bool? isCheck2 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
           mainAxisAlignment: .center,
          children: [
            Checkbox(
                tristate: true,
                value: isCheck,
                onChanged: (bool? v){
                    setState(() {
                      isCheck = v;
                    });
                }),
            Checkbox(
                value: isCheck2,
                isError: true,
                onChanged: (bool? v){
                  setState(() {
                    isCheck2 = v;
                  });
                }),
            Checkbox(
              tristate: true,
                value: isCheck,
                onChanged: null
            )
          ],
        ),
      ),
    );
  }
}
