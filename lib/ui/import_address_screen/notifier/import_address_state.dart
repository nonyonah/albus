import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/chain_constants.dart';
import '../model/import_address_model.dart';

class ImportAddressState extends Equatable {
  final TextEditingController nameController;
  final Map<String, TextEditingController> addressControllers;
  final ImportAddressModel? importAddressModelObj;
  final String? error;
  final bool isLoading;
  final Map<String, double> balances;
  final Map<String, String> validationMessages;

  const ImportAddressState({
    required this.nameController,
    required this.addressControllers,
    this.importAddressModelObj,
    this.error,
    this.isLoading = false,
    this.balances = const {},
    this.validationMessages = const {},
  });

  factory ImportAddressState.initial() {
    return ImportAddressState(
      nameController: TextEditingController(),
      addressControllers: {
        ChainConstants.base: TextEditingController(),
        ChainConstants.ethereum: TextEditingController(),
        ChainConstants.solana: TextEditingController(),
        ChainConstants.optimism: TextEditingController(),
      },
    );
  }

  @override
  List<Object?> get props => [
        nameController,
        addressControllers,
        importAddressModelObj,
        error,
        isLoading,
        balances,
        validationMessages,
      ];

  ImportAddressState copyWith({
    TextEditingController? nameController,
    Map<String, TextEditingController>? addressControllers,
    ImportAddressModel? importAddressModelObj,
    String? error,
    bool? isLoading,
    Map<String, double>? balances,
    Map<String, String>? validationMessages,
  }) {
    return ImportAddressState(
      nameController: nameController ?? this.nameController,
      addressControllers: addressControllers ?? this.addressControllers,
      importAddressModelObj:
          importAddressModelObj ?? this.importAddressModelObj,
      error: error,
      isLoading: isLoading ?? this.isLoading,
      balances: balances ?? this.balances,
      validationMessages: validationMessages ?? this.validationMessages,
    );
  }
}
