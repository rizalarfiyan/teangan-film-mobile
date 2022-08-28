import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:teangan_film_mobile/app/modules/home/controllers/home_controller.dart';
import 'package:teangan_film_mobile/app/resources/global/clipper.dart';
import 'package:teangan_film_mobile/app/resources/global/colors.dart';
import 'package:teangan_film_mobile/app/resources/global/images.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              width: 24,
              height: 24,
              margin: const EdgeInsets.only(right: 10),
              child: SvgPicture.asset(
                Images.logo,
                color: ColorItem.white,
              ),
            ),
            const Text('Teangan Film'),
          ],
        ),
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(
                  right: 16,
                ),
                width: 36,
                height: 36,
                child: CircleAvatar(
                  radius: 10,
                  backgroundImage: AssetImage(Images.userAvatar),
                ),
              ),
            ],
          )
        ],
        backgroundColor: ColorItem.red,
        elevation: 0,
      ),
      body: Stack(
        children: [
          ClipPath(
            clipper: RoundedClipper(),
            child: Container(
              width: Get.width,
              height: 210,
              color: ColorItem.red,
            ),
          ),
          Column(
            children: [
              Divider(
                thickness: 2,
                height: 2,
                color: ColorItem.red5,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 24,
                ),
                child: Column(
                  children: [
                    Text(
                      "Teangan Film",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: ColorItem.white,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      constraints: const BoxConstraints(
                        maxWidth: 420,
                        minHeight: 40,
                      ),
                      child: Text(
                        "Teangan Film is project for submission of learn the basic of flutter app in dicoding. This is simple app using API from TMDB (The Movie Database).",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: ColorItem.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 18,
                ),
                decoration: BoxDecoration(
                  color: ColorItem.white,
                  borderRadius: BorderRadius.circular(6),
                ),
                constraints: const BoxConstraints(
                  maxWidth: 420,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search...',
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.search,
                            color: ColorItem.red,
                          ),
                          isDense: true,
                          contentPadding: const EdgeInsets.all(0),
                        ),
                        textAlignVertical: TextAlignVertical.center,
                      ),
                    ),
                    Container(
                      width: 1,
                      height: 26,
                      color: Colors.grey[300],
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.keyboard_arrow_right,
                        color: ColorItem.red,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
