import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/commons/icon_images_helper.dart';
import 'package:rick_and_morty_app/screens/characters_screen/character_screen.dart';
import 'package:rick_and_morty_app/screens/episodes_screen/episodes_screen.dart';
import 'package:rick_and_morty_app/screens/location_screen/location_screen.dart';
import 'package:rick_and_morty_app/screens/settings_screen/settings_screen.dart';

class BottomNavigationWidget extends StatefulWidget {
  final int currentIndex;
  const BottomNavigationWidget({Key? key, required this.currentIndex})
      : super(key: key);

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
 late int _selectedIndex;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _widgetOptions = <Widget>[
    const CharacterScreen(),
    const LocationScreen(),
    const EpisodesScreen(),
    const SettingsScreen(),
  ];

  @override
  void initState() {
     _selectedIndex = widget.currentIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        selectedItemColor: const Color(0xff22A2BD),
        unselectedItemColor: const Color(0xffBDBDBD),
        items: [
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage(IconImagesHelper.characterIcon),
            ),
            label: 'Персонажи',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage(IconImagesHelper.locationIcon),
            ),
            label: 'Локации',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage(IconImagesHelper.episodesIcon),
            ),
            label: 'Эпизоды',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage(IconImagesHelper.settingsIcon),
            ),
            label: 'Настройки',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
