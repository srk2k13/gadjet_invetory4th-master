import 'package:flutter/material.dart';
import 'package:gadjet_invetory/Services/firebase_helper.dart';
import 'package:gadjet_invetory/const/Category_Icons.dart';


class AddNewSubCategory extends StatefulWidget {
  final parentCategoryID;

  const AddNewSubCategory({Key key, this.parentCategoryID}) : super(key: key);
  @override
  _AddNewSubCategoryState createState() => _AddNewSubCategoryState();
}

class _AddNewSubCategoryState extends State<AddNewSubCategory> {
  final TextEditingController name = TextEditingController();
  String dropdownValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Sub-Category"),
      ),
      backgroundColor: Colors.white,
      body: Container(
          padding: EdgeInsets.all(20),
          child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: TextField(
                        controller: name,
                        decoration: InputDecoration(
                            hintText: "Enter New Sub-category",
                            border: OutlineInputBorder())),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: DropdownButton<String>(
                        hint: Text('Select icon'),
                        value: dropdownValue,
                        icon: Icon(
                          Icons.arrow_downward,
                          size: 16,
                        ),
                        isExpanded: true,
                        iconSize: 12,
                        elevation: 16,
                        style: TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.lightBlueAccent,
                        ),
                        onChanged: (String newValue) {
                          setState(() => this.dropdownValue = newValue);
                        },
                        items: AppIconData()
                            .dataIcon
                            .map<DropdownMenuItem<String>>(
                                (data) => DropdownMenuItem(
                              child: Text(data.key),
                              value: data.value.toString(),
                            ))
                            .toList(),
                      ),
                    ),
                  ),
                  SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: RaisedButton(
                        onPressed: () {
                          if (name.text.isNotEmpty || dropdownValue == null) {
                            firebaseHelper().createNewSubCategory(
                              name: name.text,
                              icon:  dropdownValue,
                                mainCategoryID: widget.parentCategoryID
                              // icon: dropdownValue,
                            );

                            Navigator.pop(context);
                          }
                        },
                        child: Text("Add"),
                      ))
                ],
              ))),
    );
  }
}
