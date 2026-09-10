import 'package:flutter/material.dart';

class Switch_S extends StatefulWidget {
  const Switch_S({super.key});
  @override
  State<Switch_S> createState() => _Switch_SState();
}

class _Switch_SState extends State<Switch_S> {
  bool light = true;

  static const WidgetStateProperty<Icon> thumbIcon =
  WidgetStateProperty<Icon>.fromMap(<WidgetStatesConstraint, Icon>{
    WidgetState.selected: Icon(Icons.check),
    WidgetState.any: Icon(Icons.close),
  });

  @override
  Widget build(BuildContext context) {

    // This object sets amber as the track color when the switch is selected.
    // Otherwise, it resolves to null and defers to values from the theme data.
    const WidgetStateProperty<Color?> trackColor =
    WidgetStateProperty<Color?>.fromMap(<WidgetStatesConstraint, Color>{
      WidgetState.selected: Colors.amber,
    });
    // This object sets the track color based on two WidgetState attributes.
    // If neither state applies, it resolves to null.
    final WidgetStateProperty<Color?> overlayColor =
    WidgetStateProperty<Color?>.fromMap(<WidgetState, Color>{
      WidgetState.selected: Colors.amber.withValues(alpha: 0.54),
      WidgetState.disabled: Colors.grey.shade400,
    });


    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: .min,
          spacing: 10,
          children: [
            Switch(
                value: light,
                activeThumbColor: Colors.red,
                onChanged: (bool value){
                    setState(() {
                      light = value;
                    });
                }),
            Switch(
                value: light,
                trackColor: trackColor,
                overlayColor: overlayColor,
                onChanged: (bool value){
                  setState(() {
                    light = value;
                  });
                }),
            Switch(
                value: light,
                trackColor: trackColor,
                overlayColor: overlayColor,
                thumbColor: WidgetStatePropertyAll<Color>(Colors.black),
                onChanged: (bool value){
                  setState(() {
                    light = value;
                  });
                }),
            Switch(
                value: light,
                onChanged: (bool value){
                  setState(() {
                    light = value;
                  });
                }),
            Switch(
              thumbIcon: thumbIcon,
              value: light,
              onChanged: (bool v){
                setState(() {
                  light=v;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
