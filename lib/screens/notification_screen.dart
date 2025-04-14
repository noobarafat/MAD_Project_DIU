import 'package:flutter/material.dart';
import 'package:university_event_management_system/services/notification_service.dart';

class NotificationScreen extends StatelessWidget {
  
  NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    final notifications = NotificationService().notifications;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        backgroundColor: Colors.deepPurple,
      ),
      body: notifications.isEmpty
          ? const Center(child: Text('No notifications yet'))
          : ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final notification = notifications[index];
                return Card(
                  margin: const EdgeInsets.all(8),
                  elevation: 4,
                  child: ListTile(
                    title: Text(notification.title),
                    subtitle: Text(notification.description),
                    trailing: Text(notification.timestamp),
                  ),
                );
              },
            ),
    );
  }
}
