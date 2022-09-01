import 'package:get/get.dart';
import 'package:teangan_film_mobile/app/data/movies.dart';
import 'package:teangan_film_mobile/app/model/movies.dart';

class HomeController extends GetxController with StateMixin {
  RxInt present = 0.obs;
  RxBool hasReadMore = true.obs;
  int perPage = 4;
  List<Movie> rawListMovie = <Movie>[];
  List<Movie> listMovie = <Movie>[];

  void nextPage() {
    int countPage = present.value + perPage;
    if (rawListMovie.isEmpty || present.value > rawListMovie.length) return;
    if (listMovie.isEmpty || countPage <= rawListMovie.length) {
      listMovie.addAll(
        rawListMovie.getRange(present.value, present.value + perPage),
      );
    } else {
      listMovie.addAll(
        rawListMovie.getRange(present.value, rawListMovie.length),
      );
    }
    hasReadMore.value = !(countPage >= rawListMovie.length);
    change(listMovie, status: RxStatus.success());
    present.value = present.value + perPage;
  }

  @override
  void onInit() async {
    rawListMovie = await MoviesData.getListMovies();
    nextPage();
    super.onInit();
  }
}
