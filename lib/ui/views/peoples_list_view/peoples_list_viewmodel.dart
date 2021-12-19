import 'package:flutter/material.dart';
import 'package:flutter_starter_app/common/base_model.dart';
import 'package:flutter_starter_app/common/navigation_service.dart';
import 'package:flutter_starter_app/common/viewstate.dart';
import 'package:flutter_starter_app/model/peoples_list_model.dart';
import 'package:flutter_starter_app/repository/peoples_repo_impl.dart';
import 'package:flutter_starter_app/ui/router.dart';
import 'package:flutter_starter_app/ui/views/persons_map_view/persons_map_view.dart';

import '../../../locator.dart';

class ListViewModel extends BaseModel{
  var _context = locator<NavigationService>().navigatorKey.currentContext!;
  List<PeoplesListModel> listOfPeople = [];


  var _repo = PeoplesRepo();

  void onFirstLoad() async{

    setState(ViewState.Busy);
    listOfPeople = await _repo.getPeoplesList();
    setState(ViewState.Idle);
  }

  void selectedPerson(PeoplesListModel listOfPeople) async {

    await Navigator.pushNamed(_context,AppRoutes.singlePersonMap,
                 arguments: SelectedPerson(listOfPeople.model?.sId ?? ""));
  }


}