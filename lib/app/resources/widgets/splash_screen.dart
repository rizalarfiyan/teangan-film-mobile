import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:teangan_film_mobile/app/resources/global/colors.dart';
import 'package:teangan_film_mobile/app/resources/global/images.dart';
import 'package:teangan_film_mobile/app/resources/global/loading.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Container(
            color: ColorItem.red,
            child: SizedBox(
              width: Get.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: Get.height * 2 / 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 82,
                          height: 82,
                          child: SvgPicture.asset(
                            Images.logo,
                            color: ColorItem.white,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          child: RichText(
                            text: TextSpan(
                              text: 'Teangan Film',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: ColorItem.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const StaggeredDotsWave(
                    color: Colors.white,
                    size: 36,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
