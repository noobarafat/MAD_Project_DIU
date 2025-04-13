import 'package:flutter/material.dart';
import 'package:university_event_management_system/models/notification_model.dart';

class NotificationScreen extends StatelessWidget {
  
  final List<NotificationModel> notifications = [
    NotificationModel(
      title: 'New Event Added',
      description: 'AUST Job Fair has been added to the events.',
      timestamp: '2025-04-07 10:00 AM',
    ),
    NotificationModel(
      title: 'Event Reminder',
      description: 'DIU UTA Program starts in 2 days.',
      timestamp: '2025-04-05 5:00 PM',
    ),
   
  ];

   NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView.builder(
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