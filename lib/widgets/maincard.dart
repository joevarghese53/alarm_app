import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../buttons/togglebutton.dart';
import 'package:intl/intl.dart';

class MainCard extends StatelessWidget {
  final String titletext;
  final TimeOfDay timetext;

  MainCard({Key? key, required this.titletext, required this.timetext})
      : super(key: key);

  final formatter = DateFormat.Hm();

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(171, 255, 255, 255),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(titletext,
                    style: GoogleFonts.robotoSlab(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                const SizedBox(
                  width: 35,
                ),
                IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  formatTimeOfDay(timetext),
                  style: const TextStyle(fontSize: 30),
                ),
                ToggleButton(),
              ],
            )
          ],
        ),
      ),
    );
  }

  String formatTimeOfDay(TimeOfDay time) {
    final now = DateTime.now();
    final dateTime =
        DateTime(now.year, now.month, now.day, time.hour, time.minute);
    return formatter.format(dateTime);
  }
}
