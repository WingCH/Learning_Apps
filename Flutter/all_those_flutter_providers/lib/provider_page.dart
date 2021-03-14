import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<ProviderPageModel>(
      create: (context) => ProviderPageModel(),
      child: Scaffold(
        appBar: AppBar(title: Text('My App')),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(20),
              color: Colors.green[200],
              child: Consumer<ProviderPageModel>(
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
              child: Consumer<ProviderPageModel>(
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

class ProviderPageModel {
  String someValue = 'Hello';

  void doSomething() {
    someValue = 'Goodbye';
    print(someValue);
  }
}
