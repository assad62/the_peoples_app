import 'package:flutter/material.dart';
import 'package:flutter_starter_app/shared_ul/peoples_app_bar.dart';
import 'package:flutter_starter_app/ui/views/peoples_list_view/peoples_list_view.dart';
import 'package:flutter_starter_app/ui/views/peoples_map_view/peoples_map_view.dart';
import '../../common/base_view.dart';
import '../../viewmodels/home_viewmodel.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>  {
  int _selectedIndex = 0;


  @override
  bool get wantKeepAlive => true;




  static  List<Widget> _pages = <Widget>[
    PeoplesListView(),
    PeoplesMapView(),
  ];



  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return BaseView<HomeModel>(

        onModelReady: (model) => model.onFirstLoad(),
        builder: (context, model, children) =>

            Scaffold(

              appBar:  PeoplesAppBar(),
              body: _pages[_selectedIndex],
              bottomNavigationBar: BottomNavigationBar(
                selectedItemColor: Colors.black,
                currentIndex: _selectedIndex,
                onTap: _onItemTapped,
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.list,
                    ),
                    label: 'List',
                  ),
                  BottomNavigationBarItem(

                    icon: Icon(
                      Icons.map,
                    ),
                    label: 'Map',
                  ),

                ],
              ),

              // This trailing comma makes auto-formatting nicer for build methods.
            )


    );

  }




}

