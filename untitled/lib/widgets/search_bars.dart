import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme.dart';

class Searcher extends StatelessWidget {
  const Searcher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16), // 搜索框与手机边缘的padding
      child: Card(
        elevation: 0.4,
        shape: RoundedRectangleBorder(
          //side: const BorderSide(color: Colors.blueGrey),
          borderRadius:
              BorderRadius.circular(16.0), //<-- SEE HERE change radius
        ),
        child: Container(
          height: 40,
          padding: const EdgeInsets.only(
            right: 16,
          ), // 搜索框内部图标和文字于border之间的padding
          child: const TextField(
            // 文本框+图标
            decoration: InputDecoration(
              prefixIcon: Icon(
                CupertinoIcons.search,
                size: 24,
              ),
              border: InputBorder.none,
              hintText: 'Search here ...',
              hintStyle: TextStyle(
                fontWeight: FontWeight.w600,
                letterSpacing: 1,
                color: AppColors.textFaded,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
