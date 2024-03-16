import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_foodybite/screens/categories.dart';
import 'package:flutter_foodybite/screens/trending.dart';
import 'package:flutter_foodybite/util/categories.dart';
import 'package:flutter_foodybite/util/friends.dart';
import 'package:flutter_foodybite/util/restaurants.dart';
import 'package:flutter_foodybite/widgets/category_item.dart';
import 'package:flutter_foodybite/widgets/circle_indicator.dart';
import 'package:flutter_foodybite/widgets/halfcirclepainter.dart';
// import 'package:flutter_foodybite/widgets/circle_indicator.dart';
import 'package:flutter_foodybite/widgets/search_card.dart';
import 'package:flutter_foodybite/widgets/slide_item.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
   GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  circleIndicator(BuildContext context){
    return Scaffold(
      body: Container(
        width: 150,
        height: 300,
        child: Center(
          child: SfRadialGauge(
            axes: <RadialAxis>[
              // Create primary radial axis
                RadialAxis(
                        showLabels: false,
                        showTicks: false,
                        startAngle: 180,
                        endAngle: 0,
                        radiusFactor: 0.7,
                        canScaleToFit: true,
                        axisLineStyle: AxisLineStyle(
                          thickness: 0.1,
                          color: const Color.fromARGB(30, 0, 169, 181),
                          thicknessUnit: GaugeSizeUnit.factor,
                          cornerStyle: CornerStyle.startCurve,
                        ),
                        pointers: <GaugePointer>[
                          RangePointer(
                              value: 45,
                              width: 0.1,
                              sizeUnit: GaugeSizeUnit.factor,
                              cornerStyle: CornerStyle.bothCurve)
                        ],
              ),
              // Create secondary radial axis for segmented line         
            ],
          ),
        ),
      ),
    );
  }

  // buildRestaurantRow(String restaurant, BuildContext context) {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //     children: <Widget>[
  //       Text(
  //         "$restaurant",
  //         style: TextStyle(
  //           fontSize: 20.0,
  //           fontWeight: FontWeight.w800,
  //         ),
  //       ),
  //       // TextButton(
  //       //   child: Text(
  //       //     "See all (9)",
  //       //     style: TextStyle(
  //       //       color: Theme.of(context).colorScheme.secondary,
  //       //     ),
  //       //   ),
  //       //   onPressed: () {
  //       //     Navigator.push(
  //       //       context,
  //       //       MaterialPageRoute(
  //       //         builder: (BuildContext context) {
  //       //           return Trending();
  //       //         },
  //       //       ),
  //       //     );
  //       //   },
  //       // ),
  //     ],
  //   );
  // }

  buildCategoryRow(String category, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "$category",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w800,
          ),
        ),
        TextButton(
          child: Text(
            "See all (9)",
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return Categories();
                },
              ),
            );
          },
        ),
      ],
    );
  }

  buildSearchBar(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
        child: SearchCard()
    );
  }

  buildCategoryList(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 6,
      child: ListView.builder(
        primary: false,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: categories == 0 ? 0 : categories.length,
        itemBuilder: (BuildContext context, int index) {
          Map cat = categories[index];

          return CategoryItem(
            cat: cat,
          );
        },
      ),
    );
  }

  buildRestaurantList(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2.4,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        primary: false,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: restaurants == 0 ? 0 : restaurants.length,
        itemBuilder: (BuildContext context, int index) {
          Map restaurant = restaurants[index];

          return Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: SlideItem(
              img: restaurant["img"],
              title: restaurant["title"],
              address: restaurant["address"],
              rating: restaurant["rating"], key: UniqueKey(),
            ),
          );
        },
      ),
    );
  }

  buildFriendsList() {
    return Container(
      height: 50.0,
      child: ListView.builder(
        primary: false,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: friends == 0 ? 0 : friends.length,
        itemBuilder: (BuildContext context, int index) {
          String img = friends[index];

          return Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: CircleAvatar(
              backgroundImage: AssetImage(
                img,
              ),
              radius: 25.0,
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScopeNode currentFocus = FocusScope.of(context);
        if(!currentFocus.hasPrimaryFocus){
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        key: _scaffoldKey,
      appBar: AppBar(
        title: Row(
          children: [
            Text('CarPool',style: TextStyle(color: Colors.white),),
            SizedBox(width: 8,),
            // Text(_username),
          ],
        ),
          leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
      ),
      drawer: Drawer(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        UserAccountsDrawerHeader(
          decoration: BoxDecoration(color: Colors.blue),
          currentAccountPicture: CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(Ionicons.person)
          ),
          accountName: Text("he"),
          accountEmail: Text("as"),
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Settings'),
          subtitle: Text('Manage your app settings'),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            // Navigate to the settings page.
          },
        ),
        ListTile(
          leading: Icon(Icons.help),
          title: Text('Help'),
          subtitle: Text('Get help and support'),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            // Navigate to the help page.
          },
        ),
         ListTile(
          leading: Icon(Icons.exit_to_app),
            onTap: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              SharedPreferences prefs2 = await SharedPreferences.getInstance();
              prefs.remove('name');
              prefs2.remove('email');
              Navigator.pushReplacementNamed(context, '/');
            },
          title: Text('Exit'),
          subtitle: Text('Signout'),
          trailing: Icon(Icons.arrow_forward_ios),
          onLongPress: () {
            // Navigate to the help page.
          },
        ),
      ],
    ),
  ),
        body:Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
          child: ListView(
            children: <Widget>[
              buildSearchBar(context),
              SizedBox(height: 20.0),
             Text(
          "Performace",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w800,
          ),
        ),
           Row(
          children: [
                        Column(
                          children: [
                            Container(
                              height: 100,
                              width: 200,
                              child: CircleIndicator(),
                            ),
                            SizedBox(height: 10), // Adding some space between the chart and the text
                            Text(
                              'Emissions Saved',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(width: 20), // Adding space between the two circles
                        Stack(
                          children: [
                              Column(
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.green, width: 2), // Green border
                          ),
                          child: Center(
                            child: Text(
                              '70', // Your price value here
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.green, // Color of the text
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10), // Adding some spacing between the circle and the text
                        Text(
                          'Money Saved',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ],
                    )
                      
                          ],
                        ),
                  ],
),
              SizedBox(height: 50.0),
              Container(
                // height: 100,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green), // Border color
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                ),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Column(
        children: [
          Icon(Ionicons.car_sport), // Car icon
          SizedBox(height: 5),
          Text('My Car'), // Text below the car icon
        ],
      ),
      VerticalDivider(), // Divider line
      Column(
        children: [
          Row(
            children: [
              Container(
                height: 30,
                width: 30,
                child: Icon(Icons.directions_car), // Car icon
              ),
              SizedBox(width: 5),
              Text('Ride Along'), // Text beside the car icon
            ],
          ),
          SizedBox(height: 5),       
        ],
      ),
    ],
  ),
),

              // buildRestaurantList(context),
              SizedBox(height: 10.0),
              buildCategoryRow('Achievements', context),
              SizedBox(height: 10.0),
              buildCategoryList(context),
              SizedBox(height: 20.0),
              buildCategoryRow('Friends', context),
              SizedBox(height: 10.0),
              buildFriendsList(),
              SizedBox(height: 30.0),           
            ],
          ),
        ),
      ),
    );
  }
}
