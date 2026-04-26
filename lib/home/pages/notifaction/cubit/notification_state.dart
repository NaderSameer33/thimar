import 'package:thimar/home/pages/notifaction/model/notification_model.dart';

class NotificationState {}

class NotificationLoadingState extends NotificationState {}

class NotificationSuccessState extends NotificationState {
  final NotificationsData data;
  NotificationSuccessState({required this.data});
}

class NotificationFailureState extends NotificationState {
  final String errorMessage;
  NotificationFailureState({required this.errorMessage});
}

// Action States for feedback
class NotificationActionLoading extends NotificationState {}

class NotificationActionSuccess extends NotificationState {
  final String message;
  NotificationActionSuccess({required this.message});
}

class NotificationActionFailure extends NotificationState {
  final String errorMessage;
  NotificationActionFailure({required this.errorMessage});
}
