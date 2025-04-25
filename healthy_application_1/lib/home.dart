import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:healthy_application_1/changePassword.dart';
import 'package:healthy_application_1/profil.dart';

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
              child: Text("Account settings", style: TextStyle(color: Colors.grey)),
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
              child: Text("More", style: TextStyle(color: Colors.grey)),
            ),
            ListTile(
              title: Text('privacy policy'),
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
        title: Row(
          children: [
            Icon(Icons.person_outline),
            SizedBox(width: 10),
            Text("Guest", style: TextStyle(fontWeight: FontWeight.bold)),
          
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
                  mainAxisExtent: 120,
                ),
                itemBuilder: (context, index) {
                  return buildRestaurantCard2();
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
  maxRadius: 35,
  child: Image.network
("https://www.tastebudsmarketdelivery.com/uploads/b/35257920-917b-11ee-9aa7-6527960c123f/Taste%20Buds.png"),
),

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
        
        ],
      ),
    );
  }


//    Widget buildRestaurantCard2() {
//    return Container(
//       padding: EdgeInsets.all(15),
//       decoration: BoxDecoration(
//         color: Colors.green.shade100,
//         borderRadius: BorderRadius.circular(15),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//  CircleAvatar(
//   maxRadius: 35,
//   child: Image.network
// ("https://www.tastebudsmarketdelivery.com/uploads/b/35257920-917b-11ee-9aa7-6527960c123f/Taste%20Buds.png"),
// ),

//        Column(children: [
//         Text("Taste Buds", style: TextStyle(fontWeight: FontWeight.bold)),
//          Row(
//             children: [
//               Icon(Icons.star, size: 16, color: Colors.orange),
//               Text("5.0", style: TextStyle(fontSize: 12)),
//               Text(" (+160)", style: TextStyle(fontSize: 12, color: Colors.grey)),
//             ],
//           ),
//           Text('''         A vegan restaurant
//         offering innovative''',
//            style: TextStyle(fontSize: 11)),
//        ],),

// Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Icon(Icons.favorite_border),
//               SizedBox(height: 40,),
//               Icon(Icons.menu),
//             ],
//           )
       
//             ]

//           ),
        
//         ],
//       ),
//     );
//   }


Widget buildRestaurantCard2() {
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          //  SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
  maxRadius: 20,
  child: Image.network
("https://www.tastebudsmarketdelivery.com/uploads/b/35257920-917b-11ee-9aa7-6527960c123f/Taste%20Buds.png"),
),
                 
                  Text("Taste Buds", style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.star, size: 16, color: Colors.orange),
                      SizedBox(width: 4),
                      Text("5.0", style: TextStyle(fontSize: 12)),
                      SizedBox(width: 4),
                      Text("(+160)", style: TextStyle(fontSize: 12, color: Colors.grey)),
                    ],
                  ),
                 // SizedBox(height: 4),
//   Text('''A veganrestaurant 
// offering innovative''',
//                     style: TextStyle(fontSize: 11),
//                     maxLines: 2,
//                     overflow: TextOverflow.ellipsis,
//                   ),
                ],
              ),
            ),
            SizedBox(width: 5),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.favorite_border),
                SizedBox(height: 40),
                Icon(Icons.menu),
              ],
            ),
          ],
        ),
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
