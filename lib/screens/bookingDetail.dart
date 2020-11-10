import 'package:SafaiSathi/model/booking.dart';
import 'package:SafaiSathi/notifier/bookingNotifier.dart';
import 'package:SafaiSathi/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'bookingForm.dart';

class BookingsDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BookingsNotifier bookingsNotifier = Provider.of<BookingsNotifier>(context);

    _onBookingsDeleted(Bookings bookings) {
      Navigator.pop(context);
      bookingsNotifier.deleteBookings(bookings);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          bookingsNotifier.currentBookings.type,
          style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            color: Colors.green[100],
            child: Column(
              children: <Widget>[
                Image.network(
                  bookingsNotifier.currentBookings.image != null
                      ? bookingsNotifier.currentBookings.image
                      : 'https://www.testingxperts.com/wp-content/uploads/2019/02/placeholder-img.jpg',
                  width: MediaQuery.of(context).size.width,
                  height: 250,
                  fit: BoxFit.fitWidth,
                ),
                SizedBox(
                  height: 24,
                ),
                Text(
                  bookingsNotifier.currentBookings.name,
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),

                /*Text(
                  'Booking type: ${bookingsNotifier.currentBookings.type}',
                  style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
                ),*/
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Location: ${bookingsNotifier.currentBookings.location}',
                  style: TextStyle(fontSize: 18, fontStyle: FontStyle.normal),
                ),
                SizedBox(height: 20),
                RaisedButton(
                  color: Colors.green[100],
                  child: Text(
                    'Number: ${bookingsNotifier.currentBookings.phNumber}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  onPressed: () => launch(
                      "tel://${bookingsNotifier.currentBookings.phNumber}"),
                  //style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Trash types",
                  style: TextStyle(
                      fontSize: 18, decoration: TextDecoration.underline),
                ),
                SizedBox(height: 16),
                GridView.count(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.all(8),
                  crossAxisCount: 3,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4,
                  children: bookingsNotifier.currentBookings.trash
                      .map(
                        (ingredient) => Card(
                          color: Colors.black54,
                          child: Center(
                            child: Text(
                              ingredient,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
                SizedBox(
                  height: 120,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            heroTag: 'button1',
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) {
                  return BookingsForm(
                    isUpdating: true,
                  );
                }),
              );
            },
            child: Icon(Icons.edit),
            foregroundColor: Colors.white,
          ),
          SizedBox(height: 20),
          /*FloatingActionButton(
            heroTag: 'button2',
            onPressed: () => deleteBookings(
                bookingsNotifier.currentBookings, _onBookingsDeleted),
            child: Icon(Icons.delete),
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
          ),*/
        ],
      ),
    );
  }
}
