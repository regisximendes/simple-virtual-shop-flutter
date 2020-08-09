import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  DrawerTile(this.icon, this.text, this._pageController, this._page);

  final IconData icon;
  final String text;
  final PageController _pageController;
  final int _page;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.of(context).pop();
          _pageController.jumpToPage(_page);
        },
        child: Container(
          height: 60,
          child: Row(
            children: <Widget>[
              Icon(
                icon,
                size: 32,
                color: _pageController.page.round() == _page
                    ? Theme.of(context).primaryColor
                    : Colors.grey[700],
              ),
              SizedBox(
                width: 32,
              ),
              Text(
                text,
                style: TextStyle(
                    color: _pageController.page.round() == _page
                        ? Theme.of(context).primaryColor
                        : Colors.grey[700],
                    fontSize: 24,
                    fontWeight: FontWeight.w300),
              )
            ],
          ),
        ),
      ),
    );
  }
}
