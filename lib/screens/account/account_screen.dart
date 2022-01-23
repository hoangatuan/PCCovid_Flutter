import 'package:flutter/material.dart';
import 'package:pccovid/screens/qr/view/scan_qr_screen.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Scaffold(
          body: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            const Spacer(),
            Center(
                child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ScanQRScreen()));
              },
              child: Container(
                  width: 64,
                  height: 64,
                  decoration: const BoxDecoration(
                      color: Color(0xFF31B55B),
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: Center(
                      child: Image.asset("assets/icons/scanning.png",
                          color: Colors.white, width: 28, height: 28))),
            )),
            const SizedBox(height: 12),
          ],
        ),
      )),
    );
  }
}
