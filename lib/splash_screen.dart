import 'dart:math';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:online_buss_tickets/User/sign_in.dart';

class SplashScreen extends StatefulWidget {
  static const style = TextStyle(
    color: Colors.black,
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );

  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreen createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  int page = 0;
  late LiquidController liquidController;
  late UpdateType updateType;

  @override
  void initState() {
    liquidController = LiquidController();
    super.initState();
  }

  final pages = [
    Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          //Text("Welcome!"),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Image.asset(
              ("assets/images/app_icon_1.png"),
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: const [
              Text(
                "Choose The Bus Service",
                style: SplashScreen.style,
              ),
              Text(
                "On Which You Want to Travel",
                style: SplashScreen.style,
              ),
              Text(
                "",
                style: SplashScreen.style,
              ),
              Text(
                "",
                style: SplashScreen.style,
              ),
            ],
          ),
        ],
      ),
    ),
    Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Image.asset(
            ("assets/images/daewoo_2.png"),
            fit: BoxFit.cover,
          ),
          Column(
            children: const [
              Text(
                "Book Tickets of",
                style: SplashScreen.style,
              ),
              Text(
                "Daewoo Express",
                style: SplashScreen.style,
              ),
              Text(
                "",
                style: SplashScreen.style,
              ),
            ],
          ),
        ],
      ),
    ),
    Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Image.asset(
            ("assets/images/faisal_movers_1.png"),
            fit: BoxFit.cover,
          ),
          Column(
            children: const [
              Text(
                "Book Tickets of",
                style: SplashScreen.style,
              ),
              Text(
                "Faisal Movers",
                style: SplashScreen.style,
              ),
              Text(
                "",
                style: SplashScreen.style,
              ),
            ],
          ),
        ],
      ),
    ),
    Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Image.asset(
            ("assets/images/shalimar_bus.png"),
            fit: BoxFit.cover,
          ),
          Column(
            children: const [
              Text(
                "Book Tickets of",
                style: SplashScreen.style,
              ),
              Text(
                "Shalimar Express",
                style: SplashScreen.style,
              ),
              Text(
                "",
                style: SplashScreen.style,
              ),
            ],
          ),
        ],
      ),
    ),
  ];

  Widget _buildDot(int index) {
    double selectedness = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((page) - index).abs(),
      ),
    );
    double zoom = 1.0 + (2.0 - 1.0) * selectedness;
    return SizedBox(
      width: 25.0,
      child: Center(
        child: Material(
          color: Colors.blue,
          type: MaterialType.circle,
          child: SizedBox(
            width: 10.0 * zoom,
            height: 10.0 * zoom,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            LiquidSwipe(
              pages: pages,
              slideIconWidget: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onPageChangeCallback: pageChangeCallback,
              waveType: WaveType.liquidReveal,
              liquidController: liquidController,
              enableSideReveal: true,
              ignoreUserGestureWhileAnimating: true,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  const Expanded(child: SizedBox()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List<Widget>.generate(pages.length, _buildDot),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const Login(),
                      ),
                    );
                  },
                  child:
                      const Text("Skip", style: TextStyle(color: Colors.black)),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: TextButton(
                  onPressed: () {
                    liquidController.jumpToPage(
                        page:
                            liquidController.currentPage + 1 > pages.length - 1
                                ? 0
                                : liquidController.currentPage + 1);
                  },
                  child:
                      const Text("Next", style: TextStyle(color: Colors.black)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  pageChangeCallback(int lpage) {
    setState(() {
      page = lpage;
    });
  }
}
