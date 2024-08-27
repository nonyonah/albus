import 'package:equatable/equatable.dart';

class SuggestedItemModel extends Equatable {
  final String skillcard;
  final bool isSelected;

  const SuggestedItemModel({String? skillcard, bool? isSelected})
      : skillcard = skillcard ?? "Groceries",
        isSelected = isSelected ?? false;

  SuggestedItemModel copyWith({
    String? skillcard,
    bool? isSelected,
  }) {
    return SuggestedItemModel(
      skillcard: skillcard ?? this.skillcard,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  @override
  List<Object> get props => [skillcard, isSelected];
}

class Suggested2ItemModel extends SuggestedItemModel {
  const Suggested2ItemModel({String? skillcard, super.isSelected})
      : super(
          skillcard: skillcard ?? "Restaurants",
        );

  @override
  Suggested2ItemModel copyWith({
    String? skillcard,
    bool? isSelected,
  }) {
    return Suggested2ItemModel(
      skillcard: skillcard ?? this.skillcard,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}

class Suggested3ItemModel extends SuggestedItemModel {
  const Suggested3ItemModel({String? skillcard, super.isSelected})
      : super(
          skillcard: skillcard ?? "Repairs",
        );

  @override
  Suggested3ItemModel copyWith({
    String? skillcard,
    bool? isSelected,
  }) {
    return Suggested3ItemModel(
      skillcard: skillcard ?? this.skillcard,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}

class Suggested4ItemModel extends SuggestedItemModel {
  const Suggested4ItemModel({String? skillcard, super.isSelected})
      : super(
          skillcard: skillcard ?? "Subscriptions",
        );

  @override
  Suggested4ItemModel copyWith({
    String? skillcard,
    bool? isSelected,
  }) {
    return Suggested4ItemModel(
      skillcard: skillcard ?? this.skillcard,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}

class Suggested5ItemModel extends SuggestedItemModel {
  const Suggested5ItemModel({String? skillcard, bool? isSelected})
      : super(
          skillcard: skillcard ?? "Transportation",
          isSelected: isSelected,
        );

  @override
  Suggested5ItemModel copyWith({
    String? skillcard,
    bool? isSelected,
  }) {
    return Suggested5ItemModel(
      skillcard: skillcard ?? this.skillcard,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}

class Suggested6ItemModel extends SuggestedItemModel {
  const Suggested6ItemModel({String? skillcard, bool? isSelected})
      : super(
          skillcard: skillcard ?? "Clothing",
          isSelected: isSelected,
        );

  @override
  Suggested6ItemModel copyWith({
    String? skillcard,
    bool? isSelected,
  }) {
    return Suggested6ItemModel(
      skillcard: skillcard ?? this.skillcard,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}

class Suggested7ItemModel extends SuggestedItemModel {
  const Suggested7ItemModel({String? skillcard, bool? isSelected})
      : super(
          skillcard: skillcard ?? "Electricity",
          isSelected: isSelected,
        );

  @override
  Suggested7ItemModel copyWith({
    String? skillcard,
    bool? isSelected,
  }) {
    return Suggested7ItemModel(
      skillcard: skillcard ?? this.skillcard,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}