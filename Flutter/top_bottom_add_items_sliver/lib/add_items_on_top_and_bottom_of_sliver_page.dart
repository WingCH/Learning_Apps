import 'package:flutter/material.dart';

/*
https://github.com/flutter/flutter/issues/21541#issuecomment-629121578
https://dartpad.dartlang.org/c3b9b03925cdaaf88c1b8fe78a3b96b0
 */

class AddItemsOnTopAndBottomOfSliverPage extends StatefulWidget {
  AddItemsOnTopAndBottomOfSliverPage({Key key}) : super(key: key);

  @override
  _AddItemsOnTopAndBottomOfSliverPageState createState() =>
      _AddItemsOnTopAndBottomOfSliverPageState();
}

class _AddItemsOnTopAndBottomOfSliverPageState
    extends State<AddItemsOnTopAndBottomOfSliverPage> {
  List<int> top = [];
  List<int> bottom = [0];

  @override
  Widget build(BuildContext context) {
    const Key centerKey = ValueKey('second-sliver-list');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Press on the plus to add items above and below'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              setState(() {
                top.add(-top.length - 1);
                bottom.add(bottom.length);
              });
            },
          )
        ],
      ),
      body: CustomScrollView(
        center: centerKey,
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.blue[200 + top[index] % 4 * 100],
                  height: 100,
                  child: Text('Item: ${top[index]}'),
                );
              },
              childCount: top.length,
            ),
          ),
          SliverList(
            key: centerKey,
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.blue[200 + bottom[index] % 4 * 100],
                  height: 100 + bottom[index] % 4 * 20.0,
                  child: Text('Item: ${bottom[index]}'),
                );
              },
              childCount: bottom.length,
            ),
          ),
        ],
      ),
    );
  }
}
