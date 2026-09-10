
import 'package:flutter/material.dart';

class LifeCycleExample extends StatefulWidget {
  const LifeCycleExample({super.key});

  @override
  State<LifeCycleExample> createState() => _LifeCycleExampleState();
}

class _LifeCycleExampleState extends State<LifeCycleExample> {

  @override
  void initState() {
    super.initState();
    print("=====> initState");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("=====> didChangeDependencies");

  }

  @override
  Widget build(BuildContext context) {
    print("=====> build");
    return const Placeholder();
  }

  @override
  void didUpdateWidget(covariant LifeCycleExample oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("=====> didUpdateWidget");
  }

  @override
  void deactivate() {
    super.deactivate();
    print("=====> deactivate");
  }

  @override
  void dispose() {
    super.dispose();
    print("=====> dispose");
  }
}
