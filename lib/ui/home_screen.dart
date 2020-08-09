import 'package:flutter/material.dart';
import 'package:loja_virtual/ui/tabs/category_tab.dart';
import 'package:loja_virtual/ui/tabs/home_tab.dart';
import 'package:loja_virtual/ui/widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Scaffold(
          body: HomeTab(),
          drawer: CustomDrawer(_pageController),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text("Category"),
            backgroundColor: Theme.of(context).primaryColor,
          ),
          body: CategoryTab(),
          drawer: CustomDrawer(_pageController),
        ),
      ],
    );
  }
}
