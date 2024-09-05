import 'package:equatable/equatable.dart';
import '../models/suggestion_model.dart';

class SuggestionState extends Equatable {
  const SuggestionState({
    this.suggestionModelObj,
    this.selectedCategories = const [],
  });

  final SuggestionModel? suggestionModelObj;
  final List<String> selectedCategories;

  @override
  List<Object?> get props => [suggestionModelObj, selectedCategories];

  SuggestionState copyWith({
    SuggestionModel? suggestionModelObj,
    List<String>? selectedCategories,
  }) {
    return SuggestionState(
      suggestionModelObj: suggestionModelObj ?? this.suggestionModelObj,
      selectedCategories: selectedCategories ?? this.selectedCategories,
    );
  }
}