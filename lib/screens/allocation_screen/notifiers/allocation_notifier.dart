// Provider for selected categories
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/allocation_list_model.dart';
import '../models/allocation_model.dart';

final selectedCategoriesProvider = StateProvider<List<String>>((ref) => []);

// Provider for input amount
final inputAmountProvider = StateProvider<double>((ref) => 0.0);

// Provider for AI-generated allocations
final allocationProvider = FutureProvider<AllocationModel>((ref) async {
  final categories = ref.watch(selectedCategoriesProvider);
  final amount = ref.watch(inputAmountProvider);
  
  // Simulate AI allocation (replace this with actual AI call)
  await Future.delayed(Duration(seconds: 2)); // Simulating API call
  return AllocationModel(allocationList: [
    AllocationListModel(name: 'Groceries', emoji: '🛒', amount: amount * 0.3, timeFrame: 'Weekly'),
    AllocationListModel(name: 'Utilities', emoji: '💡', amount: amount * 0.2, timeFrame: 'Monthly'),
    AllocationListModel(name: 'Entertainment', emoji: '🎭', amount: amount * 0.1, timeFrame: 'Weekly'),
    // Add more allocations based on selected categories
  ]);
});

class AllocationNotifier extends StateNotifier<AllocationModel> {
  AllocationNotifier() : super(AllocationModel());

  void setAllocation(AllocationModel allocations) {
    state = allocations;
  }

  void toggleTimeFrame(int index) {
    final updatedList = state.allocationList.asMap().map((i, allocation) {
      if (i == index) {
        return MapEntry(i, allocation.copyWith(
          timeFrame: allocation.timeFrame == 'Weekly' ? 'Monthly' : 'Weekly'
        ));
      }
      return MapEntry(i, allocation);
    }).values.toList();

    state = state.copyWith(allocationList: updatedList);
  }
}

final allocationsNotifierProvider = StateNotifierProvider<AllocationNotifier, AllocationModel>((ref) {
  return AllocationNotifier();
});