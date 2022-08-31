import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teangan_film_mobile/app/resources/global/clipper.dart';
import 'package:teangan_film_mobile/app/resources/global/colors.dart';
import 'package:teangan_film_mobile/app/resources/global/images.dart';

class WrapperContent extends StatelessWidget {
  final String? name;
  final String? description;
  final double? height;
  final List<Widget>? content;

  const WrapperContent({
    Key? key,
    this.name,
    this.description,
    this.height,
    this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              ClipPath(
                clipper: RoundedClipper(),
                child: Container(
                  width: Get.width,
                  height: height ?? 320,
                  color: ColorItem.red,
                ),
              ),
              Column(
                children: [
                  HeaderContent(
                    name: name ?? 'Rizal Arfiyan',
                    description: description ?? 'Get more the new movie!',
                  ),
                  ...content ?? <Widget>[],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HeaderContent extends StatelessWidget {
  final String name;
  final String description;

  const HeaderContent({
    Key? key,
    required this.name,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: "Hello ",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  children: [
                    TextSpan(
                      text: name,
                      style: const TextStyle(
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              RichText(
                text: TextSpan(
                  text: description,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 42,
            height: 42,
            child: CircleAvatar(
              radius: 10,
              backgroundImage: AssetImage(Images.userAvatar),
            ),
          ),
        ],
      ),
    );
  }
}
