import 'package:flutter/material.dart';
import 'package:my_app/screens/profile/components/body.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, required this.onItemTapped});

  final ValueChanged<int> onItemTapped;
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,

        body: Body(),
      ),
    );
  }
}
