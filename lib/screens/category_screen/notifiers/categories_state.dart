import 'package:equatable/equatable.dart';

import '../models/categories_model.dart';

class CategoriesState extends Equatable {
  CategoriesState({this.categoriesModelObj});

  CategoriesModel? categoriesModelObj;

  @override
  List<Object?> get props => [categoriesModelObj];
  CategoriesState copyWith({CategoriesModel? categoriesModelObj}) {
    return CategoriesState(
      categoriesModelObj: categoriesModelObj ?? this.categoriesModelObj,
    );
  }
}
