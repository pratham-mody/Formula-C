import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:formula_c/screens/Reviewpage.dart';
import 'package:formula_c/screens/achivements.dart';
import 'package:formula_c/util/categories.dart';
import 'package:formula_c/util/friends.dart';
import 'package:formula_c/widgets/category_item.dart';
import 'package:formula_c/widgets/circle_indicator.dart';
import 'package:formula_c/widgets/search_card.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late String _username = 'User';
  late String _email = '<EMAIL>';

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Row(
            children: [
              Text(
                'CarPool',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(width: 8),
              Text(_username),
            ],
          ),
          leading: IconButton(
            icon: Icon(Icons.car_rental),
            onPressed: () {
              // _scaffoldKey.currentState?.openDrawer();
            },
          ),
        ),
        body: Padding(
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
              Savings(),
              SizedBox(
                height: 30,
              ),
              pools(),
              SizedBox(height: 10.0),
              buildAchievementsRow('Achievements', context),
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

  Widget buildSearchBar(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
      child: SearchCard(),
    );
  }

  Widget buildCategoryRow(String category, BuildContext context) {
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
                  return ReviewPage();
                },
              ),
            );
          },
        ),
      ],
    );
  }

  Widget buildAchievementsRow(String category, BuildContext context) {
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
                  return AchievementsPage();
                },
              ),
            );
          },
        ),
      ],
    );
  }

  Widget buildCategoryList(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 6,
      child: ListView.builder(
        primary: false,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: achievements.length,
        itemBuilder: (BuildContext context, int index) {
          Map cat = achievements[index];

          return CategoryItem(
            cat: cat,
          );
        },
      ),
    );
  }

  Widget buildFriendsList() {
    return Container(
      height: 50.0,
      child: ListView.builder(
        primary: false,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: friends.length,
        itemBuilder: (BuildContext context, int index) {
          String img = friends[index];

          return Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: CircleAvatar(
              backgroundImage: AssetImage(img),
              radius: 25.0,
            ),
          );
        },
      ),
    );
  }
}

class pools extends StatelessWidget {
  const pools({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green), // Border color
        borderRadius: BorderRadius.circular(8), // Rounded corners
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Icon(Icons.directions_car), // Car icon
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
    );
  }
}

class Savings extends StatelessWidget {
  const Savings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [ // Added children property for Stack
                Container(
                  height: 100,
                  width: 200,
                  child: CircleIndicator(),
                ),
                Positioned(
                  bottom: 10,
                  child: Icon(
                    Ionicons.leaf, // Leaf icon
                    size: 30, // Adjust size as needed
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10), // Adding some space between the chart and the text
            Text(
              'Emissions ',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(width: 20), // Adding space between the two columns
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
                child: Column( // Changed Row to Column
                  children: [
                    Container(
                      height: 65,
                      width: 300,
                      child: CircleIndicator(),
                    ),
                    Text(
                      '70', // Your price value here
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20), // Adding some space between the circle and the text
            Text(
              'Emissions',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10), // Adding some spacing between the text and the next column
            Text(
              'Money Saved',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ],
        ),
      ],
    );
  }
}
