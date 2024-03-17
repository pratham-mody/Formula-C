import 'package:flutter/material.dart';

class ReviewPage extends StatefulWidget {
  @override
  _ReviewPageState createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  int ratingRide = 0;
  int ratingComfort = 0;
  int ratingProfessionalism = 0;

  List<Map<String, dynamic>> customerReviews = [
    {
      'image': 'assets/cm1.jpeg',
      'rating': 4,
      'review': 'Great service, on-time delivery.'
    },
    {
      'image': 'assets/cm2.jpeg',
      'rating': 5,
      'review': 'Excellent communication and professional staff.'
    },
    {
      'image': 'assets/cm3.jpeg',
      'rating': 3,
      'review': 'Average experience, could be better.'
    },
    {
      'image': 'assets/cm4.jpeg',
      'rating': 5,
      'review': 'Amazing service, highly recommended!'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Profile', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            onPressed: () {
              // Navigate to SettingsPage when settings icon is pressed           
            },
            icon: Icon(Icons.reviews),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'How was your ride?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                5,
                (index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      ratingRide = index + 1;
                    });
                  },
                  child: Icon(
                    Icons.star,
                    color: index < ratingRide
                        ? Colors.yellow
                        : Colors.grey,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Was carpool comfortable?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                5,
                (index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      ratingComfort = index + 1;
                    });
                  },
                  child: Icon(
                    Icons.star,
                    color: index < ratingComfort
                        ? Colors.yellow
                        : Colors.grey,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Was Driver prompt and professional in his behavior?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                5,
                (index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      ratingProfessionalism = index + 1;
                    });
                  },
                  child: Icon(
                    Icons.star,
                    color: index < ratingProfessionalism
                        ? Colors.yellow
                        : Colors.grey,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Submit the review
              },
              child: Text('Submit'),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (var review in customerReviews)
                  InkWell(
                    onTap: () {
                      // Show customer review
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: Text('Customer Review'),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CircleAvatar(
                                radius: 40,
                                backgroundImage: AssetImage(review['image']),
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: List.generate(
                                  review['rating'],
                                  (index) => Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(review['review']),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('Close'),
                            ),
                          ],
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundImage: AssetImage(review['image']),
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: List.generate(
                            review['rating'],
                            (index) => Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}