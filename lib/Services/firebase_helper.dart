import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'firebase.dart';

class firebaseHelper {
  User getCurrentUser() {
    User user = firebaseAuth.currentUser;
    return user;
  }

  createNewCategory({String name, String icon, User user,}) async {
     catRef.doc().set(
       {
         'name': name,
         'icon_name':icon,
         'owner': firebaseAuth.currentUser.uid.toString(),
         'date_created':Timestamp.now(),
       }
     );
  }

  createNewSubCategory({String name, String icon, String userID, String uuid, String mainCategoryID})async{
    subCatRef.doc().set({
      'parent_id':mainCategoryID,
      'name':name,
      "icon":icon,
      'owner': firebaseAuth.currentUser.uid.toString(),
      'date_created':Timestamp.now(),
    });
  }
}
