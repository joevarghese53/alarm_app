import 'package:alarm_app/models/alarmcardmodel.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'screens/homescreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(AlarmModelAdapter().typeId)) {
    Hive.registerAdapter(AlarmModelAdapter());
  }
  Hive.registerAdapter(TimeOfDayAdapter());
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.orange,
      ),
      home: const HomeScreen(),
    );
  }
}
