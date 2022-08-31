import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teangan_film_mobile/app/modules/home/controllers/home_controller.dart';
import 'package:teangan_film_mobile/app/resources/components/wrapper.dart';
import 'package:teangan_film_mobile/app/resources/global/colors.dart';
import 'package:teangan_film_mobile/app/resources/global/loading.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WrapperContent(
      height: 260,
      content: [
        Container(
          margin: const EdgeInsets.all(20),
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
        Container(
          padding: const EdgeInsets.only(
            top: 20,
            left: 20,
            right: 20,
            bottom: 40,
          ),
          child: controller.obx(
            (data) => LayoutBuilder(builder: (context, constraints) {
              return GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: data?.length ?? 0,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  var details = data[index];
                  return Text(details.originalTitle);
                },
              );
            }),
            onEmpty: const SizedBox(
              height: 220,
              child: Center(
                child: Text("Empty movies!"),
              ),
            ),
            onLoading: SizedBox(
              height: 220,
              child: Center(
                child: StaggeredDotsWave(
                  color: ColorItem.red5,
                  size: 36,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
