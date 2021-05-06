import 'package:get_it/get_it.dart';
import 'Services/SharedPreferenceHelper.dart';


GetIt locator = GetIt.instance;
void setupLocator(){
  locator.registerSingleton(() => SharedPreferenceHelper());
}