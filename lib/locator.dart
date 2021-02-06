import 'package:portfolio/get_it/animation_get_it.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setup() {
  locator.registerLazySingleton<AnimationGetIt>(() => AnimationGetIt());
}
