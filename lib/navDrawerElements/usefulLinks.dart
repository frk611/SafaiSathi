import 'package:flutter/material.dart';
import 'package:linkable/linkable.dart';

class UsefulLinks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
        backgroundColor: Colors.green,
        shadowColor: Colors.black,
        title: Text(
          'Connect Over Social Media',
          style: TextStyle(
            fontSize: 20,
            fontStyle: FontStyle.italic,
          ),
        ),
        elevation: 0,
        /*actions: [
          CircleAvatar(
            backgroundImage: AssetImage(
              "assets/images/Logo1.png",
            ),
          ),
        ],*/
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.green[100],
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              /*Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 8.0,
                shadowColor: Colors.black,
                color: Colors.green[100],
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Why Safai Sathi?',
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: Colors.purple),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 8.0,
                shadowColor: Colors.black,
                color: Colors.green[100],
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    '1.Easy to sell from your smart phone.\n\n2.We promote to segregate trashes at your home.\n\n3.Standard price of trashes.\n\n4.Instant cash from trash.\n\n5.Win eco-coin and get a delightful gift.\n\n6.More Reliable ',
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),*/
              /*Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 8.0,
              shadowColor: Colors.black,
              color: Colors.green[100],
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Check Us Out On Social Media Platforms',
                  style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ),
            ),*/
              Container(
                child: CircleAvatar(
                  radius: 120,
                  backgroundColor: Colors.green,
                  child: Padding(
                    padding: EdgeInsets.all(2),
                    child: Image(
                      image: AssetImage('assets/images/Logo1.png'),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Colors.green[100],
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Linkable(
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                    text:
                        "Mail us: efg.2k20@gmail.com \n \n Visit our website: www.efgindia.in\n\nPoke us on our Facebook page: https://www.facebook.com/EFG-Environment-for-Future-Generation-111191320480361\n\nFollow our Twitter handle: https://twitter.com/efg_envs_2k20 \n \n Subscribe to our YouTube channel: https://www.youtube.com/channel/UCOK7n0Q0t_qmWlX45qoB0GA",
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
