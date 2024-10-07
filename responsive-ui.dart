import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsive UI Example',
      home: ResponsiveHome(),
    );
  }
}

class ResponsiveHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Responsive UI'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Responsive Image
                Container(
                  width: constraints.maxWidth * 0.8, // 80% of screen width
                  height: constraints.maxHeight * 0.3, // 30% of screen height
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/your_image.png'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                SizedBox(height: 16), // Spacing
                // Responsive Text
                Text(
                  'Hello, Flutter!',
                  style: TextStyle(
                    fontSize: constraints.maxWidth > 600 ? 24 : 18, // Bigger text on larger screens
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'This is a responsive layout example.',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 16),
                // Responsive Button
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Click Me'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      horizontal: constraints.maxWidth * 0.2, // 20% of screen width
                      vertical: 12,
                    ),
                    textStyle: TextStyle(
                      fontSize: constraints.maxWidth > 600 ? 20 : 16, // Bigger text on larger screens
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
