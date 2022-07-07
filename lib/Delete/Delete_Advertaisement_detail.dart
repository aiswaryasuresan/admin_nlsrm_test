import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import '../Main_Files/Admin_HomPage.dart';
import 'Delete.dart';
import 'Delete_Event.dart';



class Advertaisement_Delete_Detail extends StatefulWidget {
  List list;
  int index;
  Advertaisement_Delete_Detail({required this.index,required this.list});
  @override
  _Advertaisement_Delete_DetailState createState() => new _Advertaisement_Delete_DetailState();
}

class _Advertaisement_Delete_DetailState extends State<Advertaisement_Delete_Detail> {

  void deleteData(){
    //var url="http://10.0.2.2/my_store/deleteData.php";
    var url= "https://jcizone19.in/._A_nileswaram/directoryapp/Nileswaram.com/Delete/Delete_Advertaisement.php";
    http.post(Uri.parse(url),
        body: {
          'id': widget.list[widget.index]['id']
        });
  }

  void confirm (){
    AlertDialog alertDialog = new AlertDialog(
      content: new Text("Are You sure want to delete '${widget.list[widget.index]['name']}'"),
      actions: <Widget>[
        new RaisedButton(
          child: new Text("OK DELETE!",style: new TextStyle(color: Colors.black),),
          color: Colors.red,
          onPressed: (){
            deleteData();
            Navigator.of(context).push(
                new MaterialPageRoute(
                  builder: (BuildContext context)=> Admin_HomePage (),
                )
            );
          },
        ),
        new RaisedButton(
          child: new Text("CANCEL",style: new TextStyle(color: Colors.black)),
          color: Colors.green,
          onPressed: ()=> Navigator.pop(context),
        ),
      ],
    );

    showDialog(context: context, builder: (BuildContext context) =>alertDialog,);

    // showDialog(context: context, child: alertDialog);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.pink.shade800,
        title:Text("${widget.list[widget.index]['name']}",
          style: GoogleFonts.prompt(fontSize: 22),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: new Container(
        height: 200.0,
        padding: const EdgeInsets.all(20.0),
        child: new Card(
          child: new Center(
            child: new Column(
              children: <Widget>[

                new Padding(padding: const EdgeInsets.only(top: 30.0),),
                //    new Text(widget.list[widget.index]['item_name'], style: new TextStyle(fontSize: 20.0),),
                //     Container(
                //       height: 50,
                //       width: 50,
                //       decoration: BoxDecoration(
                //         shape: BoxShape.circle,
                //         border: Border.all(color: Colors.red.shade900),
                //         image: DecorationImage(
                //           image: NetworkImage(widget.list[widget.index]['image']),
                //         ),
                //       ),
                //     ),

                new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new RaisedButton(
                      child: new Text("DELETE",style: TextStyle(color: Colors.white),),
                      color: Colors.red.shade900,
                      onPressed: ()=>confirm(),
                    ),
                    // SizedBox(width: 10,),
                    // new RaisedButton(
                    //   child: new Text("EDIT",style: TextStyle(color: Colors.white),),
                    //   color: Colors.red.shade900,
                    //   onPressed: (){},
                    //   //=>confirm(),
                    // ),
                  ],
                ),
                new Padding(padding: const EdgeInsets.only(top: 30.0),),
                new Text(widget.list[widget.index]['name'], style: new TextStyle(fontSize: 15.0),  textAlign: TextAlign.justify,),


              ],
            ),
          ),
        ),
      ),
    );
  }
}