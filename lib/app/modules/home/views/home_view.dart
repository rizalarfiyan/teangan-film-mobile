import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teangan_film_mobile/app/model/movies.dart';
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
          margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: controller.obx(
            (data) => LayoutBuilder(
              builder: (context, constraints) {
                return GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: data?.length ?? 0,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    childAspectRatio: 5 / 3,
                  ),
                  itemBuilder: (context, index) {
                    return MovieCard(
                      movie: data[index],
                    );
                  },
                );
              },
            ),
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
        Obx(() {
          if (controller.hasReadMore.value) {
            return Container(
              width: Get.width,
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(4),
                    ),
                  ),
                  backgroundColor: ColorItem.red,
                ),
                onPressed: () {
                  controller.nextPage();
                },
                child: const Text(
                  "Load More",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            );
          }
          return SizedBox(
            width: Get.width,
            height: 20,
          );
        }),
      ],
    );
  }
}

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({
    Key? key,
    required this.movie,
  }) : super(key: key);

  Color getColorByRating(num score) {
    if (score == 0) {
      return ColorItem.rateNone;
    } else if (score <= 5) {
      return ColorItem.rateBad;
    } else if (score <= 7.5) {
      return ColorItem.rateMedium;
    } else if (score <= 10) {
      return ColorItem.rateGood;
    }
    return ColorItem.rateBad;
  }

  @override
  Widget build(BuildContext context) {
    String coverUrl = "https://image.tmdb.org/t/p/w500${movie.posterPath}";

    return InkWell(
      child: Container(
        margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
          color: ColorItem.white,
        ),
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 2 / 3,
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(8),
                      ),
                      child: CachedNetworkImage(
                        imageUrl: coverUrl,
                        fit: BoxFit.cover,
                        placeholder: (context, url) {
                          return const Center(
                            child: StaggeredDotsWave(
                              color: Colors.white,
                              size: 26,
                            ),
                          );
                        },
                        errorWidget: (context, url, error) {
                          return const Center(
                            child: Icon(Icons.error),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 16,
                    bottom: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.45,
                        child: Text(
                          movie.originalTitle,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: ColorItem.black,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          const Icon(
                            Icons.remove_red_eye,
                            size: 14,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            "${movie.popularity.toString()} views",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: ColorItem.black,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          const Icon(
                            Icons.how_to_vote_outlined,
                            size: 14,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            "${movie.voteCount.toString()} votes",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: ColorItem.black,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          const Icon(
                            Icons.access_time,
                            size: 14,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            movie.releaseDate,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: ColorItem.black,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.label_important,
                            size: 14,
                          ),
                          const SizedBox(width: 6),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 3.5,
                            child: Text(
                              movie.genres.map((e) => e.name).join(', '),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                color: ColorItem.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              left: 16,
              top: 16,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(6),
                ),
                child: Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: getColorByRating(movie.voteAverage),
                  ),
                  child: Center(
                    child: Text(
                      movie.voteAverage.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
