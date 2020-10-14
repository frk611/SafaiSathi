import 'package:flutter/material.dart';

class TrashRate extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TrashRateState();
}

class TrashRateState extends State<TrashRate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text(
          'Eco Coins Chart (/kg)',
          style: TextStyle(
            fontSize: 25,
            fontStyle: FontStyle.italic,
          ),
        ),
        backgroundColor: Colors.green[400],
        elevation: 0,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.green[100],
            child: GridView.count(
              crossAxisCount: 2,
              padding: EdgeInsets.all(10),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: <Widget>[
                buildCard(
                  'Iron',
                  '1 Eco Coins',
                  'assets/images/Iron.jpeg',
                  context,
                ),
                buildCard(
                  'Aluminium',
                  '1 Eco Coins',
                  'assets/images/Aluminium.jpg',
                  context,
                ),
                buildCard(
                  'Battery',
                  '7 Eco Coins',
                  'assets/images/Battery.jpg',
                  context,
                ),
                buildCard(
                  'Brass',
                  '1 Eco Coins',
                  'assets/images/Brass.jpg',
                  context,
                ),
                buildCard(
                  'Broken Glass',
                  '4 Eco Coins',
                  'assets/images/Broken_Glass.jpg',
                  context,
                ),
                buildCard(
                  'Card Board',
                  '2 Eco Coins',
                  'assets/images/Card_Board.jpg',
                  context,
                ),
                buildCard(
                  'Copper',
                  '1 Eco Coins',
                  'assets/images/Copper.jpg',
                  context,
                ),
                buildCard(
                  'Glass Bottle',
                  '3 Eco Coins',
                  'assets/images/Glass_Bottle.jpg',
                  context,
                ),
                buildCard(
                  'Mixed Plastic',
                  '10 Eco Coins',
                  'assets/images/Mixed_Plastic.jpg',
                  context,
                ),
                buildCard(
                  'Old Exercise Book',
                  '2 Eco Coins',
                  'assets/images/Old_Exercise_Book.jpg',
                  context,
                ),
                buildCard(
                  'Printed Paper',
                  '2 Eco Coins',
                  'assets/images/Printed_Paper.jpg',
                  context,
                ),
                buildCard(
                  'Tin',
                  '1 Eco Coins',
                  'assets/images/Tin.jpeg',
                  context,
                ),
                buildCard(
                  'Old Shoe',
                  '5 Eco Coins',
                  'assets/images/Old_shoe.jpg',
                  context,
                ),
                buildCard(
                  'Single Used Plastic',
                  '10 Eco Coins',
                  'assets/images/Single_use_plastic.jpg',
                  context,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCard(
    String name,
    String price,
    String imgPath,
    context,
  ) {
    return Padding(
      padding: EdgeInsets.all(
        1,
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(80),
        ),
        color: Colors.green,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(80),
          ),
          child: Padding(
            padding: EdgeInsets.all(1),
            child: Column(
              children: <Widget>[
                Hero(
                  tag: imgPath,
                  child: CircleAvatar(
                    backgroundColor: Colors.green[100],
                    radius: 40,
                    child: Padding(
                      padding: EdgeInsets.all(18),
                      child: Image(
                        image: AssetImage(imgPath),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Text(
                  price,
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 12,
                  ),
                ),
                Text(
                  name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
