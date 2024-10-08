import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/suggested_impl.dart';
import '../models/categories_model.dart';
import 'categories_state.dart';

final categoriesNotifier =
StateNotifierProvider<CategoriesNotifier, CategoriesState>(
      (ref) => CategoriesNotifier(
    CategoriesState(
      categoriesModelObj: CategoriesModel(
        suggestedItems: [
          SuggestedItemImpl(id: '1', name: 'Groceries'),
          SuggestedItemImpl(id: '2', name: 'Restaurants'),
          SuggestedItemImpl(id: '3', name: 'Repairs'),
          SuggestedItemImpl(id: '4', name: 'Subscriptions'),
          SuggestedItemImpl(id: '5', name: 'Transportation'),
          SuggestedItemImpl(id: '6', name: 'Clothing'),
          SuggestedItemImpl(id: '7', name: 'Electricity'),
        ],
      ),
    ),
  ),
);

class CategoriesNotifier extends StateNotifier<CategoriesState> {
  CategoriesNotifier(super.state);

  void onSelectedChipView(String id, bool value) {
    // Update the selected items based on the value
    final updatedSelectedItems = [...state.selectedItems];
    if (value) {
      updatedSelectedItems.add(id);
    } else {
      updatedSelectedItems.remove(id);
    }

    // Update the suggested items
    final updatedItems = state.categoriesModelObj!.suggestedItems.map((item) {
      if (item.id == id) {
        return item.copyWith(isSelected: value);
      }
      return item;
    }).toList();

    // Update the state
    state = state.copyWith(
      categoriesModelObj: state.categoriesModelObj?.copyWith(
        suggestedItems: updatedItems,
      ),
      selectedItems: updatedSelectedItems,
    );
  }
}
