import 'package:albus/screens/cash_balance_setup_screen/models/cash_balance_setup_model.dart';
import 'package:equatable/equatable.dart';

class CashBalanceSetupState extends Equatable{
  CashBalanceSetupState({this.cashBalanceSetupModelObj});

  CashBalanceSetupModel? cashBalanceSetupModelObj;

  @override
  List<Object?> get props => [cashBalanceSetupModelObj];
  CashBalanceSetupState copyWith(
  {CashBalanceSetupModel? cashBalanceSetupModelObj}
      ) {
    return CashBalanceSetupState(
      cashBalanceSetupModelObj: cashBalanceSetupModelObj ?? this.cashBalanceSetupModelObj,
    );
  }
}