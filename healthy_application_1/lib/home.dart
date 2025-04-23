import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class RestaurantPage extends StatefulWidget {
  @override
  _RestaurantPageState createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {
  int selectedIndex = 0;

  // Sample dummy data
  final List<Map<String, dynamic>> restaurants = List.generate(10, (index) {
    return {
      'name': 'Taste Buds',
      'rating': '5.0',
      'reviews': '(+160)',
      'image': Icons.restaurant, // Replace with NetworkImage or AssetImage
    };
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1F6D9),
      appBar: AppBar(
        backgroundColor: Color(0xFFF1F6D9),
        elevation: 0,
        title: Row(
          children: [
            Icon(Icons.person_outline),
            SizedBox(width: 10),
            Text("Guest", style: TextStyle(fontWeight: FontWeight.bold)),
          
          ],
        ),
      ),
        endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
      image:NetworkImage('https://i.etsystatic.com/23519655/r/il/9dfa6d/6145262663/il_fullxfull.6145262663_g2h0.jpg'),fit:BoxFit.cover,opacity:0.5 ),
                color: Color.fromARGB(255, 136, 157, 247),
              ),
              child: Text(
                'More Services',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              title: Text('About App',style: 
              TextStyle(fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 84, 113, 195),
              letterSpacing: 2),),
              onTap: () {
                // Handle item tap
    // Navigator.push( context, MaterialPageRoute(builder: (context) => AboutScreen()),
    //             );
              },
            ),
           ListTile(
  title: Text('Book Review',style: 
              TextStyle(fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 84, 113, 195),
              letterSpacing: 2)),
  onTap: () {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => BookReviewScreen()),
    // );
  },
),
ListTile(
              title: Text('Profile',style: 
              TextStyle(fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 84, 113, 195),
              letterSpacing: 2)),
              onTap: () {
    //             // Handle item tap
    // Navigator.push( context, MaterialPageRoute(builder: (context) => ProfilePage()),
    //             );
              },
            ),
            ListTile(
              title: Text('Reading List',style: 
              TextStyle(fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 84, 113, 195),
              letterSpacing: 2)),
              onTap: () {
                // Handle item tap
              // Navigator.push( context, MaterialPageRoute(builder: (context) => ReadingListPage()),
              //   );
              },
            ),
          ],
        ),
        
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search bar
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.search),
                  hintText: "search",
                  border: InputBorder.none,
                ),
                // TODO: Backend - Search logic
              ),
            ),
            SizedBox(height: 16),

            // Title
            Text(
              "Top Healthy Restaurants and Markets in Florida",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 12),

            // Horizontal list of top cards
            SizedBox(
              height: 120,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                separatorBuilder: (_, __) => SizedBox(width: 12),
                itemBuilder: (context, index) {
                  return buildRestaurantCard();
                },
              ),
            ),
            SizedBox(height: 16),

            // Category tabs
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildTab("All", 0),
                buildTab("Restaurants", 1),
                buildTab("Markets", 2),
              ],
            ),
            SizedBox(height: 10),

            // Grid view
            Expanded(
              child: GridView.builder(
                itemCount: restaurants.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.1,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                ),
                itemBuilder: (context, index) {
                  return buildRestaurantCard();
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

  Widget buildRestaurantCard() {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.green.shade100,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
 CircleAvatar(
  maxRadius: 45,
  child: Image.network
("https://www.tastebudsmarketdelivery.com/uploads/b/35257920-917b-11ee-9aa7-6527960c123f/Taste%20Buds.png"),),
       SizedBox(width: 1),

       Column(children: [
        Text("Taste Buds", style: TextStyle(fontWeight: FontWeight.bold)),
         Row(
            children: [
              Icon(Icons.star, size: 16, color: Colors.orange),
              Text("5.0", style: TextStyle(fontSize: 12)),
              Text(" (+160)", style: TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          ),
          Text('''         A vegan restaurant
        offering innovative''',
           style: TextStyle(fontSize: 11)),
       ],),

Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.favorite_border),
              SizedBox(height: 40,),
              Icon(Icons.menu),
            ],
          )
       
            ]

          ),
          // SizedBox(height: 5),
          // Text("Taste Buds", style: TextStyle(fontWeight: FontWeight.bold)),
          // Row(
          //   children: [
          //     Icon(Icons.star, size: 16, color: Colors.orange),
          //     Text("5.0", style: TextStyle(fontSize: 12)),
          //     Text(" (+160)", style: TextStyle(fontSize: 12, color: Colors.grey)),
          //   ],
          // ),
          // Text("A vegan restaurant offering innovative.", style: TextStyle(fontSize: 11)),
          // Spacer(),
          // Column(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Icon(Icons.favorite_border),
          //     SizedBox(width: 20,),
          //     Icon(Icons.menu),
          //   ],
          // )
        ],
      ),
    );
  }

  Widget buildTab(String label, int index) {
    final isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () => setState(() => selectedIndex = index),
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.green : Colors.black,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          if (isSelected)
            Container(
              height: 2,
              width: 30,
              color: Colors.green,
              margin: EdgeInsets.only(top: 4),
            ),
        ],
      ),
    );
  }
}
