import 'package:flutter/material.dart';

class NewAccountScreen extends StatelessWidget {
  const NewAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Account'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'New Account Screen',
            ),
          ],
        ),
      ),
    );
  }
}

