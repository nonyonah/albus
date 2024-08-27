import '../suggested_item.dart';

class CategoriesModel {
  final List<SuggestedItem> suggestedItems;

  CategoriesModel({required this.suggestedItems});

  CategoriesModel copyWith({List<SuggestedItem>? suggestedItems}) {
    return CategoriesModel(
      suggestedItems: suggestedItems ?? this.suggestedItems,
    );
  }
}