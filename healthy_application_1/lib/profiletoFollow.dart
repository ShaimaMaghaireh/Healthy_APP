import 'package:flutter/material.dart';

class ProfileFollowPage extends StatefulWidget {
  @override
  _ProfileFollowPageState createState() => _ProfileFollowPageState();
}

class _ProfileFollowPageState extends State<ProfileFollowPage> {
  int selectedIndex = 4; // Guest tab selected

  // Dummy video data
  final List<String> videos = List.generate(9, (index) => "Video ${index + 1}");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1F6D9),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            SizedBox(height: 100),

           Row(children: [
            SizedBox(width: 70),
             CircleAvatar(
              radius: 45,
              backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ6HUYDWgduTKBlP3BeZMQ-2N76FwF2NVVFakh_PU1sZZhQrPLUuGlAkSzEt57fuJkfWVM&usqp=CAU"),
              // TODO: Backend - Load user profile image dynamically
            ),
             SizedBox(width: 20),
            ElevatedButton(onPressed:(){},
             child: Text("Follow"),
             style:ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 129, 194, 131),
                //padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                textStyle: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold)),)
           ],),
            SizedBox(height: 10),

            // Username
            Text(
              "@alokla_amjad",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 12),

            // Stats Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
