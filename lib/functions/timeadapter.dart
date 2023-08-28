import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class TimeOfDayAdapter extends TypeAdapter<TimeOfDay> {
  @override
  int get typeId => 100; // Replace with a unique type id of your choice.

  @override
  TimeOfDay read(BinaryReader reader) {
    final hour = reader.readInt();
    final minute = reader.readInt();
    return TimeOfDay(hour: hour, minute: minute);
  }

  @override
  void write(BinaryWriter writer, TimeOfDay time) {
    writer.writeInt(time.hour);
    writer.writeInt(time.minute);
  }
}
