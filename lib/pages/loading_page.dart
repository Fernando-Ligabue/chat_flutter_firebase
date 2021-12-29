import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const CircularProgressIndicator(
              backgroundColor: Colors.white,
            ),
            const SizedBox(height: 10.0),
            Text(
              'Loading...',
              style: TextStyle(
                fontSize: 18.0,
                color: Theme.of(context).primaryTextTheme.headline6?.color,
              ),
            )
          ],
        )));
  }
}
