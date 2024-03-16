import 'package:flutter/material.dart';

class Achievement {
  final String title;
  final String description;
  final String imagePath;

  Achievement({
    required this.title,
    required this.description,
    required this.imagePath,
  });
}

class AchievementsPage extends StatelessWidget {
  // Define your achievements
  final List<Achievement> achievements = [
    Achievement(
      title: "Achievement 1",
      description: "Description for achievement 1",
      imagePath: "assets/dark.png",
    ),
    Achievement(
      title: "Achievement 2",
      description: "Description for achievement 2",
      imagePath: "assets/2.png",
    ),
    Achievement(
      title: "Achievement 3",
      description: "Description for achievement 1",
      imagePath: "assets/3.png",
    ),
    Achievement(
      title: "Achievement 4",
      description: "Description for achievement 2",
      imagePath: "assets/4.png",
    ),
    Achievement(
      title: "Achievement 1",
      description: "Description for achievement 1",
      imagePath: "assets/5.png",
    ),
    Achievement(
      title: "Achievement 2",
      description: "Description for achievement 2",
      imagePath: "assets/6.png",
    ),
    Achievement(
      title: "Achievement 1",
      description: "Description for achievement 1",
      imagePath: "assets/7.png",
    ),
    Achievement(
      title: "Achievement 2",
      description: "Description for achievement 2",
      imagePath: "assets/8.png",
    ),
    Achievement(
      title: "Achievement 1",
      description: "Description for achievement 1",
      imagePath: "assets/13.png",
    ),
    Achievement(
      title: "Achievement 2",
      description: "Description for achievement 2",
      imagePath: "assets/15.png",
    ),
    Achievement(
      title: "Achievement 1",
      description: "Description for achievement 1",
      imagePath: "assets/11.png",
    ),
    Achievement(
      title: "Achievement 2",
      description: "Description for achievement 2",
      imagePath: "assets/12.png",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Achievements',
          style: TextStyle(
            fontFamily: 'YourCustomFont', // Change this to your custom font family
            fontSize: 20.0, // Change the font size as needed
            fontWeight: FontWeight.bold, // Change the font weight as needed
          ),
        ),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // Change this to display 3 circles in each row
          mainAxisSpacing: 20.0, // Add vertical spacing between rows
          crossAxisSpacing: 20.0, // Add horizontal spacing between circles
        ),
        itemCount: achievements.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      AchievementDetailPage(achievement: achievements[index]),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundImage: AssetImage(achievements[index].imagePath),
                radius: 60, // Adjust the radius of the circle as needed
              ),
            ),
          );
        },
      ),
    );
  }
}

class AchievementDetailPage extends StatelessWidget {
  final Achievement achievement;

  const AchievementDetailPage({required this.achievement});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Achievements',
          style: TextStyle(
            fontFamily: 'YourCustomFont', // Change this to your custom font family
            fontSize: 20.0, // Change the font size as needed
            fontWeight: FontWeight.bold, // Change the font weight as needed
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200, // Adjust the width of the square frame
              height: 200, // Adjust the height of the square frame
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), // Adjust the roundness of the corners
                color: Colors.grey[200], // Adjust the background color of the square frame
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20), // Adjust the roundness of the corners
                child: Image.asset(
                  achievement.imagePath,
                  fit: BoxFit.cover, // Adjust the fit of the image within the square frame
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              achievement.title,
              style: TextStyle(
                fontSize: 24, // Adjust the font size as needed
                fontWeight: FontWeight.bold, // Adjust the font weight as needed
              ),
            ),
            SizedBox(height: 10),
            Text(
              achievement.description,
              style: TextStyle(
                fontSize: 18, // Adjust the font size as needed
                color: Colors.grey, // Adjust the font color as needed
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: AchievementsPage(),
  ));
}