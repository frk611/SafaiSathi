import 'package:SafaiSathi/navDrawerElements/aboutUs.dart';
import 'package:SafaiSathi/navDrawerElements/pendingBookings.dart';
import 'package:SafaiSathi/navDrawerElements/profilePage.dart';
import 'package:SafaiSathi/navDrawerElements/trashRate.dart';
import 'package:SafaiSathi/navDrawerElements/usefulLinks.dart';
import 'package:SafaiSathi/screens/pop-Up-One_Unauthorized.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NavDrawer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DrawerState();
}

class DrawerState extends State<NavDrawer> {
  @override
  Widget build(BuildContext context) {
    // BookingsNotifier bookingsNotifier = Provider.of<BookingsNotifier>(context);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(1.0),
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.green,
              boxShadow: null,
            ),
            child: DrawerHeader(
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/images/Project_With_EFG_Logo_Copy.png'),
                  ),
                  color: Colors.green[100],
                ),
              ),
            ),
          ),
          ListTile(
            title: Text(
              "PROFILE",
              style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.italic,
                  color: Colors.black),
            ),
            onTap: () {
              //bookingsNotifier.currentBookings = null;
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (BuildContext context) => ProfilePage()),
              );
            },
          ),
          ListTile(
            title: Text(
              "TRASH RATES",
              style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.italic,
                  color: Colors.black),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => TrashRate()));
            },
          ),
          ListTile(
            title: Text(
              "ABOUT US",
              style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.italic,
                  color: Colors.black),
            ),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AboutUs()));
            },
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            title: Text(
              "CONNECT OVER SOCIAL MEDIA",
              style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.italic,
                  color: Colors.black),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => UsefulLinks()));
            },
          ),
          SizedBox(height: 60),
          Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.green,
              boxShadow: null,
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.green[100],
                  ),
                  child: Text(
                    ' Only For Safai Sathis                  ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w800,
                        fontStyle: FontStyle.italic,
                        color: Colors.green),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 5,
            ),
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.green[100],
            ),
            child: Icon(
              Icons.arrow_downward,
              size: 30,
              color: Colors.green,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
              title: Text(
                "SAFAI SATHIS",
                style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.italic,
                    color: Colors.black),
              ),
              onTap: () {
                DrawerState().authorizeAdmin(context);
              }),
        ],
      ),
    );
  }

  authorizeAdmin(BuildContext context) async {
    final firebaseUser = await FirebaseAuth.instance.currentUser();
    if (firebaseUser != null)
      await Firestore.instance
          .collection('users')
          .document(firebaseUser.uid)
          .get()
          .then((ds) {
        if (ds.data['role'] == 'admin') {
          Navigator.push(
              context,
              new MaterialPageRoute(
                  builder: (BuildContext context) => new Feed()));
        } else {
          Navigator.of(context).push(
            MaterialPageRoute(
                builder: (BuildContext context) => UNauthorized()),
          );
        }
      });
  }
}
