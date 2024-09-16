import 'package:albus/screens/allocation_screen/models/allocation_list_model.dart';
import 'package:albus/themes/app_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../themes/theme_helper.dart';

class AllocationItemWidget extends ConsumerWidget {
  final int index;
  final AllocationListModel allocation;

  const AllocationItemWidget(
      {Key? super.key, required this.index, required this.allocation});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: AppDecoration.fillBlueGray
          .copyWith(borderRadius: BorderRadiusStyle.roundedBorder12),
      child: Row(
        children: [
          Text(allocation.emoji, style: theme.textTheme.titleSmall),
          Text('\$${allocation.amount.toStringAsFixed(0)}',
              style: theme.textTheme.titleSmall),
          const SizedBox(width: 16),
          DropdownButton<String>(
              value: allocation.timeFrame,
              onChanged: (String? newValue) {
                if (newValue != null) {
                  ref
                      .read(allocationNotifierProvider.notifier)
                      .toggleTimeFrame(index);
                }
              },  
              items: ['Weekly', 'Monthly'].map((String timeFrame) {
                return DropdownMenuItem<String>(
                  value: timeFrame,
                  child: Text(timeFrame),
                );
              }).toList(),)
        ],
      ),
    );
  }
}
