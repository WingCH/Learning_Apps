import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StreamProviderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<StreamProviderPageModel>(
      initialData: StreamProviderPageModel(someValue: 'default value'),
      create: (context) => getStreamOfStreamProviderPageModel(),
      child: Scaffold(
        appBar: AppBar(title: Text('My App')),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                padding: const EdgeInsets.all(20),
                color: Colors.green[200],
                child: Consumer<StreamProviderPageModel>(
                  //                    <--- Consumer
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
              color: Colors.blue[200],
              child: Consumer<StreamProviderPageModel>(
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

Stream<StreamProviderPageModel> getStreamOfStreamProviderPageModel() {
  //                        <--- Stream
  return Stream<StreamProviderPageModel>.periodic(
          Duration(seconds: 1), (x) => StreamProviderPageModel(someValue: '$x'))
      .take(10);
}

class StreamProviderPageModel {
  StreamProviderPageModel({this.someValue});

  String someValue = 'Hello';

  void doSomething() {
    someValue = 'Goodbye';
    print(someValue);
  }
}
