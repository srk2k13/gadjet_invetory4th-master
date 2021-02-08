import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gadjet_invetory/Screens/subcategories/subcategories_page.dart';
import 'package:gadjet_invetory/Services/firebase.dart';

import 'add_category.dart';


class MainCategories extends StatefulWidget {
  @override
  _MainCategoriesState createState() => _MainCategoriesState();
}

class _MainCategoriesState extends State<MainCategories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blue,
          title: new Text("Gadget Inventory",
              style: TextStyle(fontSize: 20), textAlign: TextAlign.center),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.folder_open,
                size: 36,
                color: Colors.white,
              ),
              onPressed: () {},
            )
          ],
        ),
        body: StreamBuilder(
          stream: catRef
              .where('owner', isEqualTo: firebaseAuth.currentUser.uid)
              .snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> categories){
              if(!categories.hasData || categories.data.docs.length == 0){
                return Center(child: Text("there is no data yet. Pls add something"),);
              }
              if(categories.connectionState == ConnectionState.waiting){
                return Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.blue),
                  ),
                );
              }
              if(categories.connectionState == ConnectionState.none){
                return Center(
                  child: Text("No internet connection"),
                );
              }

              return Center(
                child: GridView.builder(gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1,
                ),
                    itemCount: categories.data.docs.length,
                    itemBuilder: (context, index) {
                     var icon = int.parse(categories.data.docs[index]['icon_name']);

                  return Container(
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => MainSubCategories(
                          categoryID: categories.data.docs[index].id,
                              title: categories.data.docs[index]['name'],
                        )));
                      },
                      child: Card(
                        elevation: 2,
                        margin: EdgeInsets.all(5.0),
                        //color: Colors.cyan[100],
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(20.0)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                            Icon(
                              // IconData(0xe9f6, fontFamily: "MaterialIcons"),

                              IconData(icon, fontFamily: "MaterialIcons"),
                              size: 90,
                            ),
                            SizedBox(height: 20),
                            Text(categories.data.docs[index]['name'],
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center),
                          ],
                        ),
                      ),
                    ),
                  );

                    }),
              );

          },
        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        mini: false,
        highlightElevation: 20.0,
        //shape: BeveledRectangleBorder(borderRadius:BorderRadius.all(Radius.circular(16.0)) ),
        onPressed: () {
          debugPrint("Add New Device Category");
          Navigator.push(context, MaterialPageRoute(
            builder: (_) => AddNewCategory(
            )
          ));
        },
        tooltip: 'Add Device Cattegorry',
        child: Icon(Icons.add),
      ),
    );
  }
}
