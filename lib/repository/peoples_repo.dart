import 'package:flutter_starter_app/model/peoples_list_model.dart';
import 'package:flutter_starter_app/model/peoples_location_model.dart';




abstract class IPeoplesRepository {
  Future<List<PeoplesListModel>?> getPeoplesList();
  Future<List<PeoplesLocationModel>?> getPeoplesLocation();
}