void navigateToSettings(BuildContext context) {
  if (Platform.isIOS) {
    Navigator.push(
      context,
      CupertinoPageRoute(builder: (context) => SettingsScreenIos()),
    );
  } else {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SettingsScreenAndroid()),
    );
  }
}
