import 'package:flutter/material.dart';
import 'package:top_bottom_add_items_sliver/add_items_on_top_and_bottom_of_sliver_page.dart';
import 'package:top_bottom_add_items_sliver/lihkg_effect.dart';
import 'package:top_bottom_add_items_sliver/lihkg_effect_with_library.dart';
import 'package:top_bottom_add_items_sliver/scroll_to_the_top_to_refresh_page.dart';

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
      home: _Content(),
    );
  }
}

class _Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Add items on top and bottom of Sliver'),
            enableFeedback: true,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddItemsOnTopAndBottomOfSliverPage(),
                ),
              );
            },
          ),
          ListTile(
            title: Text('Scrollable example with SliverAppBar'),
            enableFeedback: true,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ScrollToTheTopToRefreshPage(),
                ),
              );
            },
          ),
          ListTile(
            title: Text('Lihkg Effect'),
            enableFeedback: true,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LihkgEffectPage(),
                ),
              );
            },
          ),
          ListTile(
            title: Text('Lihkg Effect with Library'),
            enableFeedback: true,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LihkgEffectWithLibraryPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
