import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/bottom_navigation_provider.dart';
class Buttons extends StatefulWidget {
  const Buttons({super.key});
  @override
  State<Buttons> createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  @override
  Widget build(BuildContext context) {
    return const ButtonTypesGroup(enabled: true,);
  }
}

class ButtonTypesGroup extends StatelessWidget {
  const ButtonTypesGroup({super.key, required this.enabled});

  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<BottomNavigationProvider>();
    final VoidCallback? onPressed = enabled ?context.read<BottomNavigationProvider>().increment : null;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: .spaceEvenly,
          children: <Widget>[
            Row(
              spacing: 10,
              mainAxisAlignment: .center,
              children: [
                ElevatedButton(onPressed: onPressed, child: const Text('Elevated')),
                Text("currentIndex is : ${provider.currentIndex}")
              ],
            ),
            FilledButton(onPressed: onPressed, child: const Text('Filled')),
            FilledButton.tonal(
              onPressed: onPressed,
              child: const Text('Filled Tonal'),
            ),
            OutlinedButton(onPressed: onPressed, child: const Text('Outlined')),
            TextButton(onPressed: onPressed, child: const Text('Text')),
          ],
        ),
      ),
    );
  }
}