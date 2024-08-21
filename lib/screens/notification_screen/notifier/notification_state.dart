import 'package:equatable/equatable.dart';
import '../models/notification_model.dart';

class NotificationState extends Equatable {
  NotificationState({this.notificationModelObj});

  NotificationModel? notificationModelObj;

  @override
  List<Object?> get props => [notificationModelObj];
  NotificationState copyWith({NotificationModel? notificationModelObj}) {
    return NotificationState(
      notificationModelObj: notificationModelObj ?? this.notificationModelObj,
    );
  }

  
}
