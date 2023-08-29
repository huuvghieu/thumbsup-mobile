import 'package:flutter/material.dart';
import 'package:my_app/common/color.dart';
import 'package:my_app/common/image.dart';

import '../welcome/welcome.dart';

class Menu extends StatelessWidget {
  const Menu({super.key, required this.onItemTapped});

  final ValueChanged<int> onItemTapped;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(30.0),
        topRight: Radius.circular(30.0),
      )),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Stack(
              children: [
                // Implement the stroke
                Text(
                  'Phạm Quốc Thịnh',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 0.8
                      ..color = Colors.black,
                  ),
                ),
                // The text inside
                const Text(
                  'Phạm Quốc Thịnh',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            accountEmail: null,
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.blue,
              child: ClipOval(
                child: Image.asset(logoImage),
              ),
            ),
            decoration: const BoxDecoration(
                color: AppColor.primaryDark,
                image: DecorationImage(
                    image: AssetImage(shopping), fit: BoxFit.fill)),
          ),
          const Divider(),
          ListTile(
              leading: const Icon(Icons.account_circle_rounded),
              iconColor: Colors.deepOrange,
              splashColor: AppColor.primary,
              title: const Text(
                "Hồ sơ của tôi",
                style: TextStyle(fontSize: 15.0),
              ),
              onTap: () => onItemTapped(4)),
          ListTile(
              leading: const Icon(Icons.article_rounded),
              iconColor: Colors.blue,
              splashColor: AppColor.primary,
              title: const Text(
                "Đơn hàng của tôi",
                style: TextStyle(fontSize: 15.0),
              ),
              onTap: () => onItemTapped(4)),
          ListTile(
              leading: const Icon(Icons.shopping_cart_rounded),
              iconColor: Colors.green,
              splashColor: AppColor.primary,
              title: const Text(
                "Giỏ hàng",
                style: TextStyle(fontSize: 15.0),
              ),
              onTap: () => onItemTapped(1)),
          ListTile(
              leading: const Icon(Icons.favorite_rounded),
              iconColor: Colors.pink,
              splashColor: AppColor.primary,
              title: const Text(
                "Yêu thích",
                style: TextStyle(fontSize: 15.0),
              ),
              onTap: () => onItemTapped(2)),
          ListTile(
              leading: const Icon(Icons.notifications_rounded),
              iconColor: AppColor.primaryDark,
              splashColor: AppColor.primary,
              title: const Text(
                "Thông báo",
                style: TextStyle(fontSize: 15.0),
              ),
              onTap: () => onItemTapped(3)),
          const Divider(),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.help_rounded),
            iconColor: Colors.black87,
            splashColor: AppColor.primary,
            title: const Text(
              "Hướng dẫn",
              style: TextStyle(fontSize: 15.0),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            iconColor: Colors.red,
            splashColor: AppColor.primary,
            title: const Text(
              "Đăng xuất",
              style: TextStyle(fontSize: 15.0),
            ),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const Welcome()),
                ModalRoute.withName('/welcome'),
              );
            },
          ),
        ],
      ),
    );
  }
}
