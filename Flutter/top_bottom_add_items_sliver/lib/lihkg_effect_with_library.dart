import 'package:flutter/material.dart';
import 'package:pull_to_refresh_notification/pull_to_refresh_notification.dart';

// TODO: 無load more, 似乎要用翻普通方法
class LihkgEffectWithLibraryPage extends StatefulWidget {
  LihkgEffectWithLibraryPage({Key key}) : super(key: key);

  @override
  _LihkgEffectWithLibraryPageState createState() =>
      _LihkgEffectWithLibraryPageState();
}

class _LihkgEffectWithLibraryPageState
    extends State<LihkgEffectWithLibraryPage> {
  List<int> top = [];
  List<int> bottom = List<int>.generate(10, (int index) => 50 + index);

  @override
  void initState() {
    super.initState();
  }

  Future<bool> onRefresh() {
    return Future<bool>.delayed(const Duration(seconds: 5), () {
      setState(() {
        top.addAll(List<int>.generate(10, (int index) => index));
      });
      return true;
    });
  }

  Widget buildRefreshHeader(PullToRefreshScrollNotificationInfo info) {
    final double offset = info?.dragOffset ?? 0.0;
    print(offset);
    if (offset == 0) {
      return SliverToBoxAdapter(child: SizedBox.shrink());
    } else {
      return SliverToBoxAdapter(
        child: Container(
          height: offset,
          child: Column(
            children: [
              LinearProgressIndicator(
                backgroundColor: Colors.yellow,
                minHeight: 2,
              ),
              Expanded(
                  child: Container(
                color: Colors.blueGrey,
              ))
            ],
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    const Key centerKey = ValueKey('second-sliver-list');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Press on the plus to add items above and below'),
      ),
      body: PullToRefreshNotification(
        maxDragOffset: 80,
        onRefresh: onRefresh,
        child: CustomScrollView(
          center: centerKey,
          physics: const AlwaysScrollableClampingScrollPhysics(),
          slivers: <Widget>[
            PullToRefreshContainer(buildRefreshHeader),
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
      ),
    );
  }
}
