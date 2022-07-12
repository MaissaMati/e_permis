//import 'package:e_permis/maissa/trace.dart';
import '../export_pages.dart';
import 'package:flutter/material.dart'  ;
import '../../back_end/export_all.dart';
import '../creations/export_all.dart';
import 'package:flutter/services.dart';
class OnboardingScreen2 extends StatefulWidget {
  Apprenant apprenant;
  OnboardingScreen2(this.apprenant);
  @override
  _OnboardingScreenState2 createState() => _OnboardingScreenState2(a:apprenant);
}
class _OnboardingScreenState2 extends State<OnboardingScreen2> {
  final int _numPages = 2;
  final PageController _pageController = PageController(initialPage: 0);
  final Apprenant a;
  _OnboardingScreenState2({@required this.a});
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
      height: 6.0,
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
                  height: 590.0,
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
                          child:Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(height: 40,),
                           Center(

                              child: Text(getTranslated(context, "Salut")+'  ${a.nom} !',style: TextStyle(color:Colors.white,fontSize:30,fontWeight:FontWeight.bold,),),
                            ),
                            Divider(height:80,color:Colors.white),
                            Text(getTranslated(context, "on_boarding2_1"),style: TextStyle(color:Colors.white,fontSize:15,fontWeight:FontWeight.bold,),textDirection: TextDirection.ltr,),
                             SizedBox(height: 40,),
                            Image (image:AssetImage('assets/images/pagefour.png',),  height: 200.0, width: 400.0,),
                            ],
                        ),
                        )
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(40, 100, 40, 40),
                        child: SingleChildScrollView(
                          child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            //SizedBox(height:60,),
                            Text (getTranslated(context, "on_boarding2_2"), style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 20)),
                            Divider(height:90,color:Colors.white),
                            FlatButton(
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => TestCatego(apnt: a)  ), );
                              },
                              child : FadeAnimation(0.5, Container(
                                height: 52,
                                margin: EdgeInsets.symmetric(horizontal:3,vertical: 30),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Color(0xFFE7E7E7),
                                ),
                                child: Center(
                                  child: Text(getTranslated(context, "on_boarding2_3"), style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 15),textAlign: TextAlign.center),
                                ),
                              )),
                            ),
                            FlatButton(
                              onPressed: (){
                                Navigator.push(context,MaterialPageRoute(builder: (context) => TracePage(a) ),);
                              },
                              child : FadeAnimation(0.5, Container(
                                height: 52,
                                margin: EdgeInsets.symmetric(horizontal:3,vertical: 30),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Color(0xFFE7E7E7),
                                ),
                                child: Center(
                                  child: Text(getTranslated(context, "on_boarding2_4"), style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize:15,),textAlign: TextAlign.center,),
                                ),
                              )),
                            ),
                        ],
                      ),
                      
                        ),
                      ),
                  ],),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _buildPageIndicator(),
                ),
                _currentPage != _numPages - 1
                    ? Expanded(
                  child: Align(
                    alignment: FractionalOffset.bottomRight,
                    child: FlatButton(
                      child: null,
                      onPressed: () {
                        _pageController.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                      },

                    ),
                  ),
                ) : Text(''),
              ],
            ),
            ),
        ),),);


  }

}