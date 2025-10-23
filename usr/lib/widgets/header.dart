import 'package:flutter/material.dart';
import '../data/mock_data.dart';
import '../models/room.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kDeep,
      title: Row(
        children: [
          Image.asset('assets/images/logo.png', height: 40, semanticLabel: 'KTV Logo'),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search rooms...',
                border: InputBorder.none,
                hintStyle: TextStyle(color: kMint1),
              ),
              style: TextStyle(color: kWhite),
            ),
          ),
          PopupMenuButton<String>(
            child: const Text('Rooms', style: TextStyle(color: kMint1)),
            itemBuilder: (context) => ['Small', 'Medium', 'Large', 'VIP'].map((e) => PopupMenuItem(value: e, child: Text(e))).toList(),
          ),
          // Similar for Offers, About, Contact
          ElevatedButton(onPressed: () {}, child: const Text('Login / Quick Reserve')),
        ],
      ),
    );
  }
}
