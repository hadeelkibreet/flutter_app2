import 'package:flutter/material.dart';
import 'package:flutter_app2/moduls/shop_app/shop_login/shop_login.dart';
import 'package:flutter_app2/netWork/local/cache_helper.dart';
import 'package:flutter_app2/shared/components/components.dart';
import 'package:flutter_app2/shared/styles/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class boardingmodel
{
  final String title;
  final String image;
  final String body;
  boardingmodel({
    required this.title,
    required this.image,
    required this.body,

  });

}

class onboardingscreen extends StatefulWidget {
  @override
  _onboardingscreenState createState() => _onboardingscreenState();
}

class _onboardingscreenState extends State<onboardingscreen> {
  var boardcontroller = PageController();
  List<boardingmodel> boarding=
  [
    boardingmodel(
        title: 'on board 1 title',
        image: 'assets/images/onboard_1.png',
        body: 'on board 1 body'),
    boardingmodel(
        title: 'on board 2 title',
        image: 'assets/images/onboard_1.png',
        body: 'on board 2 body'),
    boardingmodel(
        title: 'on board 3 title',
        image: 'assets/images/onboard_1.png',
        body: 'on board 3 body')
  ];
  bool lastindex=false;
  void submit()
  {
    CacheHelper.saveData(Key1: 'onBoarding', value1: true);
    NavigatorFinish(context,shoploginscreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       actions: [
         TextButton(onPressed: submit
             , child: Text('SKIP',
         style: TextStyle(
           fontSize: 20.0
         ),
         ))
       ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: PageView.builder(
                controller: boardcontroller,
                onPageChanged:(int index) {
                  if(index== boarding.length-1)
                  {
                    setState(() {
                      lastindex=true;

                    });
                  }else{
                    setState(() {
                      lastindex=false;

                    });
                  }
                },
                physics: BouncingScrollPhysics() ,
                itemBuilder:(context,inex)=> buildBoardingItem(boarding[inex]),
                itemCount: boarding.length,
              ),
            ),
            SizedBox(
              height:40 ,),
            Row(
              children: [
                SmoothPageIndicator(controller: boardcontroller, count: boarding.length,
                effect: ExpandingDotsEffect(
                  dotColor: Colors.grey,
                  dotHeight: 10,
                  dotWidth: 10,
                  spacing: 4,
                  activeDotColor: defaultcolor,
                  expansionFactor: 4
                ),
                ),
                Spacer(),
                FloatingActionButton(onPressed: ()
                {

                  if(lastindex){
                    submit();
                  }else{
                    boardcontroller.nextPage(duration: Duration(
                        milliseconds: 750
                    ),
                        curve: Curves.fastLinearToSlowEaseIn);
                  }

                },
                child: Icon(
                   Icons.arrow_forward_ios_sharp
                ),
                )
              ],
            ),
            SizedBox(
              height:20 ,),

          ],
        ),
      ) ,
    );
  }
  Widget buildBoardingItem(boardingmodel model)
  {
  return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Image(
            image: AssetImage('${model.image}'),
          ),
        ),
        SizedBox(
          height: 30.0,
        ),
        Text(
          '${model.title}',
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          '${model.body}',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
