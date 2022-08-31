import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teangan_film_mobile/app/modules/home/controllers/home_controller.dart';
import 'package:teangan_film_mobile/app/resources/components/wrapper.dart';
import 'package:teangan_film_mobile/app/resources/global/colors.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WrapperContent(
      height: 260,
      content: [
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          width: Get.width,
          height: 200,
          color: Colors.grey[350],
          child: Center(
            child: Text(
              "Slider",
              style: TextStyle(
                color: ColorItem.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
