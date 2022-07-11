import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import '../Main_Files/Admin_HomPage.dart';


class View_Update extends StatefulWidget {
  final List list;
  final int index;

  View_Update({required this.list, required this.index});

  @override
  _View_UpdateState createState() => new _View_UpdateState();
}

class _View_UpdateState extends State<View_Update> {

  TextEditingController controllername = TextEditingController();
  TextEditingController controllercatagory = TextEditingController();
  TextEditingController controlleraddress = TextEditingController();
  TextEditingController controllerphone = TextEditingController();
  TextEditingController controllermobile = TextEditingController();
  TextEditingController controllerblood = TextEditingController();
  TextEditingController controllerinsta = TextEditingController();
  TextEditingController controllerwebsite = TextEditingController();
  TextEditingController controllerfacebook = TextEditingController();
  TextEditingController controlleremail = TextEditingController();
  TextEditingController controllerwatsap = TextEditingController();
  TextEditingController controllerother_pro= TextEditingController();
  TextEditingController controllerimage = TextEditingController();

  void UpdateData() {
    var url ="https://jcizone19.in/._A_nileswaram/directoryapp/Nileswaram.com/Update/View_Update.php";

    http.post(Uri.parse(url),
        body: {
          "id": widget.list[widget.index]['id'],
          "name": controllername.text,
          "catagory": controllercatagory.text,
          "address": controlleraddress.text,
          "phone": controllerphone.text,
          "mobile": controllermobile.text,
          "blood": controllerblood.text,
          "insta": controllerinsta.text,
          "website": controllerwebsite.text,
          "facebook": controllerfacebook.text,
          "email": controlleremail.text,
          "watsap": controllerwatsap.text,
          "other_pro": controllerother_pro.text,
          "image": controllerimage.text,


        });
  }


  @override
  void initState() {
    controllername= new TextEditingController(text: widget.list[widget.index]['name'] );
    controllercatagory= new TextEditingController(text: widget.list[widget.index]['catagory'] );
    controlleraddress= new TextEditingController(text: widget.list[widget.index]['address'] );
    controllerphone= new TextEditingController(text: widget.list[widget.index]['phone'] );
    controllermobile= new TextEditingController(text: widget.list[widget.index]['mobile'] );
    controllerblood= new TextEditingController(text: widget.list[widget.index]['blood'] );
    controllerinsta= new TextEditingController(text: widget.list[widget.index]['insta'] );
    controllerwebsite= new TextEditingController(text: widget.list[widget.index]['website'] );
    controllerfacebook= new TextEditingController(text: widget.list[widget.index]['facebook'] );
    controlleremail= new TextEditingController(text: widget.list[widget.index]['email'] );
    controllerwatsap= new TextEditingController(text: widget.list[widget.index]['watsap'] );
    controllerother_pro= new TextEditingController(text: widget.list[widget.index]['other_pro'] );
    controllerimage= new TextEditingController(text: widget.list[widget.index]['image'] );


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(
          "EDIT DATA",
          style: GoogleFonts.prompt(color: Colors.red.shade900),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_rounded,
            color: Colors.red.shade900,
            size: 35,// add custom icons also
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new TextField(
                  controller: controllercatagory,
                  decoration: new InputDecoration(
                      hintText: "category", labelText: "category"),
                ),
                new TextField(
                  // maxLines: 10,
                  controller: controllername,
                  decoration: new InputDecoration(
                      hintText: "name", labelText: "name"),
                ),
                new TextField(
                  maxLines: 6,
                  controller: controlleraddress,
                  decoration: new InputDecoration(
                      hintText: "address", labelText: "address"),
                ),
                new TextField(
                  // maxLines: 10,
                  controller: controllerphone,
                  decoration: new InputDecoration(
                      hintText: "phone no", labelText: "phone no"),
                  keyboardType: TextInputType.number,
                ),
                new TextField(
                  // maxLines: 10,
                  controller: controllerwatsap,
                  decoration: new InputDecoration(
                      hintText: "watsap no", labelText: "watsap no"),
                  keyboardType: TextInputType.number,
                ),
                new TextField(
                  // maxLines: 10,
                  controller: controlleremail,
                  decoration: new InputDecoration(
                      hintText: "email", labelText: "email"),
                ),
                new TextField(
                  // maxLines: 10,
                  controller: controllerwebsite,
                  decoration: new InputDecoration(
                      hintText: "website address", labelText: "website address"),
                ),
                new TextField(
                  // maxLines: 10,
                  controller: controllerfacebook,
                  decoration: new InputDecoration(
                      hintText: "facebook link", labelText: "facebook link"),
                ),
                new TextField(
                  // maxLines: 10,
                  controller: controllerinsta,
                  decoration: new InputDecoration(
                      hintText: "instagram link", labelText: "instagram link"),
                ),
                new TextField(
                  // maxLines: 10,
                  controller: controllerblood,
                  decoration: new InputDecoration(
                      hintText: "blood group", labelText: "blood group"),
                ),
                new TextField(
                  // maxLines: 10,
                  controller: controllerother_pro,
                  decoration: new InputDecoration(
                      hintText: "other products", labelText: "other produts"),
                ),
                new Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                new RaisedButton(
                  child: new Text("Submit",style: TextStyle(color: Colors.white),),
                  color: Colors.red.shade900,
                  onPressed: () {
                    UpdateData();
                    Navigator.of(context).push(
                        new MaterialPageRoute(
                            builder: (BuildContext context)=>Admin_HomePage()
                        )
                    );
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
