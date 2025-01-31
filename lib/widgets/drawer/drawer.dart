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
      backgroundColor: Colors.white70,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Stack(
              clipBehavior: Clip.none, // <-- Permet aux enfants de dépasser
              children: [
                Positioned(
                  left: 0,
                  top: -20, // Ajustez selon votre besoin
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage:
                        AssetImage('assets/images/default_user.jpeg'),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      'assets/svg/camera.svg',
                      width: 24,
                      height: 24,
                    ),
                  ),
                )
              ],
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
