import 'package:SafaiSathi/notifier/bookingNotifier.dart';
import 'package:SafaiSathi/screens/bookingForm.dart';
import 'package:SafaiSathi/services.dart';
import 'package:flutter/material.dart';
import '../NavDrawer.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  void initState() {
    BookingsNotifier bookingsNotifier =
        Provider.of<BookingsNotifier>(context, listen: false);
    getBookings(bookingsNotifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //AuthNotifier authNotifier = Provider.of<AuthNotifier>(context);
    BookingsNotifier bookingsNotifier = Provider.of<BookingsNotifier>(context);
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text(
          'Welcome Urban Dweller',
          style: TextStyle(
            fontSize: 20,
            fontStyle: FontStyle.italic,
          ),
        ),
        backgroundColor: Colors.green,
        elevation: 0,
        actions: [
          CircleAvatar(
            //maxRadius: 20,
            minRadius: 25,
            backgroundImage: AssetImage(
              "assets/images/Project_With_EFG_Logo_Copy.png",
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.green[100],
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 40,
              ),
              Card(
                margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 8.0,
                shadowColor: Colors.black,
                color: Colors.green[100],
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Book your service with safai sathi',
                    style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontSize: 30,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Card(
                margin: EdgeInsets.fromLTRB(15, 20, 15, 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Colors.green[100],
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'The services, that we are currently providing..',
                    style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontSize: 25,
                        fontWeight: FontWeight.w200),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              FlatButton(
                onPressed: () {
                  bookingsNotifier.currentBookings = null;
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (BuildContext context) {
                      return BookingsForm(
                        isUpdating: false,
                      );
                    }),
                  );
                },
                child: Card(
                  margin: EdgeInsets.fromLTRB(15, 0, 15, 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 8.0,
                  shadowColor: Colors.black,
                  color: Colors.green[100],
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      '1) Clean your home trash',
                      style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: 20,
                          color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              FlatButton(
                onPressed: () {
                  bookingsNotifier.currentBookings = null;
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (BuildContext context) {
                      return BookingsForm(
                        isUpdating: false,
                      );
                    }),
                  );
                },
                child: Card(
                  margin: EdgeInsets.fromLTRB(15, 0, 15, 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 8.0,
                  shadowColor: Colors.black,
                  color: Colors.green[100],
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      '2) Clean your water tank  ',
                      style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: 20,
                          color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              FlatButton(
                onPressed: () {
                  bookingsNotifier.currentBookings = null;
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (BuildContext context) {
                      return BookingsForm(
                        isUpdating: false,
                      );
                    }),
                  );
                },
                child: Card(
                  margin: EdgeInsets.fromLTRB(15, 0, 15, 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 8.0,
                  shadowColor: Colors.black,
                  color: Colors.green[100],
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      '3) Clean your Household  ',
                      style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: 20,
                          color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Card(
                margin: EdgeInsets.fromLTRB(15, 20, 15, 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Colors.green[100],
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Kindly after going to the booking page type one from the given services',
                    style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontSize: 25,
                        fontWeight: FontWeight.w200),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
