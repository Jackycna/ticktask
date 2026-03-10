import 'package:get_it/get_it.dart';
import 'package:tick_task/features/auth/di/auth_injection.dart';
import 'package:tick_task/features/home/di/home_injection.dart';
import 'package:tick_task/features/splash/di/splash_injection.dart';

class DepInjection {
  static final GetIt sl = GetIt.instance;
  static Future<void> depInjection() async {
    await splashInjection(sl);
    await authinjection(sl);
    await homeInjection(sl);
  }
}
