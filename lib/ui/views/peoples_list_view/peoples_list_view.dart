import 'package:flutter/material.dart';
import 'package:flutter_starter_app/common/base_view.dart';
import 'package:flutter_starter_app/common/viewstate.dart';
import 'package:flutter_starter_app/ui/views/peoples_list_view/peoples_list_viewmodel.dart';

class PeoplesListView extends StatefulWidget{
  @override
  State<PeoplesListView> createState() => _PeoplesListViewState();
}

class _PeoplesListViewState extends State<PeoplesListView> {




  @override
  Widget build(BuildContext context) {
     return BaseView<ListViewModel>(
         onModelReady: (model) => model.onFirstLoad(),
    builder: (context, model, children) =>
      Scaffold(
       body: Stack(
         children: [
            ListView.builder(
             itemCount: model.listOfPeople.length,
             itemBuilder: (context, i){

                 return Card(

                   child: Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: GestureDetector(
                       onTap: (){
                         model.selectedPerson(model.listOfPeople[i]);
                       },
                       child: ListTile(
                         leading: SizedBox(
                           height: 80,
                             width: 80,
                             child:
                               Image.network(model.listOfPeople[i].model?.picture ?? "",
                                 fit: BoxFit.cover,
                                 errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                        child: Center(child: Text("Image failed to load", style: TextStyle(fontSize: 8),),),
                                    ); //do something
                                 },

                               )
                         ),
                             title: Row(
                           children: [
                             Text("${model.listOfPeople[i].model?.name?.first}"),
                             Text(" "),
                             Text("${model.listOfPeople[i].model?.name?.last}"),
                           ],
                         ),
                             subtitle: Text(model.listOfPeople[i].address ?? ""),

                       ),
                     ),
                   ),
                 );
               }

           ),
           Visibility(
               visible: model.state == ViewState.Busy,
               child: Center(child: CircularProgressIndicator(),
               ),
           )

         ],

       ),
     ));
  }
}