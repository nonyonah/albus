import 'package:albus/screens/account_connect_screen/notifier/account_connect_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final accountConnectNotifier = StateNotifierProvider.autoDispose<
    AccountConnectNotifier, AccountConnectState>(
  (ref) => AccountConnectNotifier(AccountConnectState()),
);

class AccountConnectNotifier extends StateNotifier<AccountConnectState> {
  AccountConnectNotifier(super.state);
}
