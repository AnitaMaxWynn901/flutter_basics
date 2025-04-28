import 'package:flutter/material.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({super.key});

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  String _startdate = '';
  String _enddate = '';
  DateTime? _startDateTime;

  void showStartDate() async {
    DateTime? st = await showDatePicker(
      context: context,
      firstDate: DateTime(2024, 10, 1),
      lastDate: DateTime(2024, 12, 31),
    );
    if (st != null) {
      setState(() {
        _startDateTime = st;
        _startdate = '${st.day}/${st.month}/${st.year}';
        _enddate = '';  // Reset end date when start date changes
      });
    }
  }

  void showEndDate() async {
    if (_startDateTime == null) return; // Prevents end date selection before start date

    DateTime? ed = await showDatePicker(
      context: context,
      firstDate: _startDateTime!, // Disable dates before selected start date
      lastDate: DateTime(2024, 12, 31),
    );
    if (ed != null) {
      setState(() {
        _enddate = '${ed.day}/${ed.month}/${ed.year}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'DatePicker Demo',
                style: TextStyle(fontSize: 26),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  FilledButton.icon(
                    onPressed: showStartDate,
                    label: const Text('From'),
                    icon: const Icon(Icons.calendar_today),
                  ),
                  Text('$_startdate'),
                ],
              ),
              Row(
                children: [
                  FilledButton.icon(
                    onPressed: showEndDate, // Disable end date button if no start date
                    label: const Text('To'),
                    icon: const Icon(Icons.calendar_today),
                  ),
                  Text('$_enddate'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
