import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop/screens/login.dart';
import 'package:shop/styles/text.dart';
import 'package:shop/utils/shared_prefrences.dart';
import 'package:shop/widgets/responsive.dart';
import 'package:shop/widgets/widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class OnBoarding extends StatefulWidget {
  static String id = "OnBoarding";
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  void submit(){
    Shared.saveData(key: 'onBoarding',
        value: true).then((value){
          if(value){
            moveToPage(
                context: context,
                pageName: LoginPage.id);
          }
    });
  }
  bool isLast = false;
  PageController pageController = PageController();
  List<String> images = [
    'images/onboarding1.png',
    'images/onboarding2.png',
    'images/onboarding3.png'
  ];
  List<String> title = ['Title 1', 'Title 2', 'Title 3'];
  List<String> body = ['Body 1', 'Body 2', 'Body 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          TextButton(onPressed:submit,
            child: Text('Skip',style: TextStyle(
              fontSize: 18,
              color: Colors.blue,
              fontWeight: FontWeight.bold
          ),),)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) => onBoarding(
                    image: images[index],
                    title: title[index],
                    body: body[index]),
                itemCount: 3,
                controller: pageController,
                onPageChanged: (int index) {
                  if (index == 2) {
                    setState(() {
                      isLast = true;

                      print('last');
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }

                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SmoothPageIndicator(
                  controller: pageController,
                  count: 3,
                  effect: WormEffect(
                      spacing: 5,
                      dotHeight: 10,
                      dotWidth: 25,
                      activeDotColor: Colors.blue),
                ),
                Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if (isLast) {
                      submit();
                    }else{
                      pageController.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInCubic);
                    }

                  },
                  child: Icon(Icons.arrow_forward_ios),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget onBoarding({String image, String title, String body}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            child: Image(
          image: AssetImage(image),
        )),
        sBox(height: 40),
        Text(
          title,
          style: titleStyle,
        ),
        sBox(height: 40),
        Text(
          body,
          style: textStyle,
        ),
        sBox(height: 90),
      ],
    );
  }
}
