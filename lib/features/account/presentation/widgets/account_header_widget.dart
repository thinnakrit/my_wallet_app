import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_wallet/features/account/presentation/widgets/account_header_profile_widget.dart';
import 'package:my_wallet/features/authentication/data/cubit/auth_cubit.dart';
import 'package:my_wallet/features/authentication/data/cubit/auth_state.dart';

class AccountHeaderWidget extends StatelessWidget {
  const AccountHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final authCubit = Modular.get<AuthCubit>();
    return BlocBuilder<AuthCubit, AuthState>(
      bloc: authCubit,
      builder: (context, state) {
        final bool isAuthenticated = state.isAuthenticated;
        final bool isAuthenticating = state.isAuthenticating;

        if (isAuthenticating) {
          return Center(child: CircularProgressIndicator());
        }

        return Row(
          spacing: 8,
          children: [
            Flexible(
              child: Row(
                spacing: 8,
                children: [
                  isAuthenticated
                      ? CircleAvatar(child: Icon(Icons.account_circle))
                      : Container(),
                  AccountHeaderProfileWidget(
                    isAuthenticated: isAuthenticated,
                    onLogin: () {
                      authCubit.login('username', "password");
                    },
                  ),
                ],
              ),
            ),
            GestureDetector(
              child: Icon(Icons.notifications, color: Colors.black),
              onTap: () {
                authCubit.logout();
              },
            ),
            GestureDetector(
              child: Icon(Icons.settings, color: Colors.black),
              onTap: () {},
            ),
          ],
        );
      },
    );
  }
}
