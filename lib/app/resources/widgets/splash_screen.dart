import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:teangan_film_mobile/app/resources/global/colors.dart';
import 'package:teangan_film_mobile/app/resources/global/images.dart';

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
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 64,
                    height: 64,
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
                          fontSize: 18,
                          color: ColorItem.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
