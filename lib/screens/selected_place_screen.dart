import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travel_app/models/recommended_model.dart';
import 'package:flutter_svg/svg.dart';

class SelectedPlaceScreen extends StatelessWidget {
  final _pageController = PageController();
  final RecommendedModel recommendedModel;
  SelectedPlaceScreen({Key? key, required this.recommendedModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: Stack(
          children: <Widget>[
            // PageView for Image
            PageView(
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              children: List.generate(
                recommendedModel.images.length,
                (int index) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: CachedNetworkImageProvider(
                          recommendedModel.images[index]),
                    ),
                  ),
                ),
              ),
            ),
            // Custom Navigation/button
            SafeArea(
              child: Container(
                height: 40,
                margin:
                    // ignore: unnecessary_const
                    const EdgeInsets.only(top: 18.8, left: 18.8, right: 18.8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        // ignore: prefer_const_constructors
                        padding: EdgeInsets.all(9),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9.6),
                          // ignore: prefer_const_constructors
                          color: Color(0x10000000),
                        ),
                        child: SvgPicture.asset('assets/svg/icon_left_arrow.svg'),
                      ),
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
                      child: SvgPicture.asset('assets/svg/icon_heart_fill.svg'),
                    ),
                  ],
                ),
              ),
            ),
            // Content
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                height: 346.8,
                margin:
                    const EdgeInsets.only(left: 28.8, bottom: 48, right: 28.8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SmoothPageIndicator(
                      controller: _pageController,
                      count: recommendedModel.images.length,
                      effect: const ExpandingDotsEffect(
                        activeDotColor: Color(0xFFFFFFFF),
                        dotColor: Color(0xFFababab),
                        dotHeight: 4.8,
                        dotWidth: 6,
                        spacing: 4.8,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text(
                        recommendedModel.tagLine.toString(),
                        maxLines: 2,
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text(
                        recommendedModel.description,
                        maxLines: 3,
                        style: GoogleFonts.lato(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Start from',
                            style: GoogleFonts.lato(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                          Text(
                            '\$ ${recommendedModel.price.toString()}',
                            style: GoogleFonts.lato(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          )
                        ],
                      ),
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 28.8, right: 28.8),
                            child: Text(
                              'Explore Now >>',
                              style: GoogleFonts.lato(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      )
                    ])
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
