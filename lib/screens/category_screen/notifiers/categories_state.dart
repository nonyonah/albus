import '../models/categories_model.dart';

class CategoriesState {
  final CategoriesModel? categoriesModelObj;
  final List<String> selectedItems; // List to track selected category IDs

  CategoriesState({
    this.categoriesModelObj,
    this.selectedItems = const [], // Initialize with an empty list
  });

  CategoriesState copyWith({
    CategoriesModel? categoriesModelObj,
    List<String>? selectedItems,
  }) {
    return CategoriesState(
      categoriesModelObj: categoriesModelObj ?? this.categoriesModelObj,
      selectedItems: selectedItems ?? this.selectedItems,
    );
  }
}
