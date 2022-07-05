import 'package:flutter/material.dart';
import 'package:untitled/app_theme.dart';
import 'package:untitled/models/models.dart';
import 'avatar.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({Key? key, required this.messageData}) : super(key: key);

  final MessageData messageData;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Avatar(
          radius: 16,
          url: messageData.profilePicture,
        ),
        const SizedBox(
          width: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              messageData.senderName,
              overflow: TextOverflow.ellipsis,
              style: MyTheme.senderName.copyWith(fontSize: 14),
            ),
            const SizedBox(height: 2),
            Text(
              'Online now',
              style: MyTheme.textPreview.copyWith(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ],
        )
      ],
    );
  }
}
