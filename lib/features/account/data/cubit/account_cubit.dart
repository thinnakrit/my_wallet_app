import 'package:flutter_bloc/flutter_bloc.dart';

part 'account_state.dart';

class AccountCubit extends Cubit<AccountState> {
  AccountCubit() : super(AccountStateInitial());

  void updateAccount(AccountStateValue account) {
    emit(account);
  }

  void getAccount(String uuid) {
    emit(
      AccountStateValue(
        uuid: uuid,
        name: 'John Doe',
        avatarUrl: 'https://example.com/avatar.jpg',
      ),
    );
  }
}
