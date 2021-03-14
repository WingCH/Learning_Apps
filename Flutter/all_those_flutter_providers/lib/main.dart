import 'package:all_those_flutter_providers/change_notifier_provider_page.dart';
import 'package:all_those_flutter_providers/future_provider_page.dart';
import 'package:all_those_flutter_providers/provider_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Making sense of all those Flutter Providers"),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Provider'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ProviderPage();
                  },
                ),
              );
            },
          ),
          ListTile(
            title: Text('ChangeNotifierProvider'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ChangeNotifierProviderPage();
                  },
                ),
              );
            },
          ),
          ListTile(
            title: Text('FutureProvider'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return FutureProviderPage();
                  },
                ),
              );
            },
          ),
          ListTile(title: Text('I\'m dedicating every day to you')),
          ListTile(title: Text('I\'m dedicating every day to you')),
        ],
      ),
    );
  }
}
