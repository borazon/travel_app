import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:google_fonts/google_fonts.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travel_app/models/beach_model.dart';
import 'package:travel_app/models/popular_model.dart';
import 'package:travel_app/models/recommended_model.dart';
import 'package:travel_app/screens/selected_place_screen.dart';
import 'package:travel_app/widgets/bottom_navigation_bar.dart';
import 'package:travel_app/widgets/custom_tab_indicator.dart';
// import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Page controller
  final _pageController = PageController(viewportFraction: 0.877);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavigationBarTravel(),
      body: SafeArea(
        // ignore: avoid_unnecessary_containers
        child: Container(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: <Widget>[
              // Custom Navigation Drawer and Search Button
              Container(
                height: 40,
                margin:
                    const EdgeInsets.only(top: 18.8, left: 18.8, right: 18.8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      height: 40,
                      width: 40,
                      // ignore: prefer_const_constructors
                      padding: EdgeInsets.all(9),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9.6),
                        // ignore: prefer_const_constructors
                        color: Color(0x080a0928),
                      ),
                      child: SvgPicture.asset('assets/svg/icon_drawer.svg'),
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      // ignore: prefer_const_constructors
                      padding: EdgeInsets.all(9),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9.6),
                        // ignore: prefer_const_constructors
                        color: Color(0x080a0928),
                      ),
                      child: SvgPicture.asset('assets/svg/icon_search.svg'),
                    ),
                  ],
                ),
              ),
              //  Text Widget for Title
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 28.8),
                child: Text(
                  'Explore\nthe Nature',
                  style: GoogleFonts.playfairDisplay(
                      fontSize: 25, fontWeight: FontWeight.w700),
                ),
              ),
              // Custom Tab Bar with Custom Indicator
              Container(
                height: 30,
                margin: const EdgeInsets.only(left: 14.4, top: 28.8),
                child: DefaultTabController(
                  length: 4,
                  child: TabBar(
                    labelPadding:
                        const EdgeInsets.only(left: 14.4, right: 14.4),
                    indicatorPadding:
                        const EdgeInsets.only(left: 14.4, right: 14.4),
                    isScrollable: true,
                    labelColor: const Color(0xFF000000),
                    unselectedLabelColor: const Color(0xFF8a8a8a),
                    labelStyle: GoogleFonts.lato(
                        fontSize: 14, fontWeight: FontWeight.w700),
                    unselectedLabelStyle: GoogleFonts.lato(
                        fontSize: 14, fontWeight: FontWeight.w700),
                    // membuat incdicator(belom fix)
                    indicator: RoundedRectangleTabIndicator(
                        color: const Color(0xFF000000),
                        weight: 2.4,
                        width: 14.4),
                    tabs: [
                      Tab(
                        // ignore: avoid_unnecessary_containers
                        child: Container(
                          child: const Text('Recommended'),
                        ),
                      ),
                      Tab(
                        // ignore: avoid_unnecessary_containers
                        child: Container(
                          child: const Text('Popular'),
                        ),
                      ),
                      Tab(
                        // ignore: avoid_unnecessary_containers
                        child: Container(
                          child: const Text('New Destination'),
                        ),
                      ),
                      Tab(
                        // ignore: avoid_unnecessary_containers
                        child: Container(
                          child: const Text('Hiddem Gems'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Listview widget with page view
              // Recommendations section
              Container(
                height: 218.4,
                margin: const EdgeInsets.only(top: 16),
                child: PageView(
                  physics: const BouncingScrollPhysics(),
                  controller: _pageController,
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                    recommendations.length,
                    (int index) => GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SelectedPlaceScreen(
                                recommendedModel: recommendations[index])));
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 28.8),
                        width: 230,
                        height: 115,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9.6),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: CachedNetworkImageProvider(
                                recommendations[index].image.toString()),
                          ),
                        ),
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                                bottom: 19.2,
                                left: 19.2,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(4.8),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                        sigmaY: 19.2, sigmaX: 19.2),
                                    child: Container(
                                      height: 36,
                                      padding: const EdgeInsets.only(
                                          left: 16.72, right: 14.4),
                                      alignment: Alignment.centerLeft,
                                      child: Row(
                                        children: <Widget>[
                                          SvgPicture.asset(
                                              'assets/svg/icon_location.svg'),
                                          const SizedBox(
                                            width: 9.52,
                                          ),
                                          Text(
                                            recommendations[index]
                                                .name
                                                .toString(),
                                            style: GoogleFonts.lato(
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white,
                                              fontSize: 14,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // Dots indicator
              // Using smoothPageIndicator Library
              Padding(
                padding: const EdgeInsets.only(left: 28.8, top: 28.8),
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: recommendations.length,
                  effect: const ExpandingDotsEffect(
                    activeDotColor: Color(0xFF8a8a8a),
                    dotColor: Color(0xFFababab),
                    dotHeight: 4.8,
                    dotWidth: 6,
                    spacing: 4.8,
                  ),
                ),
              ),

              // Text widget for popular categories
              Padding(
                padding:
                    const EdgeInsets.only(top: 48, left: 28.8, right: 28.8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Popular Categories',
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF000000),
                      ),
                    ),
                    Text(
                      'Show All',
                      style: GoogleFonts.lato(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF8a8a8a),
                      ),
                    ),
                  ],
                ),
              ),
              // Listview for Popular Categories Section
              Container(
                margin: const EdgeInsets.only(top: 33.6),
                height: 45.6,
                child: ListView.builder(
                  itemCount: populars.length,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.only(left: 28.8, right: 9.6),
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 19.2),
                      height: 45.6,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9.6),
                        color: Color(populars[index].color),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const SizedBox(
                            width: 19.2,
                          ),
                          Image.asset(
                            populars[index].image.toString(),
                            height: 16.8,
                          ),
                          const SizedBox(
                            width: 19.2,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              // ListView for Beach Section
              Container(
                margin: const EdgeInsets.only(top: 28.8, bottom: 16.8),
                height: 124.8,
                child: ListView.builder(
                  itemCount: beaches.length,
                  padding: const EdgeInsets.only(left: 28.8, right: 12),
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      height: 124.8,
                      width: 188.4,
                      margin: const EdgeInsets.only(right: 16.8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9.6),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: CachedNetworkImageProvider(
                            beaches[index].image.toString(),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
