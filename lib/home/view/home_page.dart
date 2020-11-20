import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:zamacard/authentication/authentication.dart';
import 'package:zamacard/home/home.dart';

class HomePage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => HomePage());
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    final user = context.select((AuthenticationBloc bloc) => bloc.state.user);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: <Widget>[
          IconButton(
            key: const Key('homePage_logout_iconButton'),
            icon: const Icon(Icons.exit_to_app),
            onPressed: () => context
                .read<AuthenticationBloc>()
                .add(AuthenticationEventLogoutRequested()),
          )
        ],
      ),
      body: Align(
        alignment: const Alignment(0, -1 / 3),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Stack(
              children: [
                Container(
                  height: deviceSize.height / 4,
                  width: deviceSize.width - deviceSize.width * 0.1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Theme.of(context).backgroundColor,
                    gradient: new LinearGradient(
                        colors: [Colors.blue, Theme.of(context).canvasColor],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        tileMode: TileMode.clamp),
                  ),
                ),
                Positioned(top: 10, left: 10, child: Avatar(photo: user.photo)),
                Positioned(
                    bottom: 20,
                    left: 10,
                    child: SizedBox(
                      width: deviceSize.width / 2 - 0.2 * deviceSize.width / 2,
                      child: Text(
                        user.name ?? user.email,
                        style: textTheme.headline4,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    )),
                Positioned(
                  right: 5,
                  top: 5,
                  child: QrImage(
                    data: user.name ?? user.email,
                    size: deviceSize.height / 4 - 0.2 * deviceSize.height / 4,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
