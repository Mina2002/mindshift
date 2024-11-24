import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlogScreen(),
    );
  }
}

class BlogScreen extends StatefulWidget {
  @override
  _BlogScreenState createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  int selectedTab = 0; // To handle selected tab (0 = All, 1 = Trending, 2 = Recent)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade700,
        title: Text(
          'Blog',
          style: TextStyle(
            fontFamily: 'Cursive',
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Add your back navigation logic
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              // Add your menu logic
            },
          ),
        ],
        elevation: 0,
      ),
      body: Column(
        children: [
          // Tabs (All, Trending, Recent)
          Container(
            color: Colors.green.shade100,
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildTabButton('All', 0),
                buildTabButton('Trending', 1),
                buildTabButton('Recent', 2),
              ],
            ),
          ),
          // Blog posts list
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              children: [
                buildBlogPost(
                  username: 'user11200033',
                  content:
                      'I think it’s really important to make the stigma way from mental health. You are not your illness. You deserve to be happy, loved and adequately joyful. Give yourself the rest you need, breathe and go on with life.',
                  likes: 4,
                  timestamp: '12:20 PM',
                ),
                buildBlogPost(
                  username: 'user14368245',
                  content:
                      'Happy to be part of this community. I feel better and more understood. Thanks everyone. I am able to express myself more and let out all that was bottled. I recommend this to anyone who wants to talk.',
                  likes: 2,
                  timestamp: '14:30 PM',
                ),
                buildBlogPost(
                  username: 'user14852765',
                  content:
                      'Mental health is not a destination, but a process. It’s about how you drive, not where you’re going.',
                  likes: 3,
                  timestamp: '11:15 AM',
                ),
              ],
            ),
          ),
        ],
      ),
      // Floating Action Button
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green.shade700,
        child: Icon(Icons.add),
        onPressed: () {
          // Add logic to create a new blog post
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.green.shade700,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        currentIndex: 2, // Set Blog as the active tab
        onTap: (index) {
          // Add navigation logic here
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule),
            label: 'Sessions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'Blog',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
        ],
      ),
    );
  }

  // Helper method to build each blog post
  Widget buildBlogPost({
    required String username,
    required String content,
    required int likes,
    required String timestamp,
  }) {
    return Card(
      margin: EdgeInsets.only(bottom: 16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              username,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              content,
              style: TextStyle(fontSize: 14.0),
            ),
            SizedBox(height: 12.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.favorite_border, size: 16.0),
                    SizedBox(width: 4.0),
                    Text('$likes'),
                  ],
                ),
                Text(
                  timestamp,
                  style: TextStyle(fontSize: 12.0, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build tabs
  Widget buildTabButton(String title, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTab = index;
        });
      },
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
          color: selectedTab == index ? Colors.green.shade900 : Colors.grey,
        ),
      ),
    );
  }
}
