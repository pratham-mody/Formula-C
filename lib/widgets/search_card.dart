import 'package:flutter/material.dart';
import 'package:flutter_foodybite/screens/home.dart';
//import 'package:flutter_foodybite/screens/maps.dart';
// import 'package:your_app_name/maps.dart'; // Import your maps.dart file

class SearchCard extends StatefulWidget {
  @override
  State<SearchCard> createState() => _SearchCardState();
}

class _SearchCardState extends State<SearchCard> {
  final TextEditingController _searchControl = TextEditingController();
  late PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6.0,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
        ),
        child: TextButton(
          onPressed: () {
            Navigator.push(
              context,
<<<<<<< HEAD
              MaterialPageRoute(
                  builder: (context) => Home()), // Navigate to Maps.dart
=======
              MaterialPageRoute(builder: (context) => MapSample()), // Navigate to Maps.dart
>>>>>>> eb816de22804b604a26fb7e880bcae8d8cb4412b
            );
          },
          child: TextField(
            style: TextStyle(
              fontSize: 15.0,
              color: Colors.black,
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(5.0),
              ),
              hintText: "Search..",
              prefixIcon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              suffixIcon: Icon(
                Icons.filter_list,
                color: Colors.black,
              ),
              hintStyle: TextStyle(
                fontSize: 15.0,
                color: Colors.black,
              ),
            ),
            maxLines: 1,
            controller: _searchControl,
          ),
        ),
      ),
    );
  }
}
