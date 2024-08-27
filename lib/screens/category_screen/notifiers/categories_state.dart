import '../models/categories_model.dart';

class CategoriesState {
  final CategoriesModel? categoriesModelObj;

  CategoriesState({this.categoriesModelObj});

  CategoriesState copyWith({CategoriesModel? categoriesModelObj}) {
    return CategoriesState(
      categoriesModelObj: categoriesModelObj ?? this.categoriesModelObj,
    );
  }
}