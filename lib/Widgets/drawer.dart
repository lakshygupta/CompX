import 'package:flutter/material.dart';
import 'package:huncha/Helper/navigation.dart';
import 'package:huncha/Screens/User/Competitions.dart';
import 'package:huncha/Screens/User/mysubmissions.dart';
import 'package:huncha/Screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerWidget extends StatefulWidget {
  final String name;
  final String email;
  final String userId;
  DrawerWidget({this.name, this.email, this.userId});

  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.5), BlendMode.dstATop),
                    image: AssetImage("assets/userdrawerImg.png")),
              ),
              child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'CompX',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 40, color: Colors.black),
                        ),
                        Text(
                          'Welcome',
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.deepOrangeAccent[400]),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              widget.name,
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black),
                            ),
                            Text(
                              widget.email,
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black),
                            ),
                          ],
                        )
                      ])),
            ),
            ListTile(
              trailing: Icon(
                Icons.home,
                color: Colors.pinkAccent,
              ),
              title: Text('About CompX'),
              onTap: () {
                Navigator.pop(context);
                // changeScreen(context, widget);
              },
            ),
            ListTile(
              trailing: Icon(Icons.school, color: Colors.blue[800]),
              title: Text('View Competitions'),
              onTap: () {
                Navigator.pop(context);
                changeScreen(
                    context,
                    Competitions(
                      userId: widget.userId,
                    ));
              },
            ),
            ListTile(
              trailing: Icon(Icons.access_time, color: Colors.green[800]),
              title: Text('View my submissions'),
              onTap: () {
                Navigator.pop(context);
                changeScreen(
                    context,
                    MySubmission(
                      userId: widget.userId,
                    ));
              },
            ),
            Divider(),
            ListTile(
              trailing: Icon(Icons.exit_to_app, color: Colors.red),
              title: Text('Logout'),
              onTap: () async {
                SharedPreferences pref = await SharedPreferences.getInstance();
                pref.clear();
                changeScreenRepacement(context, LoginPage());
              },
            ),
          ],
        ),
      ),
    );
  }
}
