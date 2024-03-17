<<<<<<< HEAD
import 'package:flutter/material.dart';

class Achievement {
  final String title;
  final String description;
  final String imagePath;
  final bool unlocked;

  Achievement({
    required this.title,
    required this.description,
    required this.imagePath,
    this.unlocked = false,
  });
}

class AchievementsPage extends StatefulWidget {
  @override
  _AchievementsPageState createState() => _AchievementsPageState();
}

class _AchievementsPageState extends State<AchievementsPage> {
  final List<Achievement> achievements = [
    Achievement(
      title: "Newbie",
      description: "Welcome to carpool",
      imagePath: "assets/dark.png",
      unlocked: true,
    ),
    Achievement(
      title: "5 pools",
      description: "First 5 pools completed",
      imagePath: "assets/2.jpg",
    ),
    Achievement(
      title: "5 pools",
      description: "First 5 pools completed",
      imagePath: "assets/2.jpg",
    ),
    Achievement(
      title: "10 pools",
      description: "First 10 pools completed",
      imagePath: "assets/3.jpg",
    ),
    Achievement(
      title: "15 pools",
      description: "First 15 pools completed",
      imagePath: "assets/4.jpg",
    ),
    Achievement(
      title: "20 pools",
      description: "First 20 pools completed",
      imagePath: "assets/5.jpg",
    ),
    Achievement(
      title: "25 pools",
      description: "First 25 pools completed",
      imagePath: "assets/6.jpg",
    ),
    Achievement(
      title: "30 pools",
      description: "First 30 pools completed",
      imagePath: "assets/7.jpg",
    ),
    Achievement(
      title: "Achievement 2",
      description: "Description for achievement 2",
      imagePath: "assets/8.jpg",
    ),
    Achievement(
      title: "Achievement 1",
      description: "Description for achievement 1",
      imagePath: "assets/13.jpg",
    ),
    Achievement(
      title: "Achievement 2",
      description: "Description for achievement 2",
      imagePath: "assets/15.jpg",
    ),
    Achievement(
      title: "Achievement 1",
      description: "Description for achievement 1",
      imagePath: "assets/11.jpg",
    ),
    Achievement(
      title: "Achievement 2",
      description: "Description for achievement 2",
      imagePath: "assets/12.jpg",
    ),
    // Add other achievements here...
  ];

