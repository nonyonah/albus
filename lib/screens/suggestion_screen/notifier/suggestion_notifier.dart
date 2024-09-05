import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/button_list_item.dart';
import '../models/suggestion_model.dart';
import 'suggestion_state.dart';

final suggestionNotifier =
    StateNotifierProvider<SuggestionNotifier, SuggestionState>(
  (ref) => SuggestionNotifier(
    SuggestionState(
      suggestionModelObj: SuggestionModel(
        buttonListItem: [
          ButtonListItemModel(
              emoji: '🛒',
              name: 'Groceries',
              frequency: 'Weekly',
              price: "\$50"),
          ButtonListItemModel(
            emoji: '🍔',
            name: 'Restaurants',
            frequency: 'Weekly',
            price: "\$20",
          ),
          ButtonListItemModel(
            emoji: '🔧',
            name: 'Repairs',
            frequency: 'Weekly',
            price: "\$10",
          ),
          ButtonListItemModel(
            emoji: '💳',
            name: 'Subscriptions',
            frequency: 'Weekly',
            price: "\$5",
          ),
          // ButtonListItemModel(
          //   emoji: '🚌',
          //   name: 'Transportation',
          //   frequency: 'Weekly',
          //   price: "\$5",
          // ),
          // ButtonListItemModel(
          //   emoji: '👗',
          //   name: 'Clothing',
          //   frequency: 'Weekly',
          //   price: "\$5",
          // ),
          // ButtonListItemModel(
          //   emoji: '💡',
          //   name: 'Electricity',
          //   frequency: 'Weekly',
          //   price: "\$5",
          // ),
        ],
      ),
    ),
  ),
);

class SuggestionNotifier extends StateNotifier<SuggestionState> {
  SuggestionNotifier(super.state);

  void updateCategory(ButtonListItemModel updatedCategory) {
    final updatedButtonListItem =
        state.suggestionModelObj!.buttonListItem.map((category) {
      if (category.name == updatedCategory.name) {
        return updatedCategory;
      }
      return category;
    }).toList();

    state = state.copyWith(
      suggestionModelObj: SuggestionModel(
        buttonListItem: updatedButtonListItem,
      ),
    );
  }

  void updateSelectedCategories(List<String> selectedCategoryNames) {
    state = state.copyWith(
      selectedCategories: selectedCategoryNames,
    );
  }
}
