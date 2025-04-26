import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:healthy_application_1/changePassword.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int selectedIndex = 4; // Guest tab selected

  // Dummy video data
  final List<String> videos = List.generate(9, (index) => "Video ${index + 1}");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
      child: Container(
        color: Color(0xFFF1F6D9),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
               decoration: const BoxDecoration(
    image: DecorationImage(
      image: AssetImage('assets/Log-Rectangle.png'),
      fit: BoxFit.fitHeight,
    ),
  ),
              height: 180,
              child: Stack(
                children: [
                
                  Positioned(
                    top: 50,
                    left: 16,
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/profile.jpg'),
                      // TODO: Backend - Load profile image dynamically
                    ),
                  ),
                  Positioned(
                    top: 60,
                    left: 90,
                    child: Text(
                      'Amjad alokla',
                      style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                 
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 20,
                      decoration: BoxDecoration(
                        color: Color(0xFFF1F6D9),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text("Account settings", 
              style: 
              TextStyle(color: Colors.grey,fontSize: 25,fontWeight: FontWeight.bold)),
            ),
            ListTile(
              title: Text('Edit Profile'),
              trailing: Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                  Navigator.push(
         context,
         MaterialPageRoute(builder: (context) => ProfilePage()),
       );
                // TODO: Implement Edit Profile
              },
            ),
            ListTile(
              title: Text('Change password'),
              trailing: Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                 Navigator.push(
         context,
         MaterialPageRoute(builder: (context) => ChangePasswordScreen()),
       );
                // TODO: Implement Change Password
              },
            ),
            SwitchListTile(
              title: Text('Notification'),
              value: false,
              onChanged: (bool value) {
                // TODO: Implement Notification toggle
              },
            ),
            Divider(thickness: 1),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text("More", 
              style: TextStyle(color: Colors.grey,fontSize: 25,fontWeight: FontWeight.bold)),
            ),
            ListTile(
              title: Text('privacy settings'),
              trailing: Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // TODO: Implement Privacy Policy
              },
            ),
            ListTile(
              title: Text('About us'),
              trailing: Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // TODO: Implement About Us
              },
            ),

            SizedBox(height: 40),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: OutlinedButton.icon(
                onPressed: () {
                  // TODO: Implement Log Out
                },
                icon: Icon(Icons.logout, color: Colors.black),
                label: Text(
                  'Log Out',
                  style: TextStyle(color: Colors.black),
                ),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.black),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
      backgroundColor: Color(0xFFF1F6D9),
      appBar: AppBar(
        backgroundColor: Color(0xFFF1F6D9),
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           // Icon(Icons.menu, color: Colors.black),
            Icon(Icons.notifications_none, color: Colors.black),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            SizedBox(height: 10),

            // Profile Picture
            CircleAvatar(
              radius: 45,
              backgroundImage: AssetImage("assets/profile.jpg"),
              // TODO: Backend - Load user profile image dynamically
            ),
            SizedBox(height: 10),

            // Username
            Text(
              "@alokla_amjad",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 12),

            // Stats Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildStat("277", "following"),
                buildStat("901", "Followers"),
                buildStat("11K", "likes"),
              ],
            ),
            SizedBox(height: 12),

            // Bio
            Text(
              "I'm a food blogger and I make a review\nrestaurant meals",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 20),

            // Video Grid
            Expanded(
              child: GridView.builder(
                itemCount: videos.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    color: Colors.grey[300],
                    child: Center(
                      child: Text(
                        videos[index],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    // TODO: Backend - Replace with video thumbnail & onTap to play video
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) => setState(() => selectedIndex = index),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: "Favorite"),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Explore"),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "Guest"),
        ],
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
      ),
    );
  }

  Widget buildStat(String value, String label) {
    return Column(
      children: [
        Text(value, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        Text(label, style: TextStyle(color: Colors.grey, fontSize: 13)),
      ],
    );
  }
}
