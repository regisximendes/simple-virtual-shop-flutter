import 'package:flutter/material.dart';
import 'package:loja_virtual/ui/sign_in_screen.dart';
import 'package:loja_virtual/ui/widgets/DrawerTile.dart';

class CustomDrawer extends StatelessWidget {
  final PageController _pageController;

  CustomDrawer(this._pageController);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: <Widget>[
          _buildDrawerBackground(),
          ListView(
            padding: EdgeInsets.only(left: 32, top: 16),
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 8),
                padding: EdgeInsets.fromLTRB(0, 16, 16, 8),
                height: 170,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      child: Text(
                        "Flutter Shops",
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold),
                      ),
                      top: 8,
                    ),
                    Positioned(
                      bottom: 0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Welcome",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen()));
                            },
                            child: Text(
                              "SignIn or signUp",
                              style: TextStyle(
                                  color: Colors.pinkAccent,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Divider(),
              DrawerTile(Icons.home, "Home", _pageController, 0),
              DrawerTile(Icons.list, "Category", _pageController, 1),
              DrawerTile(
                  Icons.location_on, "Store Locator", _pageController, 2),
              DrawerTile(
                  Icons.playlist_add_check, "My Orders", _pageController, 3)
            ],
          )
        ],
      ),
    );
  }

  Widget _buildDrawerBackground() => Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Color.fromARGB(255, 211, 118, 130), Colors.white],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
        ),
      );
}
