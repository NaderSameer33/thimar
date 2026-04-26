import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar/core/logic/dio_helper.dart';
import 'package:thimar/home/pages/notifaction/model/notification_model.dart';
import 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationLoadingState());

  NotificationsData? _cachedData;

  Future<void> getNotifications() async {
    emit(NotificationLoadingState());
    
    final response = await DioHelper.getData(
      endPoint: 'notifications',
    );

    if (isClosed) return;

    if (response.isSucces) {
      _cachedData = NotificationsData.fromJson(response.data);
      emit(NotificationSuccessState(data: _cachedData!));
    } else {
      emit(NotificationFailureState(errorMessage: response.exception ?? 'حدث خطأ ما'));
    }
  }

  Future<void> deleteNotification(String id) async {
    // Keep local cache to revert if failed
    final previousData = _cachedData;
    
    // Optimistic UI update
    if (_cachedData != null) {
      _cachedData!.notifications.removeWhere((element) => element.id == id);
      emit(NotificationSuccessState(data: _cachedData!));
    }
    
    emit(NotificationActionLoading());

    final response = await DioHelper.deleteData(
      endPoint: 'notifications/$id',
    );

    if (isClosed) return;

    if (response.isSucces) {
      emit(NotificationActionSuccess(message: response.succesMessage ?? 'تم حذف الإشعار'));
      if (_cachedData != null) {
        emit(NotificationSuccessState(data: _cachedData!));
      } else {
        getNotifications();
      }
    } else {
      emit(NotificationActionFailure(errorMessage: response.exception ?? 'فشل الحذف'));
      // Revert on failure
      if (previousData != null) {
        _cachedData = previousData;
        emit(NotificationSuccessState(data: _cachedData!));
      }
    }
  }

  Future<void> clearAllNotifications() async {
    emit(NotificationActionLoading());

    final response = await DioHelper.deleteData(
      endPoint: 'notifications/clear_all_notifications',
    );

    if (isClosed) return;

    if (response.isSucces) {
      emit(NotificationActionSuccess(message: response.succesMessage ?? 'تم مسح جميع الإشعارات'));
      if (_cachedData != null) {
        _cachedData!.notifications.clear();
        emit(NotificationSuccessState(data: _cachedData!));
      } else {
        getNotifications();
      }
    } else {
      emit(NotificationActionFailure(errorMessage: response.exception ?? 'فشل مسح الإشعارات'));
      if (_cachedData != null) {
        emit(NotificationSuccessState(data: _cachedData!));
      }
    }
  }
}
