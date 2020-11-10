import 'dart:io';
import 'package:SafaiSathi/model/booking.dart';
import 'package:SafaiSathi/notifier/bookingNotifier.dart';
import 'package:SafaiSathi/services.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class BookingsForm extends StatefulWidget {
  final bool isUpdating;

  BookingsForm({@required this.isUpdating});

  @override
  _BookingsFormState createState() => _BookingsFormState();
}

class _BookingsFormState extends State<BookingsForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List _subingredients = [];
  Bookings _currentBookings;
  String _imageUrl;
  File _imageFile;
  TextEditingController subingredientController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    BookingsNotifier bookingsNotifier =
        Provider.of<BookingsNotifier>(context, listen: false);

    if (bookingsNotifier.currentBookings != null) {
      _currentBookings = bookingsNotifier.currentBookings;
    } else {
      _currentBookings = Bookings();
    }

    _subingredients.addAll(_currentBookings.trash);
    _imageUrl = _currentBookings.image;
  }

  _showImage() {
    if (_imageFile == null && _imageUrl == null) {
      return Text(
          "Open map and take a screenshot of your current location\n for more precise accumulation",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400));
    } else if (_imageFile != null) {
      print('showing image from local file');

      return Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: <Widget>[
          Image.file(
            _imageFile,
            fit: BoxFit.cover,
            height: 250,
          ),
          FlatButton(
            padding: EdgeInsets.all(16),
            color: Colors.black54,
            child: Text(
              'Change Image',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w400),
            ),
            onPressed: () => _getLocalImage(),
          )
        ],
      );
    } else if (_imageUrl != null) {
      print('showing image from url');

      return Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: <Widget>[
          Image.network(
            _imageUrl,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
            height: 250,
          ),
          FlatButton(
            padding: EdgeInsets.all(16),
            color: Colors.black54,
            child: Text(
              'Change Image',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w400),
            ),
            onPressed: () => _getLocalImage(),
          )
        ],
      );
    }
  }

  _getLocalImage() async {
    File imageFile = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50, maxWidth: 400);

    if (imageFile != null) {
      setState(() {
        _imageFile = imageFile;
      });
    }
  }

  Widget _buildNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Display name'),
      initialValue: _currentBookings.name,
      keyboardType: TextInputType.text,
      style: TextStyle(fontSize: 20),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Name is required';
        }

        if (value.length < 3 || value.length > 20) {
          return 'Please enter your display name';
        }

        return null;
      },
      onSaved: (String value) {
        _currentBookings.name = value;
      },
    );
  }

  Widget _buildTypeField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Service Type'),
      initialValue: _currentBookings.type,
      keyboardType: TextInputType.text,
      style: TextStyle(fontSize: 20),
      validator: (String value) {
        if (value.isEmpty) {
          return 'This is required';
        }

        if (value.length < 8 || value.length > 30) {
          return 'Choose from the given services';
        }

        return null;
      },
      onSaved: (String value) {
        _currentBookings.type = value;
      },
    );
  }

  Widget _buildLocationField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Location'),
      initialValue: _currentBookings.location,
      keyboardType: TextInputType.text,
      style: TextStyle(fontSize: 20),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Location is required';
        }

        if (value.length < 3 || value.length > 100) {
          return 'Enter a descriptive location';
        }

        return null;
      },
      onSaved: (String value) {
        _currentBookings.location = value;
      },
    );
  }

  Widget _buildNumberField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Number'),
      initialValue: _currentBookings.phNumber,
      keyboardType: TextInputType.text,
      style: TextStyle(fontSize: 20),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Number is required';
        }

        if (value.length < 6 || value.length > 11) {
          return 'Enter a valid number';
        }

        return null;
      },
      onSaved: (String value) {
        _currentBookings.phNumber = value;
      },
    );
  }

  _buildSubingredientField() {
    return SizedBox(
      width: 200,
      child: TextField(
        controller: subingredientController,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(labelText: 'Trash Types'),
        style: TextStyle(fontSize: 20),
      ),
    );
  }

  _onBookingsUploaded(Bookings bookings) {
    BookingsNotifier bookingsNotifier =
        Provider.of<BookingsNotifier>(context, listen: false);
    bookingsNotifier.addBookings(bookings);
    Navigator.pop(context);
  }

  _addSubingredient(String text) {
    if (text.isNotEmpty) {
      setState(() {
        _subingredients.add(text);
      });
      subingredientController.clear();
    }
  }

  _saveBookings() {
    print('saveFood Called');
    if (!_formKey.currentState.validate()) {
      return;
    }

    _formKey.currentState.save();

    print('form saved');

    _currentBookings.trash = _subingredients;

    uploadBookingsAndImage(
        _currentBookings, widget.isUpdating, _imageFile, _onBookingsUploaded);

    print("type: ${_currentBookings.type}");
    print("name:  ${_currentBookings.name}");
    print("location: ${_currentBookings.location}");
    print("phNumber: ${_currentBookings.phNumber.toString()}");
    print("trash: ${_currentBookings.trash.toString()}");
    print("_imageFile ${_imageFile.toString()}");
    print("_imageUrl $_imageUrl");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          'Booking Form',
          style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.green[100],
          child: Padding(
            padding: EdgeInsets.all(35),
            child: Form(
              key: _formKey,
              autovalidate: true,
              child: Column(
                children: <Widget>[
                  _showImage(),
                  SizedBox(height: 16),
                  Text(
                    widget.isUpdating ? "Edit Booking" : "Create Booking",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 16),
                  _imageFile == null && _imageUrl == null
                      ? ButtonTheme(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          child: RaisedButton(
                            onPressed: () => _getLocalImage(),
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                'Add image',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        )
                      : SizedBox(height: 0),
                  _buildNameField(),
                  _buildTypeField(),
                  _buildLocationField(),
                  _buildNumberField(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      _buildSubingredientField(),
                      ButtonTheme(
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          child: Text('Add',
                              style: TextStyle(color: Colors.white)),
                          onPressed: () =>
                              _addSubingredient(subingredientController.text),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 16),
                  GridView.count(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    padding: EdgeInsets.all(8),
                    crossAxisCount: 3,
                    crossAxisSpacing: 4,
                    mainAxisSpacing: 4,
                    children: _subingredients
                        .map(
                          (ingredient) => Card(
                            color: Colors.black54,
                            child: Center(
                              child: Text(
                                ingredient,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          FocusScope.of(context).requestFocus(new FocusNode());
          _saveBookings();
        },
        child: Text('Save'),
        foregroundColor: Colors.white,
      ),
    );
  }
}
