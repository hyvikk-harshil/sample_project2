import 'package:flutter/material.dart';

///Date-Picker
class DatePicker1 extends StatefulWidget {
  const DatePicker1({super.key});
  @override
  State<DatePicker1> createState() => _DatePicker1State();
}
class _DatePicker1State extends State<DatePicker1> {
  DateTime? selectedDate;
  Future<void> _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(2025,7,15),
      firstDate: DateTime(2024),
      lastDate: DateTime(2026)
    );
    setState(() {
      selectedDate = pickedDate;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: .min,
          spacing: 20,
          children: [
            Text(selectedDate != null?"${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}":"Not Selected"),
            OutlinedButton(
                onPressed: _selectDate,
                child: Text("Select Date"))
          ],
        ),
      ),
    );
  }
}
