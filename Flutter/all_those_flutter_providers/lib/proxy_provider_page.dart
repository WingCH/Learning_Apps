import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProxyProviderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProxyProviderPageModel>(
          create: (context) => ProxyProviderPageModel(),
        ),
        ProxyProvider<ProxyProviderPageModel, ProxyProviderPageAnotherModel>(
          update: (context, myModel, anotherModel) =>
              ProxyProviderPageAnotherModel(myModel),
        ),
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
                    child: Consumer<ProxyProviderPageModel>(
                      builder: (context, myModel, child) {
                        return ElevatedButton(
                          child: Text('Do something'),
                          onPressed: () {
                            myModel.doSomething('Goodbye');
                          },
                        );
                      },
                    )),
                Container(
                  padding: const EdgeInsets.all(35),
                  color: Colors.blue[200],
                  child: Consumer<ProxyProviderPageModel>(
                    builder: (context, myModel, child) {
                      return Text(myModel.someValue);
                    },
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(20),
              color: Colors.red[200],
              child: Consumer<ProxyProviderPageAnotherModel>(
                builder: (context, anotherModel, child) {
                  return ElevatedButton(
                    child: Text('Do something else'),
                    onPressed: () {
                      anotherModel.doSomethingElse();
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProxyProviderPageModel with ChangeNotifier {
  String someValue = 'Hello';

  void doSomething(String value) {
    someValue = value;
    print(someValue);
    notifyListeners();
  }
}

class ProxyProviderPageAnotherModel {
  ProxyProviderPageModel _myModel;

  ProxyProviderPageAnotherModel(this._myModel);

  void doSomethingElse() {
    _myModel.doSomething('See you later');
    print('doing something else');
  }
}
