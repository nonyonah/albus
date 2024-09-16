import 'package:equatable/equatable.dart';

class AllocationModel extends Equatable {
  AllocationModel({this.allocationList = const []});

  List<AllocationListModel> allocationList;

  AllocationModel copyWith({List<AllocationListModel>? allocationList}) {
    return AllocationModel(
        allocationList: allocationList ?? this.allocationList);
  }

  @override
  List<Object> get props => [allocationList];
}
