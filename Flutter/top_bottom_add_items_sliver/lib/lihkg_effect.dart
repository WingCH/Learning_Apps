import 'package:flutter/material.dart';

/*
https://github.com/flutter/flutter/issues/21541#issuecomment-629121578
https://dartpad.dartlang.org/c3b9b03925cdaaf88c1b8fe78a3b96b0
 */

// TODO: study PullToRefreshAppbar && loading_more_list
class LihkgEffectPagePage extends StatefulWidget {
  LihkgEffectPagePage({Key key}) : super(key: key);

  @override
  _LihkgEffectPagePageState createState() => _LihkgEffectPagePageState();
}

class _LihkgEffectPagePageState extends State<LihkgEffectPagePage> {
  ScrollController _scrollController = ScrollController();
  List<int> top = [];
  List<int> bottom = List<int>.generate(10, (int index) => 50 + index);

  bool havePreviousPage = true;
  bool previousPageLoading = false;

  bool haveNextPage = true;
  bool nextPageLoading = false;

  void loadPreviousPage() {
    Future.delayed(Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          int lastNumber = (top.length == 0 ? bottom.first : top.last) - 1;
          top.addAll(List<int>.generate(10, (int index) => lastNumber - index));

          previousPageLoading = false;
          havePreviousPage = top.last != 0;
        });
      }
    });
  }

  void loadNextPage() {
    Future.delayed(Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          int lastNumber = bottom.last + 1;
          bottom.addAll(List<int>.generate(10, (int index) => lastNumber + index));

          nextPageLoading = false;
          haveNextPage = bottom.last != 99;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      // print('pixels' + _scrollController.position.pixels.toString());
      // print('minScrollExtent' +
      //     _scrollController.position.minScrollExtent.toString());
      // print('maxScrollExtent' +
      //     _scrollController.position.maxScrollExtent.toString());
      if (_scrollController.position.pixels <
          _scrollController.position.minScrollExtent) {
        if (!previousPageLoading && havePreviousPage) {
          setState(() {
            previousPageLoading = true;
            loadPreviousPage();
          });
          print('Top');
        }
      }

      if (_scrollController.position.pixels >
          _scrollController.position.maxScrollExtent) {
        if (!nextPageLoading && haveNextPage) {
          setState(() {
            nextPageLoading = true;
            loadNextPage();
          });
          print('Bottom');
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    const Key centerKey = ValueKey('second-sliver-list');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Press on the plus to add items above and below'),
      ),
      body: CustomScrollView(
        controller: _scrollController,
        physics: BouncingScrollPhysics(),
        center: centerKey,
        slivers: <Widget>[
          if (previousPageLoading)
            SliverToBoxAdapter(
              child: LinearProgressIndicator(backgroundColor: Colors.red),
            ),
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
          if (nextPageLoading)
            SliverToBoxAdapter(
              child: LinearProgressIndicator(backgroundColor: Colors.red),
            ),
        ],
      ),
    );
  }
}
