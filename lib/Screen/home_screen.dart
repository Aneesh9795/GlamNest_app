import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF003133),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          ClipPath(
            clipper: BottomCurveClipper(),
            child: Container(
              height: 196,
              width: double.infinity,
              color: const Color(0xFF003133),
              child: Stack(
                children: [
                  // Rectangle with circle & text

                  Positioned(
                    top: 20,
                    left: 16,
                    child: Container(
                      width: 110,
                      height: 37,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(23),
                      ),
                      child: Stack(
                        children: [
                          // Circle
                          Positioned(
                            left: 4,
                            top: 2.5,
                            child: Container(
                              width: 32,
                              height: 32,
                              decoration: const BoxDecoration(
                                color: Color(0xFF003133),
                                shape: BoxShape.circle,
                              ),
                              child: const Center(
                                child: Text(
                                  '1',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          // Trial Point
                          const Positioned(
                            left: 42,
                            top: 6,
                            child: SizedBox(
                              width: 60,
                              child: Text(
                                'Trial Point',
                                style: TextStyle(
                                  fontSize: 7,
                                  color: Color(0xFF003133),
                                ),
                              ),
                            ),
                          ),

                          // Available
                          const Positioned(
                            left: 42,
                            top: 18, 
                            child: SizedBox(
                              width: 60,
                              child: Text(
                                'Available',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  height: 1.0, // Line height 100%
                                  color: Color(0xFF81CC2E)
                                  ,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //Right - Cart, Wishlist, search bar
                  Positioned(
                      child: Row(
                        children: [
                          IconButton(onPressed: (){}, 
                              icon:const Icon(Icons.shopping_cart,color: Colors.white,) )
                        ],
                      )
                  )
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}

// 🎨 Custom clipper for curved bottom
class BottomCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height - 40); // from top-left to near bottom-left
    path.quadraticBezierTo(
      size.width / 2, size.height, // control point
      size.width, size.height - 40, // end point
    );
    path.lineTo(size.width, 0); // top-right
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
