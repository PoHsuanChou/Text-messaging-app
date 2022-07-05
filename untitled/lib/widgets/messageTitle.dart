import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/app_theme.dart';
import 'package:untitled/models/models.dart';
import 'package:untitled/screens/screens.dart';
import 'package:untitled/theme.dart';
import 'package:untitled/widgets/widgets.dart';



class MessageTitle extends StatelessWidget {
  const MessageTitle({
    Key? key,
    required this.messageData,
  }) : super(key: key);

  final MessageData messageData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(ChateScreen.route(messageData));
      },
      child: Container(
        // message bar height
        height: 100,
        margin: const EdgeInsets.symmetric(horizontal: 8),

        // bottom grey line
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey,
              width: 0.2,
            ),
          ),
        ),
        

        // message bar elements in row (avatar, user-name, latest text, unread counter, receiving time)
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            children: [
              // avatar
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 10, bottom: 10),
                child: Avatar.medium(url: messageData.profilePicture),
              ),

              // User name + message
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        messageData.senderName,
                        overflow: TextOverflow
                            .ellipsis, // overflow text will be ellipsis in the end ....
                        style: MyTheme.senderName,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                      child: Text(
                        messageData.message,
                        overflow: TextOverflow.ellipsis,
                        style: MyTheme.textPreview,
                      ),
                    ),
                  ],
                ),
              ),

              // most-left items (unread counter, receiving time)
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(height: 4),
                    Container(
                      width: 18,
                      height: 18,
                      decoration: const BoxDecoration(
                        color: AppColors.secondary,
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Text(
                          '1',
                          style: TextStyle(
                            fontSize: 10,
                            color: AppColors.textLight,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      messageData.dateMessage.toUpperCase(),
                      style: MyTheme.textTime,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}