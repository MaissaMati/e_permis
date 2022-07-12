import 'package:e_permis/back_end/export_all.dart';
import 'package:flutter/material.dart';
import 'package:inview_notifier_list/inview_notifier_list.dart';
import '../creations/export_all.dart';
import '../export_pages.dart';

bool scrolling =false;

class Lecon_affichage extends StatefulWidget { 
  //final String name;
  //final List<Widget>list;
  Apprenant x;
  Lecon cour;
  bool btn;
  Lecon_affichage({/*@required this.name,@required this.list,*/@required this.btn,@required this.cour, @required this.x});
  @override
  _Lecon_affichageState createState() => _Lecon_affichageState(x,btn,cour);
}

class _Lecon_affichageState extends State<Lecon_affichage> {
  final Apprenant apprenant;
  final bool boutton;
  final Lecon lecon;

  _Lecon_affichageState(this.apprenant, this.boutton, this.lecon);

  ScrollController _scrollController;
  double _scrollPosition;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }


  @override
  Widget build(BuildContext context,) {
    return Scaffold(
      backgroundColor: white,
      body: /*GestureDetector(
        onVerticalDragUpdate: (DragUpdateDetails details) {
          /*if(isDraggedUp) {
            setState(() {
              _ignoreScrolling = false
            });          
          }*/
          print('\n \n scroooollled \n \n');
          // update height of container, omitted for simplicity
        },*/
        NotificationListener<ScrollNotification>(
        /*child: ListView(
          children: <Widget>[
          // containe huge/lengthy content.
          ],
        ),*/
        onNotification: (scrollNotification) {
             print('inside the onNotification');
              if (scrollNotification.metrics.axisDirection == AxisDirection.down) {
            print('scrolled down');
            scrolling=true;
            //the setState function
          }
          else if (scrollNotification.metrics.axisDirection == AxisDirection.up) {
                print(
              'scrolled up'); 
              scrolling=true;
              //setState function
           }        
        },
     // )
        child:CustomScrollView(
        
        controller: _scrollController,
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: darkblue,
            title: Text(getTranslated(context,lecon.nom),style: TextStyles.appBarTitle,),
            centerTitle: true,
            expandedHeight:250,
            pinned: true,
            //hna n7atou les photo fel appBar et comme mazal ma7ténahemche rahi commentaire 
            /*flexibleSpace:new FlexibleSpaceBar(
              background: Image(image: AssetImage(l.image),
              fit:  BoxFit.cover,
              ),
            )*/
          ),
          /*SliverList(
            delegate: SliverChildListDelegate(
               _list_widgets( lecon.page),
            )
          ),*/
          lecon.page,
          boutton ?
            button_quiz(context):
            sizedBox( 10,),
        ],
      )
       //   },
        //);
        //}
        ),
    );
  }

  Widget sizedBox(double h){
  return SliverToBoxAdapter(
    child: SizedBox(height: h,)
  );
}

  Widget button_quiz(BuildContext context){
  return SliverToBoxAdapter(
     child: Padding(
      padding:EdgeInsets.only(top:0, bottom: 10),
      child: FlatButton(
      onPressed: (){
                    if(apprenant.getTrace.archive_lecons == null ){
                      debugPrint('\n it is null \n');
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Quiz(a: apprenant, lecon: lecon, )  ), );
                      debugPrint('\n it is null \n');
                    }else{
                      debugPrint('\n it is not null \n');
                      apprenant.getTrace.archive_lecons.contains(lecon)? 
                        showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: //(BuildContext context) {   return _testpasse();     },
                          (BuildContext context) => CustomDialog(
                            title:  getTranslated(context, "passer_test?"),
                            description:  getTranslated(context, "test_deja_passe"),
                            buttonText: getTranslated(context, "d'accord!"),
                            icon: Icons.assignment_turned_in, 
                            ap:apprenant,
                            page: 'pop',
                          ),
                        ):
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Quiz(a: apprenant, lecon: lecon, )  ), );
                    }
                  },
        child:Container(
          height: 40,
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color:red,width: 3.0,),
          ),
          child:Center(child: Text(getTranslated(context, "Passer le test"),style: TextStyles.headingTextStyle)),
        )
      ),
    )
  );
}
}
