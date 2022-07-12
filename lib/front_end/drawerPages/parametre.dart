import '../../instances.dart';
//import '../creations/dark_mode/dark.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import '../../back_end/export_all.dart';
import '../../front_end/creations/export_all.dart';
import '../../main.dart';
import '../../scénarisation/export_all.dart';


class SettingsPage extends StatefulWidget {
  SettingsPage({this.appr}) ;
  Apprenant appr;

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  void _changeLanguage(Language language) async {
    Locale _locale = await setLocale(language.languageCode);
    MyApp.setLocale(context, _locale);
  }

  @override
  Widget build(BuildContext context) {
    //ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);
    //bool _son = true, _notification = false, _modenuit = true;
    return Scaffold(
      backgroundColor: grey_black,
      appBar: appbar(getTranslated(context, "parametres"), context,trace: true,apprenant: widget.appr),
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
                    getTranslated(context, "changer la langue"),
                    style: TextStyle(color: darkblue),
                  ),
                  trailing: DropdownButton<Language>(
                    underline: SizedBox(),
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: red,
                      size: 40,
                    ),
                    onChanged: (Language language) {
                      _changeLanguage(language);
                    },
                    items: Language.languageList()
                        .map<DropdownMenuItem<Language>>(
                          (e) => DropdownMenuItem<Language>(
                            value: e,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[Text(e.name)],
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
                divider(red),
                SwitchListTile(
                  activeTrackColor: Color(0xFFE5E5E5),
                  inactiveTrackColor: Color(0xFFE5E5E5),
                  inactiveThumbColor: Color(0xFF989E9C),
                  activeColor: red,
                  value: son,
                  onChanged: (bool newValue) {
                    son = !son;
                  },
                  title: Text(
                    getTranslated(context, "son"),
                    style: TextStyle(color: darkblue),
                  ),
                  secondary: son
                      ?  Icon(
                          Icons.volume_up,
                          color: red,
                        )
                      : Icon(
                          Icons.volume_mute,
                          color: red,
                        ),
                ),
                divider(red),
                /*SwitchListTile(
                  activeTrackColor: Color(0xFFE5E5E5),
                  inactiveTrackColor: Color(0xFFE5E5E5),
                  inactiveThumbColor: Color(0xFF989E9C),
                  activeColor: red,
                  value: _notification,
                  onChanged: (val) {
                    _notification = !_notification;
                  },
                  title: Text(
                    getTranslated(context, "notification"),
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
                divider(red),*/
                SwitchListTile(
                  activeTrackColor: Color(0xFFE5E5E5),
                  inactiveTrackColor: Color(0xFFE5E5E5),
                  inactiveThumbColor: Color(0xFF989E9C),
                  activeColor: red,
                  value: dark_theme,
                  onChanged: (val) {
                    /*(_modenuit)?
                      _themeChanger.setTheme(ThemeData.light())
                    : _themeChanger.setTheme(ThemeData.dark());*/
                    changeTheme();
                    //_modenuit = !_modenuit;
                    //dark_theme = !dark_theme;
                    //print("object dark = $dark_theme");
                  },
                  title: Text(
                    getTranslated(context, "mode nuit"),
                    style: TextStyle(color: darkblue),
                  ),
                  secondary: dark_theme
                      ?  Icon(
                          Icons.brightness_6,
                          color: red,
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
}

Container divider(Color color) {
  return Container(
    width: double.infinity,
    height: 1.0,
    color: color,
    margin: const EdgeInsets.symmetric(horizontal: 8.0),
  );
}
