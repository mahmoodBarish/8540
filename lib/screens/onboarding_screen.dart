import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          // Background Image (156:94, 156:95, I156:95;417:719)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: screenHeight * (536 / 812), // Original height: 536px
            child: Image.asset(
              'assets/images/I156_95_417_719.png',
              fit: BoxFit.cover,
            ),
          ),

          // Gradient Overlay (156:96 -> 156:97 Shadow Container)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: screenHeight * (360 / 812), // Original height: 360px
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0x00050505), // r: 0.0196..., a: 0
                    Color(0xFF050505), // r: 0.0196..., a: 1
                  ],
                  stops: [0.0, 0.23670603334903717], // Figma gradient stops
                ),
              ),
            ),
          ),

          // Main Content (Text and Button) (156:100 Text, 156:98 Button)
          Positioned(
            // The content position is based on the button's bottom.
            // Button absoluteBoundingBox: y=702, height=56. So bottom is 702+56=758.
            // Screen height is 812. So 812-758 = 54 from bottom.
            bottom: screenHeight * (54 / 812),
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * (24 / 375)), // Original x=24 margin for content
              child: Column(
                mainAxisSize: MainAxisSize.min, // Wrap content height
                crossAxisAlignment: CrossAxisAlignment.center, // Align children centrally
                children: [
                  // Title (156:101)
                  Text(
                    'Fall in Love with Coffee in Blissful Delight!',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.sora(
                      fontSize: screenWidth * (32 / 375), // Scale font size
                      fontWeight: FontWeight.w600, // SemiBold
                      color: Colors.white,
                      height: 1.5, // Line height 48px / font size 32px = 1.5
                      letterSpacing: 0.16,
                    ),
                  ),
                  SizedBox(height: screenHeight * (8 / 812)), // Item spacing 8 between texts
                  // Description (156:102)
                  Text(
                    'Welcome to our cozy coffee corner, where every cup is a delightful for you.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.sora(
                      fontSize: screenWidth * (14 / 375), // Scale font size
                      fontWeight: FontWeight.w400, // Regular
                      color: const Color(0xFFA7A7A7), // r: 0.635, g: 0.635, b: 0.635, a: 1
                      height: 1.5, // Line height 21px / font size 14px = 1.5
                      letterSpacing: 0.14,
                    ),
                  ),
                  SizedBox(height: screenHeight * (32 / 812)), // Gap between text frame bottom (y=670) and button frame top (y=702) is 32px (702-670)
                  // Get Started Button (156:98)
                  SizedBox(
                    width: double.infinity, // Fixed width 327, but let's make it responsive to padding
                    height: screenHeight * (56 / 812), // Original height 56px
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigate to the home screen. Assuming '/home' is the route name.
                        context.go('/home');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFC67C4E), // r: 0.776, g: 0.486, b: 0.305, a: 1
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16), // cornerRadius 16
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * (20 / 375), // paddingLeft/Right 20
                          vertical: screenHeight * (16 / 812), // paddingTop/Bottom 16
                        ),
                      ),
                      child: Text(
                        'Get Started',
                        style: GoogleFonts.sora(
                          fontSize: screenWidth * (16 / 375), // Scale font size
                          fontWeight: FontWeight.w600, // SemiBold
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Custom Status Bar (Top) (156:104 Iphone)
          // Uses SafeArea to handle device notches and dynamic island.
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: screenHeight * (44 / 812), // Original height 44px
            child: SafeArea(
              bottom: false, // Status bar is at the top, no bottom safe area needed
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * (24 / 375)), // Original padding for time, left align. Icons are right align.
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '9:41', // Original time
                      style: GoogleFonts.sora(
                        fontSize: screenWidth * (15 / 375), // Adjusted to fit common status bar time size, was 12px based on absolute bounding box, but generally larger
                        fontWeight: FontWeight.w600, // No specific font weight specified, inferring from visual
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      children: [
                        // Mobile Signal (I156:104;417:339)
                        Icon(Icons.signal_cellular_alt, color: Colors.white, size: screenWidth * (17 / 375)), // Original size similar to 17px
                        SizedBox(width: screenWidth * (5 / 375)), // Small spacing between icons
                        // Wifi (I156:104;417:335)
                        Icon(Icons.wifi, color: Colors.white, size: screenWidth * (17 / 375)), // Original size similar to 17px
                        SizedBox(width: screenWidth * (5 / 375)), // Small spacing between icons
                        // Battery (I156:104;417:331)
                        Icon(Icons.battery_full_rounded, color: Colors.white, size: screenWidth * (20 / 375)), // Original size similar to 20px
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Home Indicator (Bottom) (156:103 Iphone)
          Positioned(
            // Absolute bounding box y=799, height=5. Screen height 812. So 812 - 799 - 5 = 8px from bottom.
            bottom: screenHeight * (8 / 812),
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: screenWidth * (134 / 375), // Original width 134px
                height: screenHeight * (5 / 812), // Original height 5px
                decoration: BoxDecoration(
                  color: const Color(0xFF242424), // r: 0.141, g: 0.141, b: 0.141, a: 1
                  borderRadius: BorderRadius.circular(100), // cornerRadius 100
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}