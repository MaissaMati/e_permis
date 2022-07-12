import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../creations/export_all.dart';


class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool _son = true, _notification = false, _modenuit = true;
    return Scaffold(
      backgroundColor: Color(0xFFE5E5E5),
      appBar: appbar("parametres", context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 16.0),
          Card(
            elevation: 5.0,
            margin: const EdgeInsets.fromLTRB(32.0, 16.0, 32.0, 16.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Icon(
                    Icons.translate,
                    color: red,
                  ),
                  title: Text(
                    "changer la langue",
                    style: TextStyle(color: darkblue),
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    //changer  la langue;
                    navigateToSubPage(context);
                  },
                ),
                divider(red),
                SwitchListTile(
                  activeTrackColor: Color(0xFFE5E5E5),
                  inactiveTrackColor: Color(0xFFE5E5E5),
                  inactiveThumbColor: Color(0xFF989E9C),
                  activeColor: red,
                  value: _son,
                  onChanged: (bool newValue) {
                    _son = newValue;
                  },
                  title: Text(
                    "son",
                    style: TextStyle(color: darkblue),
                  ),
                  secondary: _son
                      ? const Icon(
                          Icons.volume_up,
                          color: Color(0xFFF04B4C),
                        )
                      : Icon(
                          Icons.volume_mute,
                          color: red,
                        ),
                ),
                divider(red),
                SwitchListTile(
                  activeTrackColor: Color(0xFFE5E5E5),
                  inactiveTrackColor: Color(0xFFE5E5E5),
                  inactiveThumbColor: Color(0xFF989E9C),
                  activeColor: red,
                  value: _notification,
                  onChanged: (val) {
                    _notification = !_notification;
                  },
                  title: Text(
                    "notification",
                    style: TextStyle(color: darkblue),
                  ),
                  secondary: _notification
                      ? Icon(
                          Icons.notifications_active,
                          color: red,
                        )
                      : Icon(
                          Icons.notifications_off,
                          color: red,
                        ),
                ),
                divider(red),
                SwitchListTile(
                  activeTrackColor: Color(0xFFE5E5E5),
                  inactiveTrackColor: Color(0xFFE5E5E5),
                  inactiveThumbColor: Color(0xFF989E9C),
                  activeColor: red,
                  value: _modenuit,
                  onChanged: (val) {
                    _modenuit = !_modenuit;
                  },
                  title: Text(
                    "mode nuit",
                    style: TextStyle(color: darkblue),
                  ),
                  secondary: _modenuit
                      ? const Icon(
                          Icons.brightness_6,
                          color: Color(0xFFF04B4C),
                        )
                      : Icon(
                          Icons.brightness_5,
                          color: red,
                        ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Future navigateToSubPage(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LanguePage()));
  }
}

class LanguePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey,
      appBar: appbar("langues", context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 16.0),
          Card(
            elevation: 5.0,
            margin: const EdgeInsets.fromLTRB(32.0, 16.0, 32.0, 16.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Container(
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white,
              ),
              child: ListTile(
                title: Text(
                  "Français",
                  style: TextStyle(color: red),
                ),
                onTap: () {
                  //langue==Français;
                  backToMainPage(context);
                },
              ),
            ),
          ),
          Card(
            elevation: 5.0,
            margin: const EdgeInsets.fromLTRB(32.0, 10.0, 32.0, 16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Container(
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white,
              ),
              child: ListTile(
                title: Text(
                  "arabe",
                  style: TextStyle(color: red),
                ),
                onTap: () {
                  //langue==arabe;
                  backToMainPage(context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void backToMainPage(context) {
    Navigator.pop(context);
  }
}



Container divider(Color color) {
  return Container(
    width: double.infinity,
    height: 1.0,
    color: color,
    margin: const EdgeInsets.symmetric(horizontal: 8.0),
  );
}

class RadiantGradientMask extends StatelessWidget {
  RadiantGradientMask({this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => RadialGradient(
        center: Alignment.topLeft,
        radius: 0.8,
        colors: [
          darkblue,
          bleu,
        ],
        tileMode: TileMode.mirror,
      ).createShader(bounds),
      child: child,
    );
  }
}


