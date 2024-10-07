import 'package:flutter/cupertino.dart';

class HomeScreenIos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("iOS Home"),
      ),
      child: Center(child: Text("Hello from iOS")),
    );
  }
}
