import 'package:flutter/material.dart';
// this class you can use everywhere in you app.
// just return AppIconData() <-
class AppIconData{

  // if you wanna use more static data just put here or create new class
  List<KeyValueModel> dataIcon=[


    KeyValueModel(key: 'Mobiles', value: "0xe9f6"),
    KeyValueModel(key: 'Mobile Accessories', value: "0xe7a9"),
    KeyValueModel(key: 'Computers', value:"0xe676" ),
    KeyValueModel(key: 'Televisions', value: "0xea9e"),
    KeyValueModel(key: 'Large Appliances', value:"0xe82d" ),
    KeyValueModel(key: 'Kitchen Appliances', value:" 0xe7f7" ),

    KeyValueModel(key: 'Home Appliances', value:"0xe7ba" ),
    KeyValueModel(key: 'Home Entertainment Systems', value:" 0xe6b2" ),

    KeyValueModel(key: 'Head Phones', value:" 0xe7aa" ),
    KeyValueModel(key: 'Cameras', value:" 0xe62f" ),
    KeyValueModel(key: 'Speakers', value:" 0xea06" ),

    KeyValueModel(key: 'Camera Accessories', value:" 0xe633" )


    // KeyValueModel(key:'Televisions', value: Icons.tv),
    // KeyValueModel(key:'Large Appliances', value: Icons.local_laundry_service),
    // KeyValueModel(key:'Kitchen Appliances', value: Icons.kitchen),
    // KeyValueModel(key:'Home Appliances', value: Icons.home),
    // KeyValueModel(key:'Home Entertainment Systems', value: Icons.devices_other),
    // KeyValueModel(key:'Head Phones', value: Icons.headset_mic),
    // KeyValueModel(key:'Cameras', value: Icons.photo_camera),
    // KeyValueModel(key:'Speakers', value: Icons.speaker),
    // KeyValueModel(key:'Camera Accessories', value: Icons.camera_roll),

  ];


}

class KeyValueModel{
  String key;
  String value;

  KeyValueModel({this.key, this.value});
}