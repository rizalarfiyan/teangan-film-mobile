import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'app/resources/global/utils.dart';
import 'app/resources/widgets/splash_screen.dart';
import 'app/routes/app_pages.dart';

void main() async {
  await dotenv.load(
    fileName: '.env',
  );
  runApp(const TeanganFilm());
}

class TeanganFilm extends StatelessWidget {
  const TeanganFilm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!Utils.isProduction()) return mainApp();
    return FutureBuilder(
      future: Future.delayed(const Duration(seconds: 2)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SplashScreen();
        }
        return mainApp();
      },
    );
  }

  GetMaterialApp mainApp() {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
