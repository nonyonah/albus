import 'package:albus/screens/allocation_screen/models/allocation_model.dart';
import 'package:equatable/equatable.dart';

class AllocationState extends Equatable {
  AllocationState({this.allocationModelObj});

  AllocationModel? allocationModelObj;

  @override
  List<Object?> get props => [allocationModelObj];
  AllocationState copyWith({AllocationModel? allocationModelObj}) {
    return AllocationState(
      allocationModelObj: allocationModelObj ?? this.allocationModelObj,
    );
  }
}
