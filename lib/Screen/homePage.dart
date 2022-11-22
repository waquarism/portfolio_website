import 'package:flutter/material.dart';
import 'package:waquar_portfolia/Model/colors.dart';

import '../Widgets/navBar.dart';
import 'landingPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/mainBg.png',),
              fit: BoxFit.cover,
            )
        ),
        child: Stack(
          children: [
            // Positioned(    // don't know why it is not working...
            //   top: 90,
            //   child: Divider(
            //     height: 10,
            //     color: barColor,
            //   ),
            // ),
            Positioned(
              top: 5,
              child: Expanded(
                child: Column(
                  children: [
                    Navbar(),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 40),
                      child: LandingPage(),
                    ),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
