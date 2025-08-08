import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF003133),
        iconTheme: IconThemeData(color: Colors.white),
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
                      child: Row (
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(width: 4),
                          Container(
                            width: 32,
                            height: 32,
                            decoration: const BoxDecoration(
                              color: Color(0xFF003133),
                              shape: BoxShape.circle,
                            ),
                            child: const Center(
                              child: Text('1',style:
                              TextStyle(color: Colors.white,
                              fontWeight: FontWeight.bold,
                              ),
                              ),
                            ),
                          ),

                          const Positioned(
                              top:69 -48,
                              left: 28,
                            child: SizedBox(
                              width: 60,
                              height: 10,
                              child: Text(
                                  'Trial Point',
                                style: TextStyle(fontSize: 7,
                                color: Color(0xFF003133),
                                ),
                              ),
                            ),
                          ),
                          const Positioned(
                            left: 55,
                            top: 76,
                            child: SizedBox(
                              width: 46,
                              height: 14,
                              child: Text(
                                'Available',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  height: 1.0, // Line height 100%
                                  color: Color(0xFF003133),
                                ),
                              ),
                            ),
                          ),


                        ],
                      )
                    ),
                  )
                ],
              ),
            ),
          ),
          // 👇 You can place other widgets here below the curved container
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
