import '../suggested_item.dart';

class SuggestedItemImpl extends SuggestedItem {
  SuggestedItemImpl({required super.id, required super.name, super.isSelected});

  @override
  SuggestedItemImpl copyWith({bool? isSelected}) {
    return SuggestedItemImpl(
      id: id,
      name: name,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}