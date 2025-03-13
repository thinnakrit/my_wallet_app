import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_wallet/features/authentication/data/cubit/auth_cubit.dart';
import 'package:my_wallet/features/authentication/data/cubit/auth_state.dart';

class AuthSectionWidget extends StatelessWidget {
  final Widget renderWidget;
  const AuthSectionWidget({super.key, required this.renderWidget});

  @override
  Widget build(BuildContext context) {
    final authCubit = Modular.get<AuthCubit>();
    return BlocBuilder<AuthCubit, AuthState>(
      bloc: authCubit,
      builder: (context, state) {
        final bool isAuthenticated = state.isAuthenticated;
        if (isAuthenticated) return renderWidget;
        return Container();
      },
    );
  }
}
