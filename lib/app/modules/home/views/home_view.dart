import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:teangan_film_mobile/app/modules/home/controllers/home_controller.dart';
import 'package:teangan_film_mobile/app/resources/global/colors.dart';
import 'package:teangan_film_mobile/app/resources/global/images.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        backgroundColor: ColorItem.red,
        elevation: 0,
      ),
      body: const Center(
        child: Text(
          'Halaman Utama!',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
