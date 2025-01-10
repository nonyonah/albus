import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'import_address_state.dart';

final importAddressNotifier = StateNotifierProvider.autoDispose<
    ImportAddressNotifier, ImportAddressState>(
  (ref) => ImportAddressNotifier(
    ImportAddressState(
      nameController: TextEditingController(),
      addressController: TextEditingController(),
    ),
  ),
);

class ImportAddressNotifier extends StateNotifier<ImportAddressState> {
  ImportAddressNotifier(ImportAddressState state) : super(state);
}
