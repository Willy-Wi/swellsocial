import 'package:flutter/material.dart';
import 'package:android_development/constants/color.dart' as colors;

class NotificationItem extends StatefulWidget {
  const NotificationItem(
      {super.key,
      this.notification = "Willy, Wilson and 3 others liked your post"});

  final String notification;

  @override
  State<NotificationItem> createState() => _NotificationItemState();
}

class _NotificationItemState extends State<NotificationItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.transparent,
            child: Container(
              decoration: const BoxDecoration(
                gradient: colors.purpleGreenGradient,
                shape: BoxShape.circle,
              ),
            ),
          ),
          //
          const SizedBox(
            width: 18,
          ),
          //
          Expanded(
            child: Text(
              widget.notification,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: colors.grey,
              ),
            ),
          ),
          //
          const SizedBox(
            width: 18,
          ),
          //
          Container(
            width: 80,
            height: 55,
            decoration: BoxDecoration(
              gradient: colors.purpleGreenGradient,
              borderRadius: BorderRadius.circular(10.0),
            ),
          )
        ],
      ),
    );
  }
}
