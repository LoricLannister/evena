import 'package:evena/weddingCreation.dart';
import 'package:evena/sign.dart';
import 'package:flutter/material.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  late PageController _pageController;
  int currentIndex = 0;
  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              PageView(
                onPageChanged: (int page) {
                  setState(() {
                    currentIndex = page;
                  });
                },
                controller: _pageController,
                children: [
                  makePage(
                    image: "assets/1.png",
                    title: "",
                    content: "Be the planner of your event.",
                  ),
                  makePage(
                    image: "assets/3.png",
                    title: "",
                    content: "Manage your task and your\nbudget as you want.",
                  ),
                  makePage(
                    image: "assets/2.png",
                    title: "",
                    content: "Be satisfied of your work.",
                  )
                ],
              ),
              Positioned(
                top: 440,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildIndicator(),
                ),
              ),
              Positioned(
                top: 480,
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width - 30,
                  color: Colors.purple,
                  child: InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MarriageCreation(),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'CREATE AN EVENT',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 540,
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width - 30,
                  color: Colors.purple,
                  child: InkWell(
                    onTap: () {},
                    child: const Center(
                      child: Text(
                        'JOIN AN EVENT',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 610,
                child: Row(
                  children: [
                    const Text("Already have and account?"),
                    InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Sign(),
                        ),
                      ),
                      child: const Text(
                        "Log in",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget makePage({String image = "", String title = "", String content = ""}) {
    return Container(
      height: MediaQuery.of(context).size.height / 2.5,
      width: MediaQuery.of(context).size.width / 1.5,
      padding: const EdgeInsets.only(right: 30, left: 30),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Image.asset(image, height: 350),
            ),
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Text(
                content,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 15,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 10,
      width: isActive ? 35 : 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: Colors.purple,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < 3; i++) {
      if (currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }
    return indicators;
  }
}
