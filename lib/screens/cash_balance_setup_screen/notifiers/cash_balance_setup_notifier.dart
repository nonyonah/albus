
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/cash_balance_setup_model.dart';
import 'cash_balance_setup_state.dart';

final cashBalanceSetupNotifier = StateNotifierProvider<CashBalanceSetupNotifier, CashBalanceSetupState>(
    (ref) => CashBalanceSetupNotifier(CashBalanceSetupState(cashBalanceSetupModelObj: const CashBalanceSetupModel()
    )),
);

class CashBalanceSetupNotifier extends StateNotifier<CashBalanceSetupState>{
  CashBalanceSetupNotifier(super.state);
}