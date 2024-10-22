// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// class NotificationService {
//   static final FlutterLocalNotificationsPlugin _notificationsPlugin = 
//       FlutterLocalNotificationsPlugin();

//   static void initialize() {
//     final InitializationSettings initializationSettings = 
//       InitializationSettings(
//         android: AndroidInitializationSettings('@mipmap/ic_launcher'), // Icône de l'application
//       );

//     _notificationsPlugin.initialize(initializationSettings);
//   }

//   static Future<void> showNotification({
//     required String title,
//     required String body,
//   }) async {
//     final NotificationDetails notificationDetails = NotificationDetails(
//       android: AndroidNotificationDetails(
//         'default_channel_id',
//         'Default Channel',
//         importance: Importance.max,
//         priority: Priority.high,
//       ),
//     );

//     await _notificationsPlugin.show(
//       0,
//       title,
//       body,
//       notificationDetails,
//     );
//   }
// }
