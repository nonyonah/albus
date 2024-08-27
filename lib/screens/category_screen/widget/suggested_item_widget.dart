import 'package:flutter/material.dart';
import '../../../core/utils/size_utils.dart';
import '../../../themes/theme_helper.dart';
import '../suggested_item.dart';

class SuggestedItemWidget extends StatelessWidget {
  final SuggestedItem suggestedItem;
  final Function(bool)? onSelectedChipView;

  const SuggestedItemWidget(this.suggestedItem,
      {Key? key, this.onSelectedChipView})
      : super(key: key);

  static const Map<String, String> categoryEmojis = {
    'Groceries': '🛒',
    'Restaurants': '🍔',
    'Repairs': '🔧',
    'Subscriptions': '💳',
    'Transportation': '🚌',
    'Clothing': '👗',
    'Electricity': '💡',
  };

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      padding: EdgeInsets.only(
        top: 8.h,
        right: 14.h,
        bottom: 8.h,
        left: 14.h,
      ),
      showCheckmark: false,
      labelPadding: EdgeInsets.zero,
      label: Text(
        suggestedItem.name,
        style: TextStyle(
          color: appTheme.black900,
          fontSize: 14.fSize,
          fontFamily: 'Inter Tight',
          fontWeight: FontWeight.w700,
        ),
      ),
      avatar: Text(categoryEmojis[suggestedItem.name] ?? '❓'),
      selected: suggestedItem.isSelected,
      backgroundColor: suggestedItem.isSelected
          ? theme.colorScheme.primary
          : theme.colorScheme.onPrimary,
      selectedColor: theme.colorScheme.primary,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: appTheme.black900.withOpacity(0.5),
          width: 0.5.h,
        ),
        borderRadius: BorderRadius.circular(50.h),
      ),
      onSelected: (bool selected) {
        onSelectedChipView?.call(selected);
      },
    );
  }
}
