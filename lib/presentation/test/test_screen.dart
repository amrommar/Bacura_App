import 'package:flutter/material.dart';

class test_screen extends StatefulWidget {
  @override
  _test_screenState createState() => _test_screenState();
}

class _test_screenState extends State<test_screen> {
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Selected Tab: $_selectedIndex'),
      ),
      bottomNavigationBar: Stack(
        clipBehavior: Clip.none,
        children: [
          ClipPath(
            clipper: CustomNavigationBarClipper(),
            // Custom clipper for curved bar
            child: Container(
              height: 70,
              color: Colors.blue, // Background color for bottom bar
            ),
          ),
          Positioned(
            bottom: -30, // Adjust position of the floating action button
            left: MediaQuery.of(context).size.width / 2 - 30,
            child: FloatingActionButton(
              backgroundColor: Colors.white,
              onPressed: () {},
              child: Icon(
                Icons.home,
                color: Colors.blue, // Icon color inside the FAB
              ),
            ),
          ),
          BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            backgroundColor: Colors.transparent,
            // Make the bar transparent to let the curve show
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            items: [
              _buildBottomNavigationBarItem(Icons.more_horiz, 'المزيد', 0),
              _buildBottomNavigationBarItem(Icons.shopping_cart, 'السلة', 1),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors
                      .transparent, // Hidden middle icon since we use the FAB
                ),
                label: '',
              ),
              _buildBottomNavigationBarItem(Icons.receipt_long, 'طلباتي', 3),
              _buildBottomNavigationBarItem(Icons.location_on, 'العروض', 4),
            ],
          ),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(
      IconData icon, String label, int index) {
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        color: index == _selectedIndex
            ? Colors.white
            : Colors.white54, // Adjust the color for selected/unselected states
      ),
      label: label,
    );
  }
}

class CustomNavigationBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double curveHeight = 30;

    // Start at the bottom left
    path.lineTo(0, 0);

    // Create the left straight line, curve, and right straight line
    path.lineTo(size.width * 0.25, 0);
    path.quadraticBezierTo(
        size.width * 0.35, curveHeight, size.width * 0.5, curveHeight);
    path.quadraticBezierTo(
        size.width * 0.65, curveHeight, size.width * 0.75, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

void main() {
  runApp(MaterialApp(
    home: test_screen(),
  ));
}
