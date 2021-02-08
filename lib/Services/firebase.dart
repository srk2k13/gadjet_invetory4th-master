

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

FirebaseAuth firebaseAuth = FirebaseAuth.instance;
FirebaseFirestore firestore = FirebaseFirestore.instance;
FirebaseStorage storage = FirebaseStorage.instance;
final Uuid uuid = Uuid();


// References

CollectionReference usersRef = firestore.collection('users');
CollectionReference catRef = firestore.collection('category');
CollectionReference subCatRef = firestore.collection('sub_category');
CollectionReference items = firestore.collection('items');


// Storage ref

Reference storageDeviceDocs = storage.ref('DeviceDocs');
Reference storageDeviceImages = storage.ref('DeviceImages');