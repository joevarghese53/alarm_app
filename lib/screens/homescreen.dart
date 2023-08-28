import 'package:alarm_app/widgets/maincard.dart';
import 'package:flutter/material.dart';

import '../buttons/addbutton.dart';
import '../functions/alarmcardfunctions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    AlarmCardFns().refreshUi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: const [
          Icon(
            Icons.settings,
            size: 30,
          ),
          SizedBox(
            width: 25,
          )
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: AlarmCardFns().datalist,
        builder: (context, newlist, child) {
          return ListView.builder(
            itemBuilder: (context, index) {
              final dcard = newlist[index];

              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 2, horizontal: 15),
                child: SizedBox(
                  height: 140,
                  child: MainCard(
                    titletext: dcard.title,
                    timetext: dcard.time,
                  ),
                ),
              );
            },
            itemCount: newlist.length,
          );
        },
      ),
      floatingActionButton: AddButton(),
    );
  }
}
