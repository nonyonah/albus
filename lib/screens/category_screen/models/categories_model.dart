import 'package:albus/screens/category_screen/models/suggested_item.dart';
import 'package:equatable/equatable.dart';

class CategoriesModel extends Equatable {
  CategoriesModel({
    this.suggestedItemList = const [],
    this.suggestedItemList2 = const [],
    this.suggestedItemList3 = const [],
    this.suggestedItemList4 = const [],
    this.suggestedItemList5 = const [],
    this.suggestedItemList6 = const [],
    this.suggestedItemList7 = const [],
  });

  final List<SuggestedItemModel> suggestedItemList;
  final List<Suggested2ItemModel> suggestedItemList2;
  final List<Suggested3ItemModel> suggestedItemList3;
  final List<Suggested4ItemModel> suggestedItemList4;
  final List<Suggested5ItemModel> suggestedItemList5;
  final List<Suggested6ItemModel> suggestedItemList6;
  final List<Suggested7ItemModel> suggestedItemList7;

  CategoriesModel copyWith({
    List<SuggestedItemModel>? suggestedItemList,
    List<Suggested2ItemModel>? suggestedItemList2,
    List<Suggested3ItemModel>? suggestedItemList3,
    List<Suggested4ItemModel>? suggestedItemList4,
    List<Suggested5ItemModel>? suggestedItemList5,
    List<Suggested6ItemModel>? suggestedItemList6,
    List<Suggested7ItemModel>? suggestedItemList7,
  }) {
    return CategoriesModel(
      suggestedItemList: suggestedItemList ?? this.suggestedItemList,
      suggestedItemList2: suggestedItemList2 ?? this.suggestedItemList2,
      suggestedItemList3: suggestedItemList3 ?? this.suggestedItemList3,
      suggestedItemList4: suggestedItemList4 ?? this.suggestedItemList4,
      suggestedItemList5: suggestedItemList5 ?? this.suggestedItemList5,
      suggestedItemList6: suggestedItemList6 ?? this.suggestedItemList6,
      suggestedItemList7: suggestedItemList7 ?? this.suggestedItemList7,
    );
  }

  @override
  List<Object?> get props => [
        suggestedItemList,
        suggestedItemList2,
        suggestedItemList3,
        suggestedItemList4,
        suggestedItemList5,
        suggestedItemList6,
        suggestedItemList7,
      ];
}
