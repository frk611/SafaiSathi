import 'package:flutter/material.dart';

class UNauthorized extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 300,
            ),
            Text(
              "This page is only for Safai Sathis to operate and give services. And you're not authorized to visit it.",
              style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.green),
              textAlign: TextAlign.center,
            ),
            IconButton(
                icon: Icon(Icons.arrow_back),
                color: Colors.green,
                onPressed: () {
                  Navigator.pop(context);
                }),
          ],
        ),
      ),
    );
  }
}
