import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MultiProviderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MultiProviderPageModel>(
            create: (context) => MultiProviderPageModel()),
        ChangeNotifierProvider<MultiProviderPageAnotherModel>(
            create: (context) => MultiProviderPageAnotherModel()),
      ],
      child: Scaffold(
        appBar: AppBar(title: Text('My App')),
        body: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(20),
                  color: Colors.green[200],
                  child: Consumer<MultiProviderPageModel>(
                    builder: (context, myModel, child) {
                      return ElevatedButton(
                        child: Text('Do something'),
                        onPressed: () {
                          // We have access to the model.
                          myModel.doSomething();
                        },
                      );
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(35),
                  color: Colors.blue[200],
                  child: Consumer<MultiProviderPageModel>(
                    builder: (context, myModel, child) {
                      return Text(myModel.someValue);
                    },
                  ),
                ),
              ],
            ),

            // SizedBox(height: 5),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    padding: const EdgeInsets.all(20),
                    color: Colors.red[200],
                    child: Consumer<MultiProviderPageAnotherModel>(
                      builder: (context, myModel, child) {
                        return ElevatedButton(
                          child: Text('Do something'),
                          onPressed: () {
                            myModel.doSomething();
                          },
                        );
                      },
                    )),
                Container(
                  padding: const EdgeInsets.all(35),
                  color: Colors.yellow[200],
                  child: Consumer<MultiProviderPageAnotherModel>(
                    builder: (context, anotherModel, child) {
                      return Text('${anotherModel.someValue}');
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MultiProviderPageModel with ChangeNotifier {
  String someValue = 'Hello';

  void doSomething() {
    someValue = 'Goodbye';
    print(someValue);
    notifyListeners();
  }
}

class MultiProviderPageAnotherModel with ChangeNotifier {
  int someValue = 0;

  void doSomething() {
    someValue = 5;
    print(someValue);
    notifyListeners();
  }
}
