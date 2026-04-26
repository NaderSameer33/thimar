class NotificationsData {
  late final int unreadCount;
  late final List<NotificationModel> notifications;

  NotificationsData.fromJson(Map<String, dynamic> json) {
    unreadCount = json['unread_count'] ?? 0;
    
    // Support different API response structures for 'data'
    if (json['data'] is Map && json['data']['notifications'] != null) {
      notifications = List.from(json['data']['notifications'])
          .map((e) => NotificationModel.fromJson(e))
          .toList();
    } else if (json['data'] is List) {
      notifications = List.from(json['data'])
          .map((e) => NotificationModel.fromJson(e))
          .toList();
    } else {
      notifications = [];
    }
  }
}

class NotificationModel {
  late final String id, title, body, createdAt, image;

  NotificationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    title = json['title'] ?? '';
    body = json['body'] ?? '';
    createdAt = json['created_at'] ?? '';
    image = json['image'] ?? '';
  }
}
