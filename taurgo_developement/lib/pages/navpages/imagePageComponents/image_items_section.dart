import 'package:flutter/material.dart';
import 'package:taurgo_developement/costants/AppColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImaegItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 24.0, 40.0, 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                  labelPadding: const EdgeInsets.only(left: 20, right: 20),
                  labelColor: kPrimaryColor,
                  unselectedLabelColor: kPrimaryColor.withOpacity(0.3),
                  isScrollable: true,
                  // indicator: CircleTabIndicator(color: kPrimaryColor, radius: 4),
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: [
                    Tab(
                      text: "Trending",
                    ),
                    Tab(
                      text: "Love",
                    ),
                    Tab(
                      text: "Art",
                    )
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
