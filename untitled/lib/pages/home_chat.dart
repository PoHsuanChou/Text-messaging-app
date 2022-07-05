import 'package:faker/faker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:untitled/app_theme.dart';
import 'package:untitled/models/models.dart';
import 'package:untitled/helpers.dart';
import 'package:untitled/screens/screens.dart';
import 'package:untitled/theme.dart';
import 'package:untitled/widgets/widgets.dart';

class HomeChat extends StatelessWidget {
  const HomeChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: const [
                SizedBox(height: 18),
                Searcher(),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(_delegate),
          ),
        ],
      ),
    );
  }

  Widget _delegate(BuildContext context, int index) {
    final Faker faker = Faker();
    final date = Helpers.randomDate();
    return MessageTitle(
      messageData: MessageData(
          senderName: faker.person.name(),
          message: faker.lorem.sentence(),
          messageDate: date,
          dateMessage: Jiffy(date).fromNow(),
          profilePicture: Helpers.randomPictureUrl()),
    );
  }
}
