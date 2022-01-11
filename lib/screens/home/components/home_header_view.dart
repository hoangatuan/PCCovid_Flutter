import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeHeaderView extends StatelessWidget {
  const HomeHeaderView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ClipPath(
      clipper: MyClipper(),
      child: Container(
          padding: const EdgeInsets.only(left: 36, top: 60),
          height: 320,
          width: size.width,
          decoration: const BoxDecoration(
              color: Colors.yellow,
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Color(0xFF3383CD), Color(0xFF11249F)]),
              image:
                  DecorationImage(image: AssetImage("assets/homee/virus.png"))),
          child: Stack(
            children: [
              SvgPicture.asset(
                "assets/homee/Drcorona.svg",
                width: 230,
                fit: BoxFit.fitWidth,
                alignment: Alignment.topLeft,
              ),
              const Positioned(
                  left: 150,
                  top: 20,
                  child: Text(
                    'All you needed \nis stay at home.',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ))
            ],
          )),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
