import 'package:equatable/equatable.dart';

import 'button_list_item.dart';

class SuggestionModel extends Equatable {
  SuggestionModel({this.buttonListItem = const []});

  List<ButtonListItemModel> buttonListItem;

  SuggestionModel copyWith({List<ButtonListItemModel>? buttonListItem}) {
    return SuggestionModel(
      buttonListItem: buttonListItem ?? this.buttonListItem,
    );
  }

  @override
  List<Object?> get props => [buttonListItem];
}
