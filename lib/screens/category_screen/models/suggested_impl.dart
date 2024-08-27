import '../suggested_item.dart';

class SuggestedItemImpl extends SuggestedItem {
  SuggestedItemImpl({required String id, required String name, bool isSelected = false})
      : super(id: id, name: name, isSelected: isSelected);

  @override
  SuggestedItemImpl copyWith({bool? isSelected}) {
    return SuggestedItemImpl(
      id: id,
      name: name,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}