import 'package:flutter/material.dart';

class BadgeExample extends StatelessWidget {
  const BadgeExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: <Widget>[
            IconButton(
              icon: const Badge(
                label: Text('Your label'),
                backgroundColor: Colors.blueAccent,
                child: Icon(Icons.receipt),
              ),
              onPressed: () {},
            ),
            const SizedBox(height: 20),
            IconButton(
              icon: Badge.count(
                count: 9999,
                child: const Icon(Icons.notifications),
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}