import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LocationSelectionPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}  

class LocationSelectionPage extends StatefulWidget {
  @override
  _LocationSelectionPageState createState() => _LocationSelectionPageState();
}

class _LocationSelectionPageState extends State<LocationSelectionPage> {
  String? selectedState;
  String? selectedCounty;
  String? selectedCity;

  List<String> states = ['California', 'Texas', 'Florida'];
  List<String> counties = ['County A', 'County B', 'County C'];
  List<String> cities = ['City 1', 'City 2', 'City 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9C3),
      body: Stack(
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

          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 120,),
                  const Text(
                    'Start your journey',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 30),
                  buildDropdown(
                    hint: 'Your State',
                    value: selectedState,
                    items: states,
                    onChanged: (value) => setState(() => selectedState = value),
                  ),
                  const SizedBox(height: 15),
                  buildDropdown(
                    hint: 'Country',
                    value: selectedCounty,
                    items: counties,
                    onChanged: (value) => setState(() => selectedCounty = value),
                  ),
                  const SizedBox(height: 15),
                  buildDropdown(
                    hint: 'City state',
                    value: selectedCity,
                    items: cities,
                    onChanged: (value) => setState(() => selectedCity = value),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      // Handle start action
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      minimumSize: Size(double.infinity, 50),
                   
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text('Start', style: TextStyle(fontSize: 18,color: Colors.white)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDropdown({
    required String hint,
    required String? value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return DropdownButtonFormField<String>(
      value: value,
      hint: Row(
        children: [
          const Icon(Icons.location_on_outlined, color: Colors.black54),
          const SizedBox(width: 10),
          Text(hint, style: const TextStyle(color: Colors.black54)),
        ],
      ),
      onChanged: onChanged,
      items: items.map((item) {
        return DropdownMenuItem(
          value: item,
          child: Text(item),
        );
      }).toList(),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.transparent,
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.green),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.green, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      icon: const Icon(Icons.keyboard_arrow_down),
    );
  }
}