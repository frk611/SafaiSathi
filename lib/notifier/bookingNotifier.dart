import 'dart:collection';
import 'package:SafaiSathi/model/booking.dart';
import 'package:flutter/cupertino.dart';

class BookingsNotifier with ChangeNotifier {
  List<Bookings> _bookingsList = [];
  Bookings _currentBookings;

  UnmodifiableListView<Bookings> get bookingsList =>
      UnmodifiableListView(_bookingsList);

  Bookings get currentBookings => _currentBookings;

  set bookingsList(List<Bookings> bookingsList) {
    _bookingsList = bookingsList;
    notifyListeners();
  }

  set currentBookings(Bookings bookings) {
    _currentBookings = bookings;
    notifyListeners();
  }

  addBookings(Bookings bookings) {
    _bookingsList.insert(0, bookings);
    notifyListeners();
  }

  deleteBookings(Bookings bookings) {
    _bookingsList.removeWhere((_bookings) => _bookings.id == bookings.id);
    notifyListeners();
  }
}
