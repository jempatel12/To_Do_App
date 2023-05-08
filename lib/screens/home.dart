import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../controllers/them_controll.dart';
import '../modal/data_controll.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    themeController themecontroller = Get.put(themeController());
    DataController dataController = Get.put(DataController());
    return Scaffold(
      appBar: AppBar(
        title: Text("TO DO App"),
        centerTitle: true,
        actions: [
          GetBuilder<themeController>(builder: (_) {
            return Switch(
                activeColor: Colors.green,
                inactiveThumbColor: Colors.white,
                value: themecontroller.dark,
                onChanged: (val) {
                  themecontroller.themeChange(val);
                });
          }),
        ],
      ),
      body: GetBuilder<DataController>(
        builder: (_) {
          return ListView.builder(
              itemCount: dataController.list!.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Container(
                      height: 8.h,
                      width: 20.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border.all(width: 5),
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        "${dataController.list[index].time}",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(width: 3.w),
                    Expanded(child: dataController.list[index].body)
                  ],
                ),
              ));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          dataController.addToList();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}