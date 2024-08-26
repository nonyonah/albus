class SuggestionItemModel {
  final String name;
  final String emoji;
  final bool isSelected;

  SuggestionItemModel({
    this.name = '',
    this.emoji = '',
    this.isSelected = false,
  });

  SuggestionItemModel copyWith({
    String? name,
    String? emoji,
    bool? isSelected,
  }) {
    return SuggestionItemModel(
      name: name ?? this.name,
      emoji: emoji ?? this.emoji,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}

class Suggestion2ItemModel {
  final String name;
  final String emoji;
  final bool isSelected;

  Suggestion2ItemModel({
    this.name = '',
    this.emoji = '',
    this.isSelected = false,
  });

  Suggestion2ItemModel copyWith({
    String? name,
    String? emoji,
    bool? isSelected,
  }) {
    return Suggestion2ItemModel(
      name: name ?? this.name,
      emoji: emoji ?? this.emoji,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}

class Suggestion3ItemModel {
  final String name;
  final String emoji;
  final bool isSelected;

  Suggestion3ItemModel({
    this.name = '',
    this.emoji = '',
    this.isSelected = false,
  });

  Suggestion3ItemModel copyWith({
    String? name,
    String? emoji,
    bool? isSelected,
  }) {
    return Suggestion3ItemModel(
      name: name ?? this.name,
      emoji: emoji ?? this.emoji,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}