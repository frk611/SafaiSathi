import 'package:SafaiSathi/notifier/bookingNotifier.dart';
import 'package:SafaiSathi/screens/bookingDetail.dart';
import 'package:SafaiSathi/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Feed extends StatefulWidget {
  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  @override
  void initState() {
    BookingsNotifier bookingsNotifier =
        Provider.of<BookingsNotifier>(context, listen: false);
    getBookings(bookingsNotifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    BookingsNotifier bookingsNotifier = Provider.of<BookingsNotifier>(context);

    Future<void> _refreshList() async {
      getBookings(bookingsNotifier);
    }

    print("building Feed");
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
        backgroundColor: Colors.green,
        title: Text(
          'Pending Bookings',
          style: TextStyle(
            fontSize: 20,
            fontStyle: FontStyle.italic,
          ),
        ),
        /*actions: <Widget>[
          CircleAvatar(
            backgroundImage: AssetImage(
              "assets/images/Logo1.png",
            ),
          ),
        ],*/
      ),
      body: new RefreshIndicator(
        child: Container(
          color: Colors.green[100],
          child: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: Image.network(
                  bookingsNotifier.bookingsList[index].image != null
                      ? bookingsNotifier.bookingsList[index].image
                      : 'https://www.testingxperts.com/wp-content/uploads/2019/02/placeholder-img.jpg',
                  width: 120,
                  fit: BoxFit.fitWidth,
                ),
                title: Text(bookingsNotifier.bookingsList[index].type),
                subtitle: Text(bookingsNotifier.bookingsList[index].location),
                onTap: () {
                  bookingsNotifier.currentBookings =
                      bookingsNotifier.bookingsList[index];
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return BookingsDetail();
                  }));
                },
              );
            },
            itemCount: bookingsNotifier.bookingsList.length,
            separatorBuilder: (BuildContext context, int index) {
              return Divider(
                color: Colors.black,
              );
            },
          ),
        ),
        onRefresh: _refreshList,
      ),
    );
  }
}
