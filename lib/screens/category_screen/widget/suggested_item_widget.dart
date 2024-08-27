import 'package:albus/core/utils/size_utils.dart';
import 'package:albus/screens/category_screen/models/suggested_item.dart';
import 'package:flutter/material.dart';
import '../../../themes/theme_helper.dart';

// Base Widget to avoid repetition
class BaseSuggestedItemWidget extends StatelessWidget {
  final String skillcard;
  final bool isSelected;
  final Function(bool)? onSelectedChipView;
  final String avatarEmoji;

  const BaseSuggestedItemWidget({
    required this.skillcard,
    required this.isSelected,
    this.onSelectedChipView,
    required this.avatarEmoji,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      padding: EdgeInsets.only(
        top: 8.h,
        right: 14.h,
        bottom: 8.h,
      ),
      showCheckmark: false,
      labelPadding: EdgeInsets.zero,
      label: Text(
        skillcard,
        style: TextStyle(
          color: appTheme.black900,
          fontSize: 14.fSize,
          fontFamily: 'Inter Tight',
          fontWeight: FontWeight.w700,
        ),
      ),
      avatar: Text(avatarEmoji),
      selected: isSelected,
      backgroundColor:
          isSelected ? theme.colorScheme.primary : theme.colorScheme.onPrimary,
      selectedColor: theme.colorScheme.primary,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: appTheme.black900.withOpacity(0.5),
          width: 0.5.h,
        ),
        borderRadius: BorderRadius.circular(50.h),
      ),
      onSelected: onSelectedChipView,
    );
  }
}

// Widgets for each SuggestedItemModel with different emojis
class SuggestedItemWidget extends StatelessWidget {
  final SuggestedItemModel suggestedItemModelObj;
  final Function(bool)? onSelectedChipView;

  const SuggestedItemWidget(this.suggestedItemModelObj,
      {Key? key, this.onSelectedChipView})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseSuggestedItemWidget(
      skillcard: suggestedItemModelObj.skillcard!,
      isSelected: suggestedItemModelObj.isSelected ?? false,
      onSelectedChipView: onSelectedChipView,
      avatarEmoji: '🛒', // Emoji for SuggestedItemModel (Groceries)
    );
  }
}

class Suggested2ItemWidget extends StatelessWidget {
  final Suggested2ItemModel suggestedItemModelObj;
  final Function(bool)? onSelectedChipView;

  const Suggested2ItemWidget(this.suggestedItemModelObj,
      {Key? key, this.onSelectedChipView})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseSuggestedItemWidget(
      skillcard: suggestedItemModelObj.skillcard!,
      isSelected: suggestedItemModelObj.isSelected ?? false,
      onSelectedChipView: onSelectedChipView,
      avatarEmoji: '🍔', // Emoji for Suggested2ItemModel (Restaurants)
    );
  }
}

class Suggested3ItemWidget extends StatelessWidget {
  final Suggested3ItemModel suggestedItemModelObj;
  final Function(bool)? onSelectedChipView;

  const Suggested3ItemWidget(this.suggestedItemModelObj,
      {Key? key, this.onSelectedChipView})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseSuggestedItemWidget(
      skillcard: suggestedItemModelObj.skillcard!,
      isSelected: suggestedItemModelObj.isSelected ?? false,
      onSelectedChipView: onSelectedChipView,
      avatarEmoji: '🔧', // Emoji for Suggested3ItemModel (Repairs)
    );
  }
}

class Suggested4ItemWidget extends StatelessWidget {
  final Suggested4ItemModel suggestedItemModelObj;
  final Function(bool)? onSelectedChipView;

  const Suggested4ItemWidget(this.suggestedItemModelObj,
      {Key? key, this.onSelectedChipView})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseSuggestedItemWidget(
      skillcard: suggestedItemModelObj.skillcard!,
      isSelected: suggestedItemModelObj.isSelected ?? false,
      onSelectedChipView: onSelectedChipView,
      avatarEmoji: '💳', // Emoji for Suggested4ItemModel (Subscriptions)
    );
  }
}

class Suggested5ItemWidget extends StatelessWidget {
  final Suggested5ItemModel suggestedItemModelObj;
  final Function(bool)? onSelectedChipView;

  const Suggested5ItemWidget(this.suggestedItemModelObj,
      {Key? key, this.onSelectedChipView})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseSuggestedItemWidget(
      skillcard: suggestedItemModelObj.skillcard!,
      isSelected: suggestedItemModelObj.isSelected ?? false,
      onSelectedChipView: onSelectedChipView,
      avatarEmoji: '🚌', // Emoji for Suggested5ItemModel (Transportation)
    );
  }
}

class Suggested6ItemWidget extends StatelessWidget {
  final Suggested6ItemModel suggestedItemModelObj;
  final Function(bool)? onSelectedChipView;

  const Suggested6ItemWidget(this.suggestedItemModelObj,
      {Key? key, this.onSelectedChipView})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseSuggestedItemWidget(
      skillcard: suggestedItemModelObj.skillcard!,
      isSelected: suggestedItemModelObj.isSelected ?? false,
      onSelectedChipView: onSelectedChipView,
      avatarEmoji: '👗', // Emoji for Suggested6ItemModel (Clothing)
    );
  }
}

class Suggested7ItemWidget extends StatelessWidget {
  final Suggested7ItemModel suggestedItemModelObj;
  final Function(bool)? onSelectedChipView;

  const Suggested7ItemWidget(this.suggestedItemModelObj,
      {Key? key, this.onSelectedChipView})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseSuggestedItemWidget(
      skillcard: suggestedItemModelObj.skillcard!,
      isSelected: suggestedItemModelObj.isSelected ?? false,
      onSelectedChipView: onSelectedChipView,
      avatarEmoji: '💡', // Emoji for Suggested7ItemModel (Electricity)
    );
  }
}
