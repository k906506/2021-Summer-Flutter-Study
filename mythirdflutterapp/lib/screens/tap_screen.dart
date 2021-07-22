import 'package:flutter/material.dart';
import '/models/meal.dart';
import '../widgets/main_drawer.dart';
import 'category_screen.dart';
import 'favorites_screen.dart';

class TapScreen extends StatefulWidget {
  late final List<Meal> favoriteMeals;

  TapScreen(this.favoriteMeals);

  @override
  _TapScreenState createState() => _TapScreenState();
}

class _TapScreenState extends State<TapScreen> {
  late List<Widget> _pages;

  int _selectedPageIndex = 0;

  void initState(){
    _pages = [
      CategoriesScreen(),
      FavoritesScreen(widget.favoriteMeals),
    ];
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Meals"),
          //   bottom: TabBar(
          //     tabs: <Widget>[
          //       Tab(
          //         icon: Icon(
          //           Icons.category,
          //         ),
          //         text: "Categories",
          //       ),
          //       Tab(
          //         icon: Icon(
          //           Icons.star,
          //         ),
          //         text: "favorites",
          //       ),
          //     ],
          //   ),
        ),
        drawer: MainDrawer(),
        body: _pages[_selectedPageIndex],
        // TabBarView(
        //   children: <Widget>[
        //     CategoriesScreen(),
        //     FavoritesScreen(),
        //   ],
        // ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          backgroundColor: Theme.of(context).primaryColor,
          selectedItemColor: Theme.of(context).accentColor,
          unselectedItemColor: Colors.white,
          currentIndex: _selectedPageIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.category,
              ),
              title: Text('Categories'),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.star,
              ),
              title: Text('Favorites'),
            ),
          ],
        ),
      ),
    );
  }
}
