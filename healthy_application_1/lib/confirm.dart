import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: ConfirmInfoScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class ConfirmInfoScreen extends StatefulWidget {
  @override
  State<ConfirmInfoScreen> createState() => _ConfirmInfoScreenState();
}

class _ConfirmInfoScreenState extends State<ConfirmInfoScreen> {
  bool isEditingEmail = false;
  bool isEditingPhone = false;
  bool isEditingUsername = false;

  TextEditingController emailController = TextEditingController(text: 'alokla@gmail.com');
  TextEditingController phoneController = TextEditingController(text: '077XXXXXXX');
  TextEditingController usernameController = TextEditingController(text: 'alokla-amjad');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F9D1),
      body: Column(
        children: [
         Container(
  width: 400,
  height: 250,
  decoration: const BoxDecoration(
    image: DecorationImage(
      image: AssetImage('assets/Log-Rectangle.png'),
      fit: BoxFit.fitHeight,
    ),
  ),
),
          SizedBox(height: 20),
          Text(
            'Confirm Information',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 30),
          buildEditableRow(
            icon: Icons.email,
            controller: emailController,
            isEditing: isEditingEmail,
            onEditTap: () {
              setState(() {
                isEditingEmail = !isEditingEmail;
              });
            },
          ),
          SizedBox(height: 15),
          buildEditableRow(
            icon: Icons.phone,
            controller: phoneController,
            isEditing: isEditingPhone,
            onEditTap: () {
              setState(() {
                isEditingPhone = !isEditingPhone;
              });
            },
          ),
           SizedBox(height: 15),
          buildEditableRow(
            icon: Icons.person,
            controller: usernameController,
            isEditing: isEditingUsername,
            onEditTap: () {
              setState(() {
                isEditingUsername = !isEditingUsername;
              });
            },
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Do you have an account ? ",
              style: TextStyle(fontWeight: FontWeight.bold,color: const Color.fromARGB(255, 86, 85, 85)),),
              GestureDetector(
                onTap: () {
                  // Navigate to login screen
                },
                child: Text(
                  "Login Now",
                  style: TextStyle(color: Color(0xFF5FC26E), fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {
              // Handle create account
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF5FC26E),
              padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              "Create",
       style: TextStyle(fontSize: 18, color: Colors.white,fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildEditableRow({
    required IconData icon,
    required TextEditingController controller,
    required bool isEditing,
    required VoidCallback onEditTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Row(
        children: [
          Icon(icon, size: 24),
          SizedBox(width: 10),
          Expanded(
            child: isEditing
                ? TextField(
                    controller: controller,
                    decoration: InputDecoration(isDense: true),
                  )
                : Text(
                    controller.text,
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
          ),
          GestureDetector(
            onTap: onEditTap,
            child: Text(
              'Edit',
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
