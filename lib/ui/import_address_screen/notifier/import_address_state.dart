import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../model/import_address_model.dart';

class ImportAddressState extends Equatable {
  ImportAddressState(
      {this.nameController,
      this.addressController,
      this.importAddressModelObj});

  TextEditingController? nameController;

  TextEditingController? addressController;

  ImportAddressModel? importAddressModelObj;

  @override
  List<Object?> get props =>
      [nameController, addressController, importAddressModelObj];

  ImportAddressState copyWith({
    TextEditingController? nameController,
    TextEditingController? addressController,
    ImportAddressModel? importAddressModelObj,
  }) {
    return ImportAddressState(
      nameController: nameController ?? this.nameController,
      addressController: addressController ?? this.addressController,
      importAddressModelObj:
          importAddressModelObj ?? this.importAddressModelObj,
    );
  }
}
