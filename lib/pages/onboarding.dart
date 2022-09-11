import 'package:flutter/material.dart';
import 'package:mirai_app/model/content_onboarding.dart';
import 'package:mirai_app/shared/theme.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
                controller: _controller,
                itemCount: contents.length,
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (_, i) {
                  return Container(
                    margin: EdgeInsets.only(top: 10.h),
                    child: Padding(
                      padding: EdgeInsets.all(40),
                      child: Column(
                        children: [
                          Image.asset(
                            contents[i].image,
                            height: 300,
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Text(
                            contents[i].title,
                            style: TextStyle(
                              color: primaryColor,
                              fontSize: 24,
                              fontWeight: semiBold,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            contents[i].description,
                            style: TextStyle(
                                color: greyColor,
                                fontSize: 16,
                                fontWeight: regular),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              contents.length,
              (index) => buildDot(index, context),
            ),
          ),
          Container(
            width: double.infinity,
            height: 55,
            margin: EdgeInsets.symmetric(vertical: 30, horizontal: 24),
            child: TextButton(
                onPressed: () {
                  if (currentIndex == contents.length - 1) {
                    Navigator.pushNamed(context, '/navbar');
                  }
                  _controller.nextPage(
                      duration: Duration(milliseconds: 100),
                      curve: Curves.bounceIn);
                },
                style: TextButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0))),
                child: Text(
                    currentIndex == contents.length - 1
                        ? 'GET STARTED'
                        : 'NEXT',
                    style: whiteTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: semiBold,
                    ))),
          ),
        ],
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 20 : 10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: primaryColor,
      ),
    );
  }
}
