class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoApp(
            theme: cupertinoTheme,
            home: MyCupertinoHomePage(),
          )
        : MaterialApp(
            theme: materialTheme,
            home: MyMaterialHomePage(),
          );
  }
}
