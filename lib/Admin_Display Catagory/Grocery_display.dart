import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_nileswaram_test/Main_Files/Admin_HomPage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:open_mail_app/open_mail_app.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:maps_launcher/maps_launcher.dart';

import 'GroceryDetail.dart';


class Display_Grocery_Data extends StatefulWidget {
  @override
  _Display_Grocery_DataState createState() => new _Display_Grocery_DataState();
}

class _Display_Grocery_DataState extends State<Display_Grocery_Data> {
//Applying get request.

  Future<List> getData() async {
    final response = await http.get(Uri.parse( "https://jcizone19.in/._A_nileswaram/directoryapp/Nileswaram.com/Main_Grocery_Display.php"));
    return json.decode(response.body);
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.pink.shade800,
          title: Text(
            "Grocery Shops",
            style: GoogleFonts.prompt(fontSize: 22),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_rounded),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
          // padding: EdgeInsets.all(16.0),
          child: new FutureBuilder<List>(
            future: getData(),
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);

              return snapshot.hasData
                  ? new ItemList(
                // list: snapshot.data,
                list: snapshot.data??[],
              )
                  : new Center(
                child: new CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;
  ItemList({required this.list});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return new Container(
          padding: const EdgeInsets.all(10.0),
          child: new GestureDetector(
            onTap: () =>
                Navigator.of(context).push(
                    new MaterialPageRoute(
                        builder: (BuildContext context) =>
                        new GroceryDetail(list: list, index: i,)
                    )
                ),

            child:  ListTile(
                contentPadding: EdgeInsets.all(10.0),
                leading: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.red.shade900),
                    image: DecorationImage(
                      image: NetworkImage(list[i]['image']),
                    ),
                  ),
                ),
                title: Text(
                  list[i]['name'],
                  style: GoogleFonts.lora(
                      fontSize: 20, color: Colors.pink.shade700),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                        return GroceryDetail(list: list, index: i,);
                      }));
                }
            ),
          ),
        );
      },
    );

  }
}




