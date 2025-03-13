import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  final bool isAuthenticating;
  final bool isAuthenticated;
  final String? token;

  const AuthState(this.isAuthenticating, this.isAuthenticated, this.token);

  @override
  List<Object?> get props => [isAuthenticating, isAuthenticated, token];

  Map<String, dynamic> toJson() {
    return {
      'isAuthenticating': isAuthenticating,
      'isAuthenticated': isAuthenticated,
      'token': token,
    };
  }

  factory AuthState.fromJson(Map<String, dynamic> json) {
    return AuthStateInitial();
  }

  AuthState copyWith({
    bool? isAuthenticating,
    bool? isAuthenticated,
    String? token,
  });
}

class AuthStateInitial extends AuthState {
  const AuthStateInitial({
    bool isAuthenticating = false,
    bool isAuthenticated = false,
    String? token,
  }) : super(isAuthenticating, isAuthenticated, token);

  @override
  AuthState copyWith({
    bool? isAuthenticating,
    bool? isAuthenticated,
    String? token,
  }) {
    return AuthStateInitial(
      isAuthenticating: isAuthenticating ?? this.isAuthenticating,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      token: token ?? this.token,
    );
  }
}

class AuthStateInProgress extends AuthState {
  const AuthStateInProgress({
    bool isAuthenticating = true,
    bool isAuthenticated = false,
    String? token,
  }) : super(isAuthenticating, isAuthenticated, token);

  @override
  AuthState copyWith({
    bool? isAuthenticating,
    bool? isAuthenticated,
    String? token,
  }) {
    return AuthStateInProgress(
      isAuthenticating: isAuthenticating ?? this.isAuthenticating,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      token: token ?? this.token,
    );
  }
}

class AuthStateAuthenticated extends AuthState {
  const AuthStateAuthenticated({
    bool isAuthenticating = false,
    bool isAuthenticated = true,
    required String token,
  }) : super(isAuthenticating, isAuthenticated, token);

  @override
  AuthState copyWith({
    bool? isAuthenticating,
    bool? isAuthenticated,
    String? token,
  }) {
    return AuthStateAuthenticated(
      isAuthenticating: isAuthenticating ?? this.isAuthenticating,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      token: token!,
    );
  }
}

class AuthStateFailure extends AuthState {
  final String errorMessage;

  const AuthStateFailure({
    bool isAuthenticating = false,
    bool isAuthenticated = false,
    String? token,
    required this.errorMessage,
  }) : super(isAuthenticating, isAuthenticated, token);

  @override
  AuthState copyWith({
    bool? isAuthenticating,
    bool? isAuthenticated,
    String? token,
  }) {
    return AuthStateFailure(
      isAuthenticating: isAuthenticating ?? this.isAuthenticating,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      token: token ?? this.token,
      errorMessage: errorMessage,
    );
  }
}
