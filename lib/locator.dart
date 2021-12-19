import 'package:flutter_starter_app/ui/views/peoples_list_view/peoples_list_viewmodel.dart';
import 'package:flutter_starter_app/ui/views/peoples_map_view/peoples_map_viewmodel.dart';
import 'package:flutter_starter_app/ui/views/persons_map_view/persons_map_viewmodel.dart';
import 'package:get_it/get_it.dart';
import 'common/navigation_service.dart';
import 'viewmodels/home_viewmodel.dart';



GetIt locator = GetIt.instance;

void setupLocator() {

   //navigation service for global app context
   locator.registerLazySingleton(() => NavigationService());
   locator.registerFactory(() => HomeModel());

   locator.registerFactory(() => ListViewModel());
   locator.registerFactory(() => PeoplesMapViewModel());
   locator.registerFactory(() => PersonsMapViewModel());

}

