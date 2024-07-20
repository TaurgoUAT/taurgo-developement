import 'package:flutter/material.dart';
import 'package:taurgo_developement/pages/home.dart';
import 'package:taurgo_developement/pages/navpages/accountPageComponents/change_password_button.dart';
import 'package:taurgo_developement/pages/navpages/accountPageComponents/help_support_button.dart';
import 'package:taurgo_developement/pages/navpages/accountPageComponents/profile_section.dart';
import 'package:taurgo_developement/pages/navpages/accountPageComponents/setting_button.dart';
import 'package:taurgo_developement/pages/navpages/accountPageComponents/susbcribtion_section.dart';
import 'package:taurgo_developement/pages/navpages/imagePageComponents/search_bar_section.dart';
import 'package:flutter/cupertino.dart';
import 'package:taurgo_developement/pages/navpages/imagePageComponents/description_section.dart';
import 'package:taurgo_developement/costants/AppColors.dart';

class Imagepage extends StatefulWidget {
  const Imagepage({super.key});

  @override
  State<Imagepage> createState() => _ImagepageState();
}

class _ImagepageState extends State<Imagepage> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<String> allImage = [
    "prop-img.png",
    "prop-img-2.png",
    "prop-img.png",
    "prop-img.png",
    "prop-img-2.png",
    "prop-img.png",
    "prop-img-2.png",
    "prop-img-2.png",
    "prop-img.png",
  ];
  List<String> latestImages = [
    "prop-img-2.png",
    "prop-img.png",
    "prop-img-2.png",
    "prop-img-2.png",
    "prop-img.png",
    "prop-img.png",
    "prop-img.png",
    "prop-img.png",
    "prop-img.png",
  ];
  List<String> deletedImages = [
    "prop-img.png",
    "prop-img-2.png",
    "prop-img.png",
    "prop-img-2.png",
    "prop-img.png",
    "prop-img-2.png",
    "prop-img.png",
    "prop-img-2.png",
    "prop-img.png",
  ];

  Widget buildGridView(List<String> images) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: images.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            // Handle tap on image
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              image: DecorationImage(
                image: AssetImage("assets/images/" + images[index]),
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Images',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            fontFamily: "Inter",
          ),
        ),
        centerTitle: true,
        backgroundColor: bWhite,
        leading: GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Homepage()), // Replace
              // HomePage with your home page widget
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/logo/Taurgo Logo.png'), // Path to your company icon
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none, color: kPrimaryColor),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.help_outline, color: kPrimaryColor),
            onPressed: () {},
          ),
        ],
      ),

      body: Container(
        color: bWhite,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: SearchBarSection()),
            CapturedImage(),
            Container(
              child: Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                  controller: _tabController,
                  labelColor: kPrimaryColor,
                  unselectedLabelColor: kSecondaryBorderColor,
                  indicator: BoxDecoration(),
                  tabs: [
                    Tab(text: "All Images"),
                    Tab(text: "Latest"),
                    Tab(text: "Deleted"),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    buildGridView(allImage),
                    buildGridView(latestImages),
                    buildGridView(deletedImages),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;

  CircleTabIndicator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;

  _CirclePainter({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
      configuration.size!.width / 2 - radius / 2,
      configuration.size!.height,
    );
    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}
