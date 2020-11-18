import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/icons/zamacard_icon_foreground.png',
          key: const Key('splash_bloc_image'),
          width: 150,
        ),
      ),
    );
  }

  static route() {
    return MaterialPageRoute(builder: (_) => SplashPage());
  }
}
