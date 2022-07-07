import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import 'News_Details.dart';


class News_Display_with_delete extends StatefulWidget {
  @override
  _News_Display_with_deleteState createState() => new _News_Display_with_deleteState();
}

class _News_Display_with_deleteState extends State<News_Display_with_delete> {
  Future<List> getData() async {
    final response = await http.get(Uri.parse( "https://jcizone19.in/._A_nileswaram/directoryapp/Nileswaram.com/news_Display.php"));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.pink.shade800,
        title: Text(
          "Read News",
          style: GoogleFonts.prompt(fontSize: 22),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: new FutureBuilder<List>(
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
            onTap: ()=>Navigator.of(context).push(
                new MaterialPageRoute(
                    builder: (BuildContext context)=> new News_Detail(list:list , index: i,)
                )
            ),
            child: new  Card(
              margin: EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: ListTile(
                minLeadingWidth: 5,
                // contentPadding: EdgeInsets.all(5.0),
                leading:Icon(Icons.circle,size: 10,color: Colors.red.shade900,),


                title: Text(
                  (list[i]['name']),
                  style: GoogleFonts.lora(
                      fontSize: 13, color: Colors.pink.shade700),
                ),

              ),
            ),
          ),

        );
      },
    );
  }
}





