import 'package:get/get.dart';
import 'package:teangan_film_mobile/app/data/movies.dart';

class HomeController extends GetxController with StateMixin {
  @override
  void onInit() {
    super.onInit();
    MoviesData.getListMovies().then((response) {
      change(response, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }
}
