import 'package:flutter_starter_app/model/peoples_list_model.dart';
import 'package:flutter_starter_app/model/peoples_location_model.dart';
import 'package:flutter_starter_app/repository/peoples_repo.dart';
import 'package:flutter_starter_app/services/peoples_service/peoples_service_impl.dart';

class PeoplesRepo implements IPeoplesRepository{
  var _service = PeoplesService();

  Future<List<PeoplesListModel>> _getPeoplesList() async{
    var list = await _service.getPeoplesList();

    //remove people without address
    list.removeWhere((element) => element.address == '');
    return list;
  }


  @override
  Future<List<PeoplesListModel>> getPeoplesList() async {
    return  await _getPeoplesList();
  }

  @override
  Future<List<PeoplesLocationModel>> getPeoplesLocation() async{

    var peoplesList = await _getPeoplesList();
    List<PeoplesLocationModel> peoplesLocation = [];
    peoplesList.forEach((e) {
      peoplesLocation.add(
          PeoplesLocationModel(
              peoplesName: "${e.model?.name?.first} ${e.model?.name?.last} ",
              imageAddr: e.model?.picture,
              sid: e.model?.sId ,
              location: e.model?.location,
              address: e.address
          ));
    });


    return peoplesLocation;
  }



}