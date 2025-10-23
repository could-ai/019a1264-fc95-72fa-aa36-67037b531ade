import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kDeep,
      padding: const EdgeInsets.all(32),
      child: Column(
        children: [
          Text('Contact Us', style: TextStyle(color: kWhite, fontSize: 24)),
          const SizedBox(height: 16),
          TextFormField(decoration: const InputDecoration(labelText: 'Name')),
          TextFormField(decoration: const InputDecoration(labelText: 'Email')),
          TextFormField(decoration: const InputDecoration(labelText: 'Message'), maxLines: 3),
          ElevatedButton(onPressed: () {}, child: const Text('Send')),
          const SizedBox(height: 16),
          Text('Phone: 123-456-7890 | Address: 123 KTV St | Map Placeholder', style: TextStyle(color: kMint1)),
          Row(children: [IconButton(icon: const Icon(Icons.facebook, color: kMint1), onPressed: () {}), /* Social links */]),
        ],
      ),
    );
  }
}