  @override
  Widget build(BuildContext context) {
    int unlockedCount =
        achievements.where((achievement) => achievement.unlocked).length;
    double progress = unlockedCount / achievements.length;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Achievements',
          style: TextStyle(
            fontFamily:
                'YourCustomFont', // Change this to your custom font family
            fontSize: 20.0,
            color: Colors.white, // Change the font size as needed
            fontWeight: FontWeight.bold, // Change the font weight as needed
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                    3, // Change this to display 3 circles in each row
                mainAxisSpacing: 20.0, // Add vertical spacing between rows
                crossAxisSpacing:
                    20.0, // Add horizontal spacing between circles
              ),
              itemCount: achievements.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AchievementDetailPage(
                            achievement: achievements[index]),
                      ),
                    );
                  },
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundImage:
                              AssetImage(achievements[index].imagePath),
                          radius:
                              60, // Adjust the radius of the circle as needed
                          backgroundColor: achievements[index].unlocked
                              ? Colors.transparent
                              : Colors.black.withOpacity(0.5),
                        ),
                      ),
                      if (!achievements[index]
                          .unlocked) // Show overlay for locked achievements
                        Positioned.fill(
                          child: Container(
                            color: Colors.black
                                .withOpacity(0.5), // Darken the overlay
                          ),
                        ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                          child: Text(
                            (index + 1).toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                Container(
                  height: 20, // Adjust the height of the progress bar
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        10), // Adjust the border radius to make it curved
                    color: Colors.grey.withOpacity(
                        0.3), // Adjust the background color of the progress bar
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: progress,
                  child: Container(
                    height: 20, // Adjust the height of the progress bar
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          10), // Adjust the border radius to make it curved
                      color: Colors.green, // Change progress bar color to green
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
        ],
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
            fontFamily:
                'YourCustomFont', // Change this to your custom font family
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
                borderRadius: BorderRadius.circular(
                    20), // Adjust the roundness of the corners
                color: Colors.grey[
                    200], // Adjust the background color of the square frame
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                    20), // Adjust the roundness of the corners
                child: Image.asset(
                  achievement.imagePath,
                  fit: BoxFit
                      .cover, // Adjust the fit of the image within the square frame
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
=======
import 'package:flutter/material.dart';

class Achievement {
  final String title;
  final String description;
  final String imagePath;
  final bool unlocked;

  Achievement({
    required this.title,
    required this.description,
    required this.imagePath,
    this.unlocked = false,
  });
}

class AchievementsPage extends StatefulWidget {
  @override
  _AchievementsPageState createState() => _AchievementsPageState();
}

class _AchievementsPageState extends State<AchievementsPage> {
  final List<Achievement> achievements = [
    Achievement(
      title: "Novice Rider",
      description: "Welcome to carpool",
      imagePath: "assets/dark.png",
      unlocked: true,
    ),
    Achievement(
      title: "Eco-Friendly Traveler",
      description: "5 pools completed",
      imagePath: "assets/2.png",
    ),
    Achievement(
      title: "Road Explorer",
      description: "10 pools completed",
      imagePath: "assets/3.png",
    ),
    Achievement(
      title: "Community Navigator",
      description: "20 pools completed",
      imagePath: "assets/4.png",
    ),
    Achievement(
      title: "Carpool Connoisseur",
      description: "30 pools completed",
      imagePath: "assets/5.png",
    ),
    Achievement(
      title: "Sustainable Commuter",
      description: "40 pools completed",
      imagePath: "assets/6.png",
    ),
    Achievement(
      title: "Urban Voyager",
      description: "50 pools completed",
      imagePath: "assets/7.png",
    ),
    Achievement(
      title: "Green Travel Advocate",
      description: "60 pools completed",
      imagePath: "assets/8.png",
    ),
    Achievement(
      title: "Transportation Trailblazer",
      description: "70 pools completed",
      imagePath: "assets/15.png",
    ),
    Achievement(
      title: "Carpool Captain",
      description: "80 pools completed",
      imagePath: "assets/13.png",
    ),
    Achievement(
      title: "Eco Road Warrior",
      description: "90 pools completed",
      imagePath: "assets/11.png",
    ),
    Achievement(
      title: "Sustainable Mobility Master",
      description: "100 pools completed",
      imagePath: "assets/12.png",
    ),
    // Add other achievements here...
  ];

  @override
  Widget build(BuildContext context) {
    int unlockedCount = achievements.where((achievement) => achievement.unlocked).length;
    double progress = unlockedCount / achievements.length;

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
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
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
                        builder: (context) => AchievementDetailPage(achievement: achievements[index]),
                      ),
                    );
                  },
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white, // Add white border color
                              width: 2, // Adjust border width as needed
                            ),
                          ),
                          child: CircleAvatar(
                            backgroundImage: AssetImage(achievements[index].imagePath),
                            radius: 60, // Adjust the radius of the circle as needed
                            backgroundColor: achievements[index].unlocked ? Colors.transparent : Colors.black.withOpacity(0.5),
                          ),
                        ),
                      ),
                      if (!achievements[index].unlocked) // Show overlay for locked achievements
                        Positioned.fill(
                          child: Container(
                            color: Colors.black.withOpacity(0.5), // Darken the overlay
                          ),
                        ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                          child: Text(
                            (index + 1).toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                Container(
                  height: 20, // Adjust the height of the progress bar
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), // Adjust the border radius to make it curved
                    color: Colors.grey.withOpacity(0.3), // Adjust the background color of the progress bar
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: progress,
                  child: Container(
                    height: 20, // Adjust the height of the progress bar
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), // Adjust the border radius to make it curved
                      color: Colors.green, // Change progress bar color to green
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
        ],
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
>>>>>>> eb816de22804b604a26fb7e880bcae8d8cb4412b
