
import 'package:equatable/equatable.dart';

class ImportAddressModel extends Equatable {
  final Map<String, bool> chainValidations;

  const ImportAddressModel({
    this.chainValidations = const {},
  });

  ImportAddressModel copyWith({
    Map<String, bool>? chainValidations,
  }) {
    return ImportAddressModel(
      chainValidations: chainValidations ?? this.chainValidations,
    );
  }

  @override
  List<Object?> get props => [chainValidations];
}
