import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:hotel_wave/features/models/hotel_model/hotel_model.dart';

class FirebaseServices {
  static late FirebaseAuth _auth;
  static late FirebaseFirestore _db;
  static late FirebaseStorage _storage;

  static late User? user;

  static init() {
    _auth = FirebaseAuth.instance;
    _db = FirebaseFirestore.instance;
    _storage =
        FirebaseStorage.instanceFor(bucket: 'gs://hotel-wave.appspot.com');
    _getUser();
  }

  static logout() {
    _auth.signOut();
  }

  static Future<void> _getUser() async {
    user = _auth.currentUser;
  }

  static addToFav({
    required HotelModel model,
  }) async {
    await FirebaseFirestore.instance
        .collection('favourite-list')
        .doc(user?.uid)
        .set({
      model.id ?? '': model.toJson(),
    }, SetOptions(merge: true));
  }

  static deleteItemFromFav(hotelId) {
    FirebaseFirestore.instance.collection('favourite-list').doc(user?.uid).set({
      hotelId: FieldValue.delete(),
    }, SetOptions(merge: true));
  }
}
