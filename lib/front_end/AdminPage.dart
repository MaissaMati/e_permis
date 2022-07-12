import 'package:flutter/material.dart';

class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.tealAccent[400],//Color(0xFF32E4AE),
        leading: Icon(Icons.arrow_back),
        title: Text('Admin.'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
      body: Container( 
        margin: const EdgeInsets.all(15.0),
        /*decoration: BoxDecoration(
          border: Border.all(color: Colors.blueAccent),
          shape: BoxShape.rectangle,
        ),*/   
        padding: EdgeInsets.all(2),         
        height: 640,  
        width: 450, 
        child: Column(
          children: <Widget>[ 
            SizedBox(height: 20,),     
            Card( 
              //color: Colors.orange[300],
              shape: RoundedRectangleBorder(
                side: new BorderSide(color: Colors.orange[300], width: 1.4),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(15),
                  top: Radius.circular(15),
                ),
              ),
              child: ProfilAdmin(),
            ),
            SizedBox(height: 50,),
            Container(
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,                
                crossAxisSpacing: 20,
                padding: EdgeInsets.all(10),
                children: List.generate(
                  choices.length, (index) {
                    return Center(
                      child: Un_bouton(choice: choices[index]),
                    );
                  }
                )
              ),
            )
          ],
        )
      )
    );
  }
}


class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Recherche Apprenant', icon: Icons.search),
  const Choice(title: 'Supprimer Apprenant', icon: Icons.delete),
  const Choice(title: 'Modifier Lecon', icon: Icons.change_history),
  const Choice(title: 'extra', icon: Icons.directions_car),
];
                
class Un_bouton extends StatelessWidget {
  const Un_bouton({Key key, this.choice}) : super(key: key);
  final Choice choice;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {},
      color: Colors.white,

      shape: RoundedRectangleBorder(
        side: new BorderSide(color: Colors.black45, width: 1.4),
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(15),
          top: Radius.circular(15),
        ),
      ),
      child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20),
              Center(
                child: Icon(
                  this.choice.icon,
                  size : 50  ,
                  color: Colors.tealAccent[400],//Color(0xFF32E4AE),
                ),
              ),
              SizedBox(height: 8,),
              Text(
                this.choice.title,
                overflow: TextOverflow.fade,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.orange[300],
                ),
              ),
              SizedBox(height: 25),
            ],
          ),
    );
  }
}
                  
class ProfilAdmin extends StatelessWidget {   
  /*ProfilAsmin({Key key, this.name, this.description, this.price, this.image})       : super(key: key); */
 
  Widget build(BuildContext context) {     
    return Row(                 
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,                 
          children: <Widget>[                           
            Expanded(                   
              child: Container(  
                margin: const EdgeInsets.all(15.0),
                /*decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueAccent)
                ),*/                    
                padding: EdgeInsets.symmetric(),                       
                child: Column(                         
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,                         
                  children: <Widget>[  
                    Text(
                      'Name : Admin',                               
                      style: TextStyle(
                        //decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      )
                    ),
                    SizedBox(height: 20,),
                    Text(
                     'E mail : Admin@esi.dz',                               
                      style: TextStyle(
                        /*decoration: TextDecoration.underline,
                        decorationColor: Colors.orange[300],
                        decorationThickness: 3,*/
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      )
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child:  Card(

                clipBehavior: Clip.antiAlias,
                child: Image.asset(
                  "images/cutie.jpg",
                  height: 80,

                ),
                /*Icon(
                  Icons.person,
                  size: 85,
                  color: Colors.grey,
                ),*/
              
              shape: RoundedRectangleBorder(
                side: new BorderSide(color: Colors.black45, width: 1.2),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(20),
                  top: Radius.circular(20),
                ),  
              ),
            )
            )
          ]
        );
     // )
    //)
  } 
} 