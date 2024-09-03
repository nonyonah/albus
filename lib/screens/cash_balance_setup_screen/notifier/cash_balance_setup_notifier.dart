import 'package:albus/screens/cash_balance_setup_screen/notifier/cash_balance_setup_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/cash_balance_setup_model.dart';

final cashBalanceSetupNotifier = StateNotifierProvider<CashBalanceSetupNotifier, CashBalanceSetupState>(
    (ref) => CashBalanceSetupNotifier(CashBalanceSetupState(cashBalanceSetupModelObj: CashBalanceSetupModel()
    )),
);

class CashBalanceSetupNotifier extends StateNotifier<CashBalanceSetupState>{
  CashBalanceSetupNotifier(super.state);
}