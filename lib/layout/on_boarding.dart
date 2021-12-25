import 'package:e_commerce/login/login_screen.dart';
import 'package:e_commerce/shared/components/components.dart';
import 'package:e_commerce/shared/components/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class onBoardingScreen extends StatefulWidget {
  onBoardingScreen({Key? key}) : super(key: key);

  @override
  State<onBoardingScreen> createState() => _onBoardingScreenState();
}

class _onBoardingScreenState extends State<onBoardingScreen> {
  List<OnBoardingModel> OnBoarding = [
    OnBoardingModel(
        image: 'assets/images/shopping1.jpg',
        title: 'Online shopping',
        body: 'Get what you want from home'),
    OnBoardingModel(
        image: 'assets/images/shopping2.jpg',
        title: 'Form every women search for fashionable clothes',
        body: 'Join us now'),
    OnBoardingModel(
        image: 'assets/images/shopping3.jpg',
        title: 'We are happy to join',
        body: 'continue'),
  ];
  var BoardController = PageController();
  bool isLast = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          defaultTextButton(
              title: 'skip',
              pressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ));
              }),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  onPageChanged: (index) {
                    if (index == OnBoarding.length - 1) {
                      setState(() {
                        isLast = true;
                      });
                    } else {
                      setState(() {
                        isLast = false;
                      });
                    }
                  },
                  controller: BoardController,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) =>
                      buildBoardingItem(OnBoarding[index]),
                  itemCount: OnBoarding.length,
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              Row(
                children: [
                  SmoothPageIndicator(
                    controller: BoardController,
                    count: OnBoarding.length,
                    effect: ExpandingDotsEffect(
                      activeDotColor: Colors.blueAccent,
                      dotHeight: 10.0,
                      spacing: 5.0,
                      dotWidth: 10.0,
                      dotColor: Colors.grey,
                    ),
                  ),
                  Spacer(),
                  FloatingActionButton(
                    onPressed: () {
                      if (isLast) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ));
                      } else {
                        BoardController.nextPage(
                          duration: Duration(
                            milliseconds: 750,
                          ),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    child: Icon(Icons.arrow_forward_ios),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
