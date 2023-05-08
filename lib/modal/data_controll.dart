import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'data.dart';

class DataController extends GetxController {
  TextFormField textFormField = TextFormField(
    decoration: const InputDecoration(
        border: OutlineInputBorder(), hintText: "Enter You Text"),
  );

  List<Data> list = [
    Data(
        body: TextFormField(
            decoration: const InputDecoration(
                border: OutlineInputBorder(), hintText: "Enter You Text")),
        time: "10 AM")
  ];
  int i = 10;
  int b = 0;
  addToList() {
    i++;
    String full = "";
    if (i > 12) {
      b++;
      if (b <= 12) {
        String string = "PM";
        full = "$b $string";
        Data data = Data(body: textFormField, time: full);
        list.add(data);
      }
    } else {
      String string = "AM";
      full = "$i $string";
      Data data = Data(body: textFormField, time: full);
      list.add(data);
    }

    update();
  }
}