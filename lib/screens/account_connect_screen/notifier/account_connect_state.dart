import 'package:equatable/equatable.dart';

import '../model/account_connect_model.dart';

// ignore: must_be_immutable
class AccountConnectState extends Equatable {
  AccountConnectState({this.accountConnectModelObj});

  AccountConnectModel? accountConnectModelObj;

  @override
  List<Object?> get props => [accountConnectModelObj];
  AccountConnectState copyWith({AccountConnectModel? accountConnectModelObj}) {
    return AccountConnectState(
      accountConnectModelObj: accountConnectModelObj ?? accountConnectModelObj,
    );
  }
}

