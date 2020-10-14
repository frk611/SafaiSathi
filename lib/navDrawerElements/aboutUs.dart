import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
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
          'About Our Organization',
          style: TextStyle(
            fontSize: 20,
            fontStyle: FontStyle.italic,
          ),
        ),
        elevation: 0,
        /*actions: [
          CircleAvatar(
            backgroundImage: AssetImage(
              "assets/images/Project_With_EFG_Logo_Copy.png",
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
                height: 5,
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
                    'EFG (Environment for Future Generation)',
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
                height: 20,
              ),
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
                height: 10,
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
                    'Environment for Future Generation (EFG) is a group of academicians, scholars, and students who preferred to be identified by a single name - environment enthusiastic. The sole aim of EFG is protection of environment and ecology by means of activity controlling various kinds of pollution.',
                    style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontSize: 16,
                    ),
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
                    'EFG has its base in Berhampore, Murshidabad, West Bengal and has begun working in the locality since 2019. On each Sunday the volunteers gather and participate collectively in various forms of the campaign against environmental pollution control. The first project taken up by EFG is "Our Bhagirathi, Our Future", which aims at cleaning the Bhagirathi river and its banks of all pollutants, especially the single use waste plastic. This is an ongoing project which is being successfully and enthusiastically carried out by the EFG volunteers. ',
                    style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
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
                    "	We have has developed an android based smart waste management system named as ‘SAFAI SATHI’. It is a smart phone base platform to manage urban trashes. We also take action like waste related awareness campaign to combat plastic pollution in our locality.",
                    style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontSize: 16,
                        color: Colors.black),
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
                    "Not only cleaning the environment of the polluting elements, but also try to replenishment anthropogenic ecological syndrome by planting trees. EFG have identified the fallow lands in Murshidabad district applying sophisticate GIS tools and satellite imageries, and then carrying out ‘Fill the Fallow’ tree plantation campaign in a systematic way.",
                    style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontSize: 16,
                        color: Colors.black),
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
                    "Our Vision:\n1.Recruit a bigger number of volunteers to succeed the projects on larger scales.\n2.Collaboration with national as well as international organization. ",
                    style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontSize: 16,
                        color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
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
                    'Why Safai Sathi?',
                    style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
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
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
