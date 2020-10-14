import 'dart:io';
import 'package:SafaiSathi/model/booking.dart';
import 'package:SafaiSathi/model/user.dart';
import 'package:SafaiSathi/navDrawerElements/pendingBookings.dart';
import 'package:SafaiSathi/notifier/authNotifier.dart';
import 'package:SafaiSathi/notifier/bookingNotifier.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:uuid/uuid.dart';

//bool loading = false;

login(User user, AuthNotifier authNotifier) async {
  AuthResult authResult = await FirebaseAuth.instance
      .signInWithEmailAndPassword(email: user.email, password: user.password)
      .catchError((error) => print(error.code));

  if (authResult != null) {
    FirebaseUser firebaseUser = authResult.user;

    if (firebaseUser != null) {
      print("Log In: $firebaseUser");
      authNotifier.setUser(firebaseUser);
    }
    /*else {
      Center(
        child: CircularProgressIndicator(),
      );
    }*/
  }
  /*else {
    Center(
      child: CircularProgressIndicator(),
    );
  }*/
}

signup(User user, AuthNotifier authNotifier) async {
  AuthResult authResult = await FirebaseAuth.instance
      .createUserWithEmailAndPassword(
          email: user.email, password: user.password)
      .catchError((error) => print(error.code));
  FirebaseUser firebaseuser = authResult.user;
  final CollectionReference userCollection =
      Firestore.instance.collection("users");
  await userCollection.document(firebaseuser.uid).setData({
    'displayName': user.displayName,
    'email': user.email,
    'password': user.password,
    'ecoCoins': user.ecoCoins,
    'role': user.role,
  });

  if (authResult != null) {
    UserUpdateInfo updateInfo = UserUpdateInfo();
    updateInfo.displayName = user.displayName;

    FirebaseUser firebaseUser = authResult.user;

    if (firebaseUser != null) {
      await firebaseUser.updateProfile(updateInfo);

      await firebaseUser.reload();

      print("Sign up: $firebaseUser");

      FirebaseUser currentUser = await FirebaseAuth.instance.currentUser();
      authNotifier.setUser(currentUser);
    }
    /*else {
      Center(
        child: CircularProgressIndicator(),
      );
    }*/
  }
  /*else {
    Center(
      child: CircularProgressIndicator(),
    );
  }*/
}

signout(AuthNotifier authNotifier) async {
  await FirebaseAuth.instance
      .signOut()
      .catchError((error) => print(error.code));

  authNotifier.setUser(null);
}

initializeCurrentUser(AuthNotifier authNotifier) async {
  FirebaseUser firebaseUser = await FirebaseAuth.instance.currentUser();

  if (firebaseUser != null) {
    print(firebaseUser);
    authNotifier.setUser(firebaseUser);
  }
}

authorizeAdmin(BuildContext context) {
  FirebaseAuth.instance.currentUser().then((user) {
    Firestore.instance
        .collection('users')
        .where('uid', isEqualTo: user.uid)
        .getDocuments()
        .then((docs) {
      if (docs.documents[0].exists) {
        if (docs.documents[0].data['role'] == 'admin') {
          Navigator.push(
              context,
              new MaterialPageRoute(
                  builder: (BuildContext context) => new Feed()));
        } else {
          print('Not Authorized');
        }
      }
    });
  });
}

getBookings(BookingsNotifier bookingsNotifier) async {
  QuerySnapshot snapshot = await Firestore.instance
      .collection('Bookings')
      .orderBy("createdAt", descending: true)
      .getDocuments();

  List<Bookings> _bookingsList = [];

  snapshot.documents.forEach((document) {
    Bookings bookings = Bookings.fromMap(document.data);
    _bookingsList.add(bookings);
  });

  bookingsNotifier.bookingsList = _bookingsList;
}

uploadBookingsAndImage(Bookings bookings, bool isUpdating, File localFile,
    Function bookingsUploaded) async {
  if (localFile != null) {
    print("uploading image");

    var fileExtension = path.extension(localFile.path);
    print(fileExtension);

    var uuid = Uuid().v4();

    final StorageReference firebaseStorageRef = FirebaseStorage.instance
        .ref()
        .child('bookings/images/$uuid$fileExtension');

    await firebaseStorageRef
        .putFile(localFile)
        .onComplete
        .catchError((onError) {
      print(onError);
      return false;
    });

    String url = await firebaseStorageRef.getDownloadURL();
    print("download url: $url");
    _uploadBookings(bookings, isUpdating, bookingsUploaded, imageUrl: url);
  } else {
    print('...skipping image upload');
    _uploadBookings(bookings, isUpdating, bookingsUploaded);
  }
}

_uploadBookings(Bookings bookings, bool isUpdating, Function bookingsUploaded,
    {String imageUrl}) async {
  CollectionReference bookingsRef = Firestore.instance.collection('Bookings');

  if (imageUrl != null) {
    bookings.image = imageUrl;
  }

  if (isUpdating) {
    bookings.updatedAt = Timestamp.now();

    await bookingsRef.document(bookings.id).updateData(bookings.toMap());

    bookingsUploaded(bookings);
    print('updated bookings with id: ${bookings.id}');
  } else {
    bookings.createdAt = Timestamp.now();

    DocumentReference documentRef = await bookingsRef.add(bookings.toMap());

    bookings.id = documentRef.documentID;

    print('uploaded bookings successfully: ${bookings.toString()}');

    await documentRef.setData(bookings.toMap(), merge: true);

    bookingsUploaded(bookings);
  }
}

deleteBookings(Bookings bookings, Function bookingsDeleted) async {
  if (bookings.image != null) {
    StorageReference storageReference =
        await FirebaseStorage.instance.getReferenceFromUrl(bookings.image);

    print(storageReference.path);

    await storageReference.delete();

    print('image deleted');
  }

  await Firestore.instance
      .collection('Bookings')
      .document(bookings.id)
      .delete();
  bookingsDeleted(bookings);
}
