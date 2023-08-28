import 'package:alarm_app/models/alarmcardmodel.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

abstract class AlarmCardFunctions {
  Future<void> insertdata(AlarmModel value);
  Future<List<AlarmModel>> getdata();
}

class AlarmCardFns implements AlarmCardFunctions {
  // singleton
  AlarmCardFns._internal();
  static AlarmCardFns instance = AlarmCardFns._internal();
  factory AlarmCardFns() {
    return instance;
  }

  // ValueNotifier
  ValueNotifier<List<AlarmModel>> datalist = ValueNotifier([]);

  // insertdata
  @override
  Future<void> insertdata(AlarmModel value) async {
    final opendb = await Hive.openBox<AlarmModel>('alarmdatabase');
    await opendb.add(value);
    refreshUi();
  }

  // readdata
  @override
  Future<List<AlarmModel>> getdata() async {
    final opendb = await Hive.openBox<AlarmModel>('alarmdatabase');
    return opendb.values.toList();
  }

  // refreshui
  Future<void> refreshUi() async {
    final uiData = await getdata();
    datalist.value.clear();
    await Future.forEach(uiData, (element) => datalist.value.add(element));
    datalist.notifyListeners();
  }
}
