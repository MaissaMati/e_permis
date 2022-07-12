import 'package:e_permis/back_end/export_all.dart';
import 'package:e_permis/front_end/creations/colors.dart';
import 'package:flutter/material.dart';


class P extends StatefulWidget {
  Apprenant _apprenant;
  P(this._apprenant);
  @override
  State<StatefulWidget> createState() => new _PState(a: _apprenant);
}

class _PState extends State<P> {
  final Apprenant a;
  _PState({@required this.a});
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
        children: <Widget>[
          ClipPath(
            child:Container(
              color: bleu,),
              clipper: getClipper(),
             ),
          Positioned(
            width: 400.0,
            top: MediaQuery.of(context).size.height/5,
            child: Column(
              children: <Widget>[
                Container(
                  width: 150.0,
                  height: 150.0,
                  decoration: BoxDecoration(
                    color: grey,
                    image: DecorationImage(
                      image: NetworkImage('https://www.google.com/url?sa=i&url=https%3A%2F%2Fblog-fr.orson.io%2Fweb-design%2Fjpeg-ou-png&psig=AOvVaw0waHO4ofbE2Pbgysbi3-u0&ust=1585321706280000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCPjPpMC1uOgCFQAAAAAdAAAAABAL'),
                      fit: BoxFit.cover
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(90.0)),
                    boxShadow:[
                     BoxShadow(blurRadius: 100.0,color: Colors.black,),]
                  ),
                ),
              SizedBox(height: 90.0, ),  
              Text(a.nom, style:  TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, ),),
              SizedBox(height: 15.0, ),  
              Text(a.email, style:  TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, ),),
                SizedBox(height: 30.0, ),
              FlatButton(
                onPressed: () {},
                child: Text('modifier le profile'),
                color: red,
              ),
            ],
            ),
          ),
        ],
      ),
    );
  }
}

class getClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height/1.9);
    path.lineTo(size.width+125, 0.0);
    path.close();
    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return null;
  }
}
