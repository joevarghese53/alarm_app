// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class ToggleButton extends StatelessWidget {
  ToggleButton({super.key});
  ValueNotifier<bool> isOn = ValueNotifier(false);
  void toggleSwitch(bool value) {
    isOn.value = !isOn.value;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isOn,
      builder: (context, value, child) => Transform.scale(
        scaleX: 1,
        scaleY: 0.86,
        child: Switch(
          value: value,
          onChanged: toggleSwitch,
          activeTrackColor: const Color.fromARGB(255, 255, 115, 0),
        ),
      ),
    );
  }
}
