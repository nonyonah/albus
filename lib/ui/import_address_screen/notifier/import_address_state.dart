import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/chain_constants.dart';
import '../model/import_address_model.dart';

class ImportAddressState extends Equatable {
  final TextEditingController nameController;
  final Map<String, TextEditingController> addressControllers;
  final ImportAddressModel? importAddressModelObj;
  final String? error;

  ImportAddressState({
    required this.nameController,
    required this.addressControllers,
    this.importAddressModelObj,
    this.error,
  });

  factory ImportAddressState.initial() {
    return ImportAddressState(
      nameController: TextEditingController(),
      addressControllers: {
        ChainConstants.ethereum: TextEditingController(),
        ChainConstants.base: TextEditingController(),
        ChainConstants.optimism: TextEditingController(),
        ChainConstants.solana: TextEditingController(),
      },
      importAddressModelObj: const ImportAddressModel(),
    );
  }

  @override
  List<Object?> get props => [
    nameController,
    addressControllers,
    importAddressModelObj,
    error,
  ];

  ImportAddressState copyWith({
    TextEditingController? nameController,
    Map<String, TextEditingController>? addressControllers,
    ImportAddressModel? importAddressModelObj,
    String? error,
  }) {
    return ImportAddressState(
      nameController: nameController ?? this.nameController,
      addressControllers: addressControllers ?? this.addressControllers,
      importAddressModelObj: importAddressModelObj ?? this.importAddressModelObj,
      error: error,
    );
  }
}
