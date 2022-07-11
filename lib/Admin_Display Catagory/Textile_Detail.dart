import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_nileswaram_test/Update/Update_Textile.dart';
import 'package:full_screen_image/full_screen_image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:open_mail_app/open_mail_app.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

import '../Main_Files/Admin_HomPage.dart';

class Textile_Detail extends StatefulWidget {
  List list;
  int index;
  Textile_Detail({required this.index,required this.list});

  @override
  State<Textile_Detail> createState() => _Textile_DetailState();
}

class _Textile_DetailState extends State<Textile_Detail> {

  void deleteData(){
    //var url="http://10.0.2.2/my_store/deleteData.php";
    var url= "https://jcizone19.in/._A_nileswaram/directoryapp/Nileswaram.com/Delete/Textile_Delete.php";
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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_rounded),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                confirm();
              },
            ),
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context)=>Textile_Update(list: widget.list, index: widget.index,),
                  ), );
              },
            ),
          ],
        ),

        // appBar: AppBar(
        //   centerTitle: true,
        //   backgroundColor: Colors.pink.shade800,
        //   title: Text(passing_data.name),
        // ),
        body:new SingleChildScrollView(
          child:new Stack(
            children: [
              FullScreenWidget(
                child:new Container(
                  height: MediaQuery.of(context).size.height / 2.5,
                  width: MediaQuery.of(context).size.width / 0.5,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        widget.list[widget.index]['image'],
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Padding(
                //padding: EdgeInsets.symmetric(vertical: 100, horizontal: 25),
                padding: EdgeInsets.only(top: 250),
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height/7,
                      width: MediaQuery.of(context).size.width/1,
                      decoration: BoxDecoration(
                        color: Colors.greenAccent.shade100,
                        //  color: Color(0xB6C33A),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(50),
                            topLeft: Radius.circular(50)),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            // padding: EdgeInsets.only(top: 20, right: 150),
                              padding: EdgeInsets.only(right: 30,left: 30,top: 10),
                              child:new Text(
                                widget.list[widget.index]['name'],
                                style: GoogleFonts.poppins(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              )),
                          Padding(
                              padding: EdgeInsets.only(right: 30,left: 30,top: 10),
                              child: Text(
                                widget.list[widget.index]['address'],
                                style: GoogleFonts.inter(
                                  fontSize: 11,
                                ),
                              )),
                          SizedBox(height: 5,),
                          Padding(
                              padding: EdgeInsets.only(right: 30,left: 30,top: 10),
                              child: GestureDetector(

                                child: GestureDetector(
                                  onTap: () async => !await launch(widget.list[widget.index]['website']),
                                  child: Text(
                                    "Website:" +  widget.list[widget.index]['website'],
                                    style: GoogleFonts.inter(
                                        fontSize: 13, color: Colors.pink.shade300,fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 20,
                        ),
                        Container(
                            height: 35,
                            width: 35,
                            child: Icon(
                              Icons.phone,
                              size: 20,
                            ),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(10))),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Phone",
                              style: GoogleFonts.inter(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade600),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: 20,
                              width: 130,
                              decoration: BoxDecoration(
                                  color: Colors.pink.shade50,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                  child: GestureDetector(
                                    onTap: () async => !await launch('tel:' + widget.list[widget.index]['phone']),
                                    child: Text(
                                      widget.list[widget.index]['phone'],
                                      style: GoogleFonts.inter(
                                          fontSize: 12,
                                          decoration: TextDecoration.underline,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.pink.shade300),
                                    ),
                                  )),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 22,
                            ),
                            Container(
                              height: 20,
                              width: 130,
                              decoration: BoxDecoration(
                                  color: Colors.pink.shade50,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                  child: GestureDetector(
                                    onTap: () async => !await launch('tel:' + widget.list[widget.index]['mobile']),
                                    child: Text(
                                      widget.list[widget.index]['mobile'],
                                      style: GoogleFonts.inter(
                                          fontSize: 12,
                                          decoration: TextDecoration.underline,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.pink.shade300),
                                    ),
                                  )),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 20,
                        ),
                        Container(
                            height: 35,
                            width: 35,
                            child: Icon(
                              Icons.email_outlined,
                              size: 20,
                            ),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(10))),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Email",
                              style: GoogleFonts.inter(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade600),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: 20,
                              width: 180,
                              decoration: BoxDecoration(
                                  color: Colors.pink.shade50,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                  child: GestureDetector(
                                    onTap: ()async {
                                      var result = await OpenMailApp.openMailApp();
                                      if (!result.didOpen && !result.canOpen) {
                                        showNoMailAppsDialog(context);
                                      } else if (!result.didOpen && result.canOpen) {
                                        showDialog(
                                          context: context,
                                          builder: (_) {
                                            return MailAppPickerDialog(
                                              mailApps: result.options,
                                            );
                                          },
                                        );
                                      }
                                    },

                                    child: Text(
                                      widget.list[widget.index]['email'],
                                      style: GoogleFonts.inter(
                                          fontSize: 12,
                                          decoration: TextDecoration.underline,

                                          fontWeight: FontWeight.bold,
                                          color: Colors.pink.shade300),
                                    ),
                                  )),
                            ),
                          ],
                        ),


                      ],
                    ),

                    SizedBox(height: 20,),
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 20,
                        ),
                        Container(
                            height: 35,
                            width: 35,
                            child: Icon(
                              Icons.bloodtype_outlined,
                              size: 20,
                            ),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(10))),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Blood Group",
                              style: GoogleFonts.inter(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade600),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: 20,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: Colors.pink.shade50,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                  child: Text(
                                    widget.list[widget.index]['blood'],
                                    style: GoogleFonts.inter(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.pink.shade300),
                                  )),
                            ),
                          ],
                        ),
                      ],
                    ),

                    SizedBox(height: 20,),

                    Text(
                      "Other Products",
                      style: GoogleFonts.inter(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade600),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      padding: EdgeInsets.all(10),
                      height:MediaQuery.of(context).size.height/4,
                      width:MediaQuery.of(context).size.width/1.2,
                      decoration: BoxDecoration(
                          color: Colors.pink.shade50,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                          child: Text(
                            widget.list[widget.index]['other_pro'],
                            style: GoogleFonts.inter(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.pink.shade300),
                          )),
                    ),


                    SizedBox(height: 30,),

                    Padding(
                      padding: EdgeInsets.all(20),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                            primary: Colors.red.shade900,
                            padding: EdgeInsets.symmetric(horizontal: 90, vertical: 18),
                            textStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold)),
                        onPressed: () => MapsLauncher.launchQuery(
                            widget.list[widget.index]['latilongi']),

                        child: Text("View Direction",style: GoogleFonts.inter(fontSize: 15),),

                      ),
                    ),

                    SizedBox(height: 5,),
                    Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width/1.5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(width:1,color: Colors.grey)
                      ),
                      child: Column(children:[
                        SizedBox(height: 10,),
                        Text("Connect Us On",style: GoogleFonts.inter(fontSize: 18,fontWeight: FontWeight.bold),),
                        //   Image.asset('assets/facebook.png',height: 40,width: 40,fit: BoxFit.fill,),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () async => !await launch(widget.list[widget.index]['facebook']),
                              child: Image.asset(
                                "assets/facebook.png",
                                height: 40,
                                width: 40,
                              ),
                            ),
                            SizedBox(width: 10,),
                            GestureDetector(
                              onTap: () async => !await launch(widget.list[widget.index]['insta']),
                              child: Image.asset(
                                "assets/instagram.png",
                                height: 40,
                                width: 40,
                              ),
                            ),
                            SizedBox(width: 10,),
                            GestureDetector(
                              onTap: () async => await launch(
                                  "https://wa.me/${widget.list[widget.index]['watsap']}?text=Hello"),
                              child: Image.asset(
                                "assets/watsap.png",
                                height: 40,
                                width: 40,
                              ),
                            ),




                          ],
                        ),
                      ],
                      ),

                    ),

                    // Image(
                    //   image: AssetImage('assets/watsap.png')),

                  ],
                ),
              ),
            ],
          ),
        ),

      ),
    );
  }

  void showNoMailAppsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Open Mail App"),
          content: Text("No mail apps installed"),
          actions: <Widget>[
            FlatButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }
}


