import 'package:android_development/notification/widgets/notification_item.dart';
import 'package:flutter/material.dart';
import 'package:android_development/constants/color.dart' as colors;
import '../../widgets/back_button.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = const TextStyle(
      color: colors.grey,
      fontSize: 16,
      fontWeight: FontWeight.w600,
    );

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(25),
              child: Back(label: 'Notifications'),
            ),
            Expanded(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(25)),
                  boxShadow: colors.boxShadow,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 25.0, left: 25.0, bottom: 15.0, right: 15.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        //
                        Text(
                          'Today',
                          style: textStyle,
                        ),
                        //
                        const SizedBox(
                          height: 20,
                        ),
                        //
                        ListView.builder(
                            itemCount: 2,
                            shrinkWrap: true,
                            primary: false,
                            itemBuilder: (context, index) {
                              return const NotificationItem();
                            }),
                        //
                        Text(
                          'This Week',
                          style: textStyle,
                        ),
                        //
                        const SizedBox(
                          height: 20,
                        ),
                        //
                        ListView.builder(
                            itemCount: 3,
                            shrinkWrap: true,
                            primary: false,
                            itemBuilder: (context, index) {
                              return const NotificationItem();
                            }),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
