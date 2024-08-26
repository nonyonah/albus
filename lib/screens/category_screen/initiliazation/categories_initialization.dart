import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/categories_model.dart';
import '../models/suggested_item.dart';
import '../notifiers/categories_notifier.dart';
import '../notifiers/categories_state.dart';

// Define initial categories
final List<SuggestionItemModel> initialSuggestion1List = [
  SuggestionItemModel(name: 'Groceries', emoji: '🛒'),
  SuggestionItemModel(name: 'Eating out', emoji: '🍽️'),
  SuggestionItemModel(name: 'Meal delivery', emoji: '🛵'),
];

final List<Suggestion2ItemModel> initialSuggestion2List = [
  Suggestion2ItemModel(name: 'Fuel', emoji: '⛽'),
  Suggestion2ItemModel(name: 'Repairs', emoji: '🔧'),
  Suggestion2ItemModel(name: 'Public transport', emoji: '🚌'),
];

final List<Suggestion3ItemModel> initialSuggestion3List = [
  Suggestion3ItemModel(name: 'Subscriptions', emoji: '📺'),
  Suggestion3ItemModel(name: 'Hobbies', emoji: '🎨'),
  Suggestion3ItemModel(name: 'Travel', emoji: '✈️'),
  Suggestion3ItemModel(name: 'Events', emoji: '🎭'),
];

// Create initial CategoriesModel
final initialCategoriesModel = CategoriesModel(
  suggestion1ItemList: initialSuggestion1List,
  suggestion2ItemList: initialSuggestion2List,
  suggestion3ItemList: initialSuggestion3List,
);

// Define the categoriesNotifier provider
final categoriesNotifier = StateNotifierProvider<CategoriesNotifier, CategoriesState>(
  (ref) => CategoriesNotifier(
    CategoriesState(
      categoriesModelObj: initialCategoriesModel,
    ),
  ),
);