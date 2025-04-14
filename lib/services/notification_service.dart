import 'package:university_event_management_system/models/notification_model.dart';
class NotificationService {
  
  static final NotificationService _instance = NotificationService._internal();

  factory NotificationService() {
    return _instance;
  }

  NotificationService._internal();

  
  final List<NotificationModel> _notifications = [];

 
  List<NotificationModel> get notifications => _notifications;

  
  void addNotification(NotificationModel notification) {
    _notifications.insert(0, notification);
  }

  
  void clearNotifications() {
    _notifications.clear();
  }
}
