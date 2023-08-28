import 'package:flutter/material.dart';
import 'package:my_app/common/color.dart';
import 'package:my_app/screens/product/product.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.index});

  final int index;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static late List<Widget> _widgetOptions;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.index;
    _widgetOptions = <Widget>[
      Product(onItemTapped: _onItemTapped),
      const Text(
        'Index 1: Cart',
        style: optionStyle,
      ),
      const Text(
        'Index 2: Wishlist',
        style: optionStyle,
      ),
      const Text(
        'Index 3: Notification',
        style: optionStyle,
      ),
      const Text(
        'Index 4: Profile',
        style: optionStyle,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Trang chủ',
            backgroundColor: AppColor.primary,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_rounded),
            label: 'Giỏ hàng',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_rounded),
            label: 'Yêu thích',
            backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Thông báo',
            backgroundColor: Colors.pink,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_rounded),
            label: 'Tài khoản',
            backgroundColor: Colors.teal,
          ),
        ],
        currentIndex: _selectedIndex,
        // selectedItemColor: Colors.amber[800],
        selectedItemColor: AppColor.primaryDarkBold,
        onTap: _onItemTapped,
      ),
    );
  }
}
