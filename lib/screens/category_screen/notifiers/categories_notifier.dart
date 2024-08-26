import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/categories_model.dart';
import '../models/suggested_item.dart';
import 'categories_state.dart';

final categoriesNotifier = StateNotifierProvider<CategoriesNotifier, CategoriesState>((ref) => CategoriesNotifier(CategoriesState(
  categoriesModelObj: CategoriesModel(
    suggestion1ItemList: List.generate(3, (index) => SuggestionItemModel()),
    suggestion2ItemList: List.generate(3, (index) => Suggestion2ItemModel()),
    suggestion3ItemList: List.generate(4, (index) => Suggestion3ItemModel()),
  ),
)));

/// A notifier that manages the state of Categories according to the event
class CategoriesNotifier extends StateNotifier<CategoriesState> {
  CategoriesNotifier(CategoriesState state) : super(state);

  void onSelectedChipView(
    int index,
    bool value,
  ) {
    List<SuggestionItemModel> newList = List<SuggestionItemModel>.from(
        state.categoriesModelObj.suggestion1ItemList);
    newList[index] = newList[index].copyWith(isSelected: value);
    state = state.copyWith(
      categoriesModelObj:
          state.categoriesModelObj.copyWith(suggestion1ItemList: newList),
    );
  }

  void onSelectedChipView1(
    int index,
    bool value,
  ) {
    List<Suggestion2ItemModel> newList = List<Suggestion2ItemModel>.from(
        state.categoriesModelObj.suggestion2ItemList);
    newList[index] = newList[index].copyWith(isSelected: value);
    state = state.copyWith(
      categoriesModelObj:
          state.categoriesModelObj.copyWith(suggestion2ItemList: newList),
    );
  }

  void onSelectedChipView2(
    int index,
    bool value,
  ) {
    List<Suggestion3ItemModel> newList = List<Suggestion3ItemModel>.from(
        state.categoriesModelObj.suggestion3ItemList);
    newList[index] = newList[index].copyWith(isSelected: value);
    state = state.copyWith(
      categoriesModelObj:
          state.categoriesModelObj.copyWith(suggestion3ItemList: newList),
    );
  }
}
