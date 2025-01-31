import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({super.key});

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 200,
      backgroundColor: Colors.white70,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.white60),
            child: Center(
              child: Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none, // <-- Permet aux enfants de dépasser
                children: [
                  // Ajustez selon votre besoin
                  CircleAvatar(
                    radius: 50,
                    backgroundImage:
                        AssetImage('assets/images/default_user.jpeg'),
                  ),
                  Positioned(
                    top: 50,
                    left: 65,
                    child: IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        'assets/svg/camera.svg',
                        width: 24,
                        height: 24,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Positioned(
                      bottom: -25,
                      child: Text(
                        'Username',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ))
                ],
              ),
            ),
          ),
          // Ajoutez d'autres éléments de menu
          ListTile(title: Text("Profil"), onTap: () {}),
          ListTile(title: Text("Paramètres"), onTap: () {}),
        ],
      ),
    );
  }
}
