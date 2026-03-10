import 'package:get_it/get_it.dart';
import 'package:tick_task/features/splash/presentation/bloc/splash_bloc.dart';

Future<void> splashInjection(GetIt sl) async {
  sl.registerFactory(() => SplashBloc());
}
