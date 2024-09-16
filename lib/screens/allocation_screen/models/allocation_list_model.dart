import 'package:equatable/equatable.dart';

class AllocationListModel extends Equatable {
  final String name;
  final String emoji;
  final double amount;
  final String timeFrame;

  AllocationListModel({
    required this.name,
    required this.emoji,
    required this.amount,
    required this.timeFrame,
  });

  AllocationListModel copyWith({
    String? name,
    String? icon,
    double? amount,
    String? timeFrame,
  }) {
    return AllocationListModel(
      name: name ?? this.name,
      emoji: icon ?? this.emoji,
      amount: amount ?? this.amount,
      timeFrame: timeFrame ?? this.timeFrame,
    );
  }

  @override
  List<Object> get props => [name, emoji, amount, timeFrame];
}