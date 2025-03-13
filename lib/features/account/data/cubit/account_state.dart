part of 'account_cubit.dart';

abstract class AccountState {
  final String uuid;
  final String name;
  final String avatarUrl;

  AccountState({
    required this.uuid,
    required this.name,
    required this.avatarUrl,
  });
}

class AccountStateInitial extends AccountState {
  AccountStateInitial() : super(uuid: '', name: '', avatarUrl: '');
}

class AccountStateValue extends AccountState {
  AccountStateValue({
    required super.uuid,
    required super.name,
    required super.avatarUrl,
  });
}
