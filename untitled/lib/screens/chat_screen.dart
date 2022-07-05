import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';
import 'package:untitled/app_theme.dart';
import 'package:untitled/models/models.dart';
import 'package:untitled/theme.dart';
import 'package:untitled/widgets/widgets.dart';

class ChateScreen extends StatelessWidget {
  static Route route(MessageData data) => MaterialPageRoute(
        builder: (context) => ChateScreen(
          messageData: data,
        ),
      );

  const ChateScreen({
    Key? key,
    required this.messageData,
  }) : super(key: key);

  final MessageData messageData;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: ExactAssetImage('assets/images/image1.jpg'),
          opacity: 0.9,
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        //extendBodyBehindAppBar: true,
        backgroundColor: Colors
            .transparent, // Make AppBar transparent and show background image which is set to whole screen <====
        // app bar
        appBar: AppBar(
          backgroundColor: Theme.of(context).backgroundColor.withOpacity(0),
          iconTheme: Theme.of(context).iconTheme,
          centerTitle: false,
          title: AppBarTitle(messageData: messageData),
          leading: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: IconBackground(
                icon: CupertinoIcons.back,
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Center(
                child: IconBackground(
                    icon: Icons.more_vert,
                    onTap: () {
                      print('Check More.');
                    }),
              ),
            ),
          ],
        ),

        // body
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 200),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor.withOpacity(0), // 首页列表背景色 <=========
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
                child: Column(
                  children: const [
                    Expanded(
                      child: _DemoMessageList(),
                    ),
                    _ActionBar(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/*Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: ExactAssetImage('assets/images/image0.png'),
            opacity: 0.9,
            fit: BoxFit.cover,
          ),
        ),) */

class _DemoMessageList extends StatelessWidget {
  const _DemoMessageList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        _DataLabel(label: 'Yesterday'),
        _MessageOwnTile(message: 'You know how it goes????'),
        _MessageTile(message: 'Hi, Anna! How\'s your day going? '),
        _MessageOwnTile(message: 'Hi, Anna! How\'s your day going? '),
        _MessageTile(message: 'Hi, Anna! How\'s your day going?'),
        _MessageOwnTile(message: 'You know how it goes????'),
        _MessageTile(message: 'Hi, Anna! How\'s your day going?'),
        _MessageOwnTile(message: 'You know how it goes????'),
        _MessageTile(message: 'Hi, Anna! How\'s your day going?'),
        _MessageOwnTile(message: 'You know how it goes????'),
        _MessageTile(message: 'Hi, Anna! How\'s your day going? '),
      ],
    );
  }
}

class _DataLabel extends StatelessWidget {
  const _DataLabel({
    Key? key,
    required this.label,
  }) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor.withOpacity(0.8),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12),
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: AppColors.textFaded,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _MessageOwnTile extends StatelessWidget {
  const _MessageOwnTile({
    Key? key,
    required this.message,
  }) : super(key: key);

  final String message;

  static const _borderRadius = 18.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8, right: 8),
      child: Align(
        alignment: Alignment.centerRight,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.only(
                  top: 10, bottom: 12, left: 12, right: 12),
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.6),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor.withOpacity(0.9),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(_borderRadius),
                  topRight: Radius.circular(_borderRadius),
                  bottomRight: Radius.circular(6),
                  bottomLeft: Radius.circular(_borderRadius),
                ),
              ),
              child: Text(
                message,
                style: MyTheme.bodyTextMessage,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MessageTile extends StatelessWidget {
  const _MessageTile({
    Key? key,
    required this.message,
  }) : super(key: key);

  final String message;

  static const _borderRadius = 18.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8, left: 8),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              //margin: EdgeInsets.only(top: 8),
              padding: const EdgeInsets.only(
                  top: 10, bottom: 12, left: 12, right: 12),
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.6),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(6),
                  topRight: Radius.circular(_borderRadius),
                  bottomRight: Radius.circular(_borderRadius),
                  bottomLeft: Radius.circular(_borderRadius),
                ),
              ),
              child: Text(
                message,
                style: MyTheme.bodyTextMessage,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _ActionBar extends StatelessWidget {
  const _ActionBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: false,
      child: Container(
        padding:
            const EdgeInsets.only(top: 10, bottom: 20, left: 10, right: 10),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(18),
            topRight: Radius.circular(18),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              //使用expanded将输入框的长度延伸到全屏幕的宽度
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: 40,
                margin: const EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.emoji_emotions_outlined,
                      color: Colors.grey[500],
                    ),
                    const SizedBox(width: 10),
                    const Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 5),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            //hintText: 'Type your message here ...',
                            //hintStyle: TextStyle(color: Colors.grey[500], fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Icon(
                      Icons.attach_file,
                      color: Colors.grey[500],
                    ),
                  ],
                ),
              ),
            ),
            CircleAvatar(
              backgroundColor: Theme.of(context).cardColor,
              child: const Padding(
                padding: EdgeInsets.only(left: 2, bottom: 2),
                child: Icon(
                  CupertinoIcons.viewfinder,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
