import 'package:flutter/material.dart';

class PickerDemo extends StatefulWidget {
  const PickerDemo({super.key});

  @override
  State<PickerDemo> createState() => _PickerDemoState();
}

class _PickerDemoState extends State<PickerDemo> {
  String _date = '';
  String _time = '';

  // show date picker
  void showDate() async {
    DateTime? dt = await showDatePicker(
        context: context,
        firstDate: DateTime(2024, 1, 1),
        lastDate: DateTime(2024, 12, 31));
    if (dt != null) {
      setState(() {
        // _date = dt.toString();
        _date = '${dt.day}-${dt.month}-${dt.year}';
      });
    }
  }

  //show time picker
  void showTime() async {
    TimeOfDay? td = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if(td != null){
      setState(() {
        // _time = td.toString();
        _time = '${td.hour}:${td.minute}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                FilledButton.icon(
                  onPressed: showDate,
                  label: const Text(
                    'Date Picker',
                  ),
                  icon: const Icon(Icons.calendar_today),
                ),
                Text('You select: $_date'),
              ],
            ),
            Row(
              children: [
                FilledButton.icon(
                  onPressed: showTime,
                  label: const Text(
                    'Time Picker',
                  ),
                  icon: const Icon(Icons.access_time),
                ),
                Text('You select: $_time'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
