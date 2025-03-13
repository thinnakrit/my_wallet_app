import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AccountHeaderProfileWidget extends StatelessWidget {
  final bool isAuthenticated;
  final Function onLogin;

  const AccountHeaderProfileWidget({
    super.key,
    required this.isAuthenticated,
    required this.onLogin,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:
            isAuthenticated
                ? [
                  Text('John Doe'),
                  GestureDetector(
                    onTap: () {
                      Modular.to.pushNamed("/account");
                    },
                    child: Row(
                      children: [Text('Account'), Icon(Icons.chevron_right)],
                    ),
                  ),
                ]
                : [
                  GestureDetector(
                    onTap: () {
                      onLogin();
                    },
                    child: Row(children: [Text('Login/Register')]),
                  ),
                ],
      ),
    );
  }
}
