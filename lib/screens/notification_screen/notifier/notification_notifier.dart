import 'package:albus/screens/notification_screen/models/notification_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'notification_state.dart';

final notificationNotifier =
    StateNotifierProvider<NotificationNotifier, NotificationState>(
  (ref) => NotificationNotifier(
    NotificationState(
      notificationModelObj: NotificationModel(),
    ),
  ),
);

class NotificationNotifier extends StateNotifier<NotificationState> {
  NotificationNotifier(NotificationState state) : super(state);
}