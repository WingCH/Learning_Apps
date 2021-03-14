import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FutureProviderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureProvider<FutureProviderPageModel>(
      initialData: FutureProviderPageModel(someValue: 'default value'),
      create: (context) => someAsyncFunctionToGetFutureProviderPageModel(),
      child: Scaffold(
        appBar: AppBar(title: Text('FutureProvider Example')),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(20),
              color: Colors.green[200],
              child: Consumer<FutureProviderPageModel>(
                //                    <--- Consumer
                builder: (context, myModel, child) {
                  return ElevatedButton(
                    child: Text('Do something'),
                    onPressed: () {
                      myModel.doSomething();
                    },
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(35),
              color: Colors.blue[200],
              child: Consumer<FutureProviderPageModel>(
                //                    <--- Consumer
                builder: (context, myModel, child) {
                  return Text(myModel.someValue);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<FutureProviderPageModel>
    someAsyncFunctionToGetFutureProviderPageModel() async {
  //  <--- async function
  await Future.delayed(Duration(seconds: 3));
  return FutureProviderPageModel(someValue: 'new data');
}

class FutureProviderPageModel {
  FutureProviderPageModel({this.someValue});

  String someValue = 'Hello';

  Future<void> doSomething() async {
    await Future.delayed(Duration(seconds: 2));
    someValue = 'Goodbye';
    print(someValue);
  }
}
