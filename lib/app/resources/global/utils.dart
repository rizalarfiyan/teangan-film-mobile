import 'package:flutter_dotenv/flutter_dotenv.dart';

class Utils {
  static bool isProduction() {
    return dotenv.env['ENV']! == 'production';
  }
}
