import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gadjet_invetory/Form/Data.dart';
import 'package:pdf_flutter/pdf_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';

class DetailView extends StatelessWidget {
  final Data data;
  DetailView(this.data);

  List<Data> dataList = [];
  List<bool> favList = [];
  bool searchState = false;
  FirebaseAuth auth = FirebaseAuth.instance;

  int selectedRadioTile;

  String get path => null;

  String get title => null;

  setSelectedRadioTile(int val) {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Item Details'),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          margin: EdgeInsets.all(1.5),
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Image.network(
                data.imgUrl != null
                    ? data.imgUrl
                    : '',
                width: 500,
                height: 500,

              ),


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Cattegorry Type:- "
                            "${data.cattegorrytype}",
                        style: TextStyle(color: Colors.black),
                      ),

                    ),
                  ),


                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Theme(
                        data: ThemeData(
                          hintColor: Colors.blue,
                        ),

                        child: Text(  "Company Name:- "
                            "${data.companyname}",

                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ),

                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Theme(
                        data: ThemeData(
                          hintColor: Colors.blue,
                        ),

                        child: Text(  "Model Name:- "
                            "${data.modelname}",




                          style: TextStyle(color: Colors.black),

                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Theme(
                        data: ThemeData(
                          hintColor: Colors.blue,
                        ),

                        child: Text(  "Series Name:- "
                            "${data.seriesname}",

                          style: TextStyle(color: Colors.black),

                        ),
                      ),
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Theme(
                        data: ThemeData(
                          hintColor: Colors.blue,
                        ),

                        child: Text(  "Year Of MFG:- "
                            "${data.year}",

                          style: TextStyle(color: Colors.black),

                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Theme(
                        data: ThemeData(
                          hintColor: Colors.blue,
                        ),

                        child: Text(  "Seriel Number:- "
                            "${data.serielnumber}",

                          style: TextStyle(color: Colors.black),

                        ),
                      ),
                    ),
                  ),

                ],
              ),





              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Theme(
                        data: ThemeData(
                          hintColor: Colors.blue,
                        ),

                        child: Text(  "Warranty Date:- "
                            "${data.warrantydate}",




                          style: TextStyle(color: Colors.black),






                        ),
                      ),
                    ),
                  ),
                ],
              ),


              RaisedButton(

                onPressed: () {
                  Fluttertoast.showToast(
                    msg: "View Service Centre Details",
                    gravity: ToastGravity.CENTER,
                    toastLength: Toast.LENGTH_LONG,
                    // timeInSecForIosWeb: 2
                  );

                  //  _startWCUpload();

                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),

                color: Colors.blue,
                child: Text("Service Centre Details",
                  style: TextStyle(fontSize: 18, color: Colors.white),),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Theme(
                        data: ThemeData(
                          hintColor: Colors.blue,
                        ),

                        child: Text(  "Name:- "
                            "${data.name}",

                          style: TextStyle(color: Colors.black),

                        ),
                      ),
                    ),
                  ),

                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Theme(
                        data: ThemeData(
                          hintColor: Colors.blue,
                        ),

                        child: Text(  "Mobile Number:- "
                            "${data.mobilenumber}",

                          style: TextStyle(color: Colors.black),

                        ),
                      ),
                    ),
                  ),

                ],
              ),


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Theme(
                        data: ThemeData(
                          hintColor: Colors.blue,
                        ),

                        child: Text(  "Address:- "
                            "${data.address}",


                          style: TextStyle(color: Colors.black),

                        ),
                      ),
                    ),
                  ),

                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Theme(
                        data: ThemeData(
                          hintColor: Colors.blue,
                        ),

                        child: Text(  "Company Website:- "
                            "${data.website}",

                          style: TextStyle(color: Colors.black),


                        ),
                      ),
                    ),
                  ),


                  SizedBox(width: 5,),


                ],
              ),


              RaisedButton(


                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),

                color: Colors.blue,
                child: Text("Warranty Card",
                  style: TextStyle(fontSize: 18, color: Colors.white),),
              ),
              RadioListTile(
                value: 1,
                groupValue: selectedRadioTile,
                title: Text("PDF"),
                //subtitle: Text("Upload PDF File"),
                /*  onChanged: (val) {
                        filePicker(context);
                      },*/
                activeColor: Colors.red,


              ),

              Padding(padding: EdgeInsets.only(top: 15)),

              //  _buildPDF1Field(context),



              PDF.network(
                data.wcpdfUrl != null
                    ? data.wcpdfUrl
                    : '',

                width: 600,
                height: 1000,     placeHolder: Image.asset("assets/images/pdf.png",
                  height: 600, width: 500),
              ),
              SizedBox(height: 24),


              RadioListTile(
                value: 2,
                groupValue: selectedRadioTile,
                title: Text("Image"),
                //subtitle: Text("Upload W Card Image"),
                /* onChanged: (val) {
                        openWCImagePickerModal(context);
                        //_startWCUpload();
                      },*/
                activeColor: Colors.blue,


              ),

              Padding(padding: EdgeInsets.only(top: 15)),

              Image.network(
                data.wcimgUrl != null
                    ? data.wcimgUrl
                    : 'https://www.testingxperts.com/wp-content/uploads/2019/02/placeholder-img.jpg',
                width: 500,
                height: 500,

              ),



              SizedBox(height: 24),
              SizedBox(height: 10,),

              Padding(padding: EdgeInsets.only(top: 15)),
              /*Container(
                    child: imageFile2==null?
                    FlatButton(
                        onPressed: (){
                          openWCImagePickerModal(context);
                        },
                        child: Icon(Icons.add_a_photo,size: 80,color: Colors.blueGrey,)
                    ):
                    Image.file(imageFile2,width: 200,height: 100,),
                  ),*/

              SizedBox(height: 10,),



              /* _uploaded2 == false?Container():*/
              /*    RaisedButton(child:Text("Download Image"),
                    /*  onPressed:(){ downloadImage2();},*/),*/

              /*     _downloadUrl2==null?Container():Image.network(_downloadUrl2),*/

              RaisedButton(

                onPressed: () {
                  Fluttertoast.showToast(
                    msg: "Upload User Guide",
                    gravity: ToastGravity.CENTER,
                    toastLength: Toast.LENGTH_LONG,
                    // timeInSecForIosWeb: 2
                  );

                  // startUpload();

                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                // color: Color(0xffff2fc3),
                color: Colors.blue,
                child: Text("User Guide",
                  style: TextStyle(fontSize: 18, color: Colors.white),),
              ),
              RadioListTile(
                value: 1,
                groupValue: selectedRadioTile,
                title: Text("PDF"),
                //subtitle: Text("Upload PDF File"),
                /* onChanged: (val) {
                      filePicker2(context);
                    },*/
                activeColor: Colors.red,


              ),
              Padding(padding: EdgeInsets.only(top: 15)),

              // _buildPDF2Field(context),

              PDF.network(
                data.ugpdfUrl != null
                    ? data.ugpdfUrl
                    : '',
                width: 600,
                height: 1000,     placeHolder: Image.asset("assets/images/pdf.png",
                  height: 600, width: 500),
              ),


              SizedBox(height: 24),













              RadioListTile(
                value: 2,
                groupValue: selectedRadioTile,
                title: Text("Image"),
                //subtitle: Text("Upload W Card Image"),
                /*  onChanged: (val) {
                        openUGImagePickerModal(context);
                        //_startUGUpload();
                      },*/
                activeColor: Colors.blue,


              ),

              Padding(padding: EdgeInsets.only(top: 15)),



              Image.network(
                data.ugimgUrl != null
                    ? data.ugimgUrl
                    : '',
                width: 500,
                height: 500,

              ),



              SizedBox(height: 16),

            ],
          ),
        ),

      ),
    );

  }


}
