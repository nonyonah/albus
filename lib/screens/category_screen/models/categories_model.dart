import 'package:albus/screens/category_screen/models/suggested_item.dart';

class CategoriesModel {
  final List<SuggestionItemModel> suggestion1ItemList;
  final List<Suggestion2ItemModel> suggestion2ItemList;
  final List<Suggestion3ItemModel> suggestion3ItemList;

  CategoriesModel({
    required this.suggestion1ItemList,
    required this.suggestion2ItemList,
    required this.suggestion3ItemList,
  });

  CategoriesModel copyWith({
    List<SuggestionItemModel>? suggestion1ItemList,
    List<Suggestion2ItemModel>? suggestion2ItemList,
    List<Suggestion3ItemModel>? suggestion3ItemList,
  }) {
    return CategoriesModel(
      suggestion1ItemList: suggestion1ItemList ?? this.suggestion1ItemList,
      suggestion2ItemList: suggestion2ItemList ?? this.suggestion2ItemList,
      suggestion3ItemList: suggestion3ItemList ?? this.suggestion3ItemList,
    );
  }
}