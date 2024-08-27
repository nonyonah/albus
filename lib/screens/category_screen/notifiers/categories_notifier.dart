import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/categories_model.dart';
import '../models/suggested_item.dart';
import 'categories_state.dart';

final categoriesNotifier =
    StateNotifierProvider<CategoriesNotifier, CategoriesState>(
  (ref) => CategoriesNotifier(
    CategoriesState(
      categoriesModelObj: CategoriesModel(
        suggestedItemList: List.generate(10, (index) => SuggestedItemModel()),
        suggestedItemList2: List.generate(10, (index) => Suggested2ItemModel()),
        suggestedItemList3: List.generate(10, (index) => Suggested3ItemModel()),
        suggestedItemList4: List.generate(10, (index) => Suggested4ItemModel()),
        suggestedItemList5: List.generate(10, (index) => Suggested5ItemModel()),
        suggestedItemList6: List.generate(10, (index) => Suggested6ItemModel()),
        suggestedItemList7: List.generate(10, (index) => Suggested7ItemModel()),
      ),
    ),
  ),
);

class CategoriesNotifier extends StateNotifier<CategoriesState> {
  CategoriesNotifier(CategoriesState state) : super(state);

  void onSelectedChipView(
    int index,
    bool value,
  ) {
    List<SuggestedItemModel> newList = List<SuggestedItemModel>.from(
        state.categoriesModelObj!.suggestedItemList);
    newList[index] = newList[index].copyWith(isSelected: value);
    state = state.copyWith(
        categoriesModelObj:
            state.categoriesModelObj?.copyWith(suggestedItemList: newList));
  }

  void onSelectedChipView2(
    int index,
    bool value,
  ) {
    List<Suggested2ItemModel> newList2 = List<Suggested2ItemModel>.from(
        state.categoriesModelObj!.suggestedItemList2);
    newList2[index] = newList2[index].copyWith(isSelected: value);
    state = state.copyWith(
        categoriesModelObj:
            state.categoriesModelObj?.copyWith(suggestedItemList2: newList2));
  }

  void onSelectedChipView3(
    int index,
    bool value,
  ) {
    List<Suggested3ItemModel> newList3 = List<Suggested3ItemModel>.from(
        state.categoriesModelObj!.suggestedItemList3);
    newList3[index] = newList3[index].copyWith(isSelected: value);
    state = state.copyWith(
        categoriesModelObj:
            state.categoriesModelObj?.copyWith(suggestedItemList3: newList3));
  }

  void onSelectedChipView4(
    int index,
    bool value,
  ) {
    List<Suggested4ItemModel> newList4 = List<Suggested4ItemModel>.from(
        state.categoriesModelObj!.suggestedItemList4);
    newList4[index] = newList4[index].copyWith(isSelected: value);
    state = state.copyWith(
        categoriesModelObj:
            state.categoriesModelObj?.copyWith(suggestedItemList4: newList4));
  }

  void onSelectedChipView5(
    int index,
    bool value,
  ) {
    List<Suggested5ItemModel> newList5 = List<Suggested5ItemModel>.from(
        state.categoriesModelObj!.suggestedItemList5);
    newList5[index] = newList5[index].copyWith(isSelected: value);
    state = state.copyWith(
        categoriesModelObj:
            state.categoriesModelObj?.copyWith(suggestedItemList5: newList5));
  }

  void onSelectedChipView6(
    int index,
    bool value,
  ) {
    List<Suggested6ItemModel> newList6 = List<Suggested6ItemModel>.from(
        state.categoriesModelObj!.suggestedItemList6);
    newList6[index] = newList6[index].copyWith(isSelected: value);
    state = state.copyWith(
        categoriesModelObj:
            state.categoriesModelObj?.copyWith(suggestedItemList6: newList6));
  }

  void onSelectedChipView7(
    int index,
    bool value,
  ) {
    List<Suggested7ItemModel> newList7 = List<Suggested7ItemModel>.from(
        state.categoriesModelObj!.suggestedItemList7);
    newList7[index] = newList7[index].copyWith(isSelected: value);
    state = state.copyWith(
        categoriesModelObj:
            state.categoriesModelObj?.copyWith(suggestedItemList7: newList7));
  }
}
