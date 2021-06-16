import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class CounterPage extends StatelessWidget {
  final String title;

  CounterPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            GetBuilder<CounterLogic>(
              id: 'text',
              init: CounterLogic(),
              builder: (logic) {
                return Text(
                  logic.count1.toString(),
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            GetBuilder<CounterLogic>(
              builder: (logic) {
                return Text(
                  logic.count2.toString(),
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            Obx(() {
              return Text(
                Get.find<CounterLogic>().count3.toString(),
                style: Theme.of(context).textTheme.headline4,
              );
            }),
            Obx(() {
              return Text(
                Get.find<CounterLogic>().count4.toString(),
                style: Theme.of(context).textTheme.headline4,
              );
            }),
            GetX<CounterLogic>(
              builder: (controller) {
                print("count 3 rebuild");
                return Text(
                  '${controller.count3.value}',
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            GetX<CounterLogic>(
              builder: (controller) {
                print("count 4 rebuild");
                return Text(
                  '${controller.count4.value}',
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: GetBuilder<CounterLogic>(
        builder: (logic) {
          return FloatingActionButton(
            onPressed: logic.incrementCount3,
            tooltip: 'Increment',
            child: Icon(Icons.add),
          );
        },
      ),
    );
  }
}
