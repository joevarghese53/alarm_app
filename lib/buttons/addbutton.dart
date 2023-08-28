import 'package:alarm_app/functions/alarmcardfunctions.dart';
import 'package:alarm_app/models/alarmcardmodel.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

// ignore: must_be_immutable
class AddButton extends StatelessWidget {
  AddButton({super.key});

  final _texteditingcontroller = TextEditingController();
  ValueNotifier<TimeOfDay> newtimenotifier =
      ValueNotifier(const TimeOfDay(hour: 12, minute: 12));
  final formatter = DateFormat.Hm();
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => showModalBottomSheet(
        context: context,
        builder: (context) => Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextField(
                controller: _texteditingcontroller,
                decoration: InputDecoration(
                  hintText: 'Title',
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Icon(Icons.access_alarm),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: ValueListenableBuilder(
                    valueListenable: newtimenotifier,
                    builder: (context, ntime, child) {
                      return Text(
                        formatTimeOfDay(ntime),
                        style: const TextStyle(fontSize: 30),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: IconButton(
                      onPressed: () async {
                        TimeOfDay? newtime = await showTimePicker(
                            context: context, initialTime: TimeOfDay.now());
                        if (newtime != null) {
                          newtimenotifier.value = newtime;
                        }
                      },
                      icon: const Icon(Icons.edit)),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.music_note)),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed: () {
                  final _title = _texteditingcontroller.text;
                  if (_title.isEmpty) {
                    return;
                  }
                  final modeldata = AlarmModel(
                    id: DateTime.now().millisecondsSinceEpoch.toString(),
                    title: _title,
                    time: newtimenotifier.value,
                  );
                  AlarmCardFns().insertdata(modeldata);
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                child: const Text(
                  'Save',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      child: const Icon(Icons.add),
    );
  }

  String formatTimeOfDay(TimeOfDay time) {
    final now = DateTime.now();
    final dateTime =
        DateTime(now.year, now.month, now.day, time.hour, time.minute);
    return formatter.format(dateTime);
  }
}
