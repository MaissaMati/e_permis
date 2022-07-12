import 'package:e_permis/back_end/export_all.dart';

import '../../instances.dart';
import '../export_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'export_all.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ?   Colors.red : Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          decoration: BoxDecoration(
              color:Color(0xFF213159),

          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical:10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                Container(
                  height: 600.0,
                  child: PageView(
                    physics: ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(40.0),
                        child: SingleChildScrollView(
                          child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Image(
                                image: AssetImage(
                                  'assets/images/pageone.png',
                                ),
                                height: 300.0,
                                width: 300.0,
                              ),
                            ),
                            SizedBox(height: 25),
                            Text(
                              getTranslated(context, "bienvenu"),style:TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 40),
                            ),
                            SizedBox(height: 12),
                            SingleChildScrollView(
                              child: Text(
                              getTranslated(context, "on_boarding1_1"),style:TextStyle(color: Colors.white,fontSize: 15)
                            ),
                            )
                          ],
                        ),
                      
                        )
                      ),
                      Padding(
                        padding: EdgeInsets.all(40.0),
                        child: SingleChildScrollView(
                          child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(height: 80,),
                            Center(
                              child: Image(
                                image: AssetImage(
                                  'assets/images/pagetwo.png',
                                ),
                                height: 200.0,
                                width: 200.0,
                              ),
                            ),
                            SizedBox(height: 50.0),
                            Text( getTranslated(context, "on_boarding1_2"),style:TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 30),
                            ),
                            SizedBox(height: 15.0),
                            Text(getTranslated(context, "on_boarding1_3"),style:TextStyle(color: Colors.white,fontSize: 15)
                            ),
                          ],
                        ),
                        )
                      ),
                      Padding(
                        padding: EdgeInsets.all(40.0),
                        child: SingleChildScrollView(
                          child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Image(
                                image: AssetImage(
                                  'assets/images/pagethree.png',
                                ),
                                height: 250.0,
                                width: 250,
                              ),
                            ),
                            SizedBox(height: 25.0),
                            Text( getTranslated(context, "on_boarding1_4"),style:TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 30),
                            ),
                            SizedBox(height: 10),
                            Text( getTranslated(context, "on_boarding1_5"),style:TextStyle(color: Colors.white,fontSize: 15),
                            ),
                          ],
                        ),
                        )
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
               /* _currentPage != _numPages - 1
                    ? Expanded(
                  child: Align(
                    alignment: FractionalOffset.bottomRight,
                    child: FlatButton(
                      onPressed: () {
                        _pageController.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            'Suivant',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22.0,
                            ),
                          ),
                          SizedBox(width: 10.0),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 30.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ) : Text(''),*/
              ],
            ),
          ),
        ),
      ),
      bottomSheet: _currentPage == _numPages - 1
          ? Container(
        height: 80.0,
        width: double.infinity,
        color: Colors.white,
        child: OutlineButton(
          onPressed: () {
            Navigator.push( context,  MaterialPageRoute(builder: (context) => inscriptionPage()) );
          },
          //child: Center(
            //child: Padding(
              //padding: EdgeInsets.only(bottom:10.0),
              child: Text(
                getTranslated(context, "commencer"),
                style: TextStyle(
                  color: Colors.red[800],
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
           // ),
          ),
        //),
      )
          : Text(''),
    );
  }
}