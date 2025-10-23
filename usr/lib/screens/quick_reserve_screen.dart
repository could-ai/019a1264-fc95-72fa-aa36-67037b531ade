import 'package:flutter/material.dart';

class QuickReserveScreen extends StatelessWidget {
  const QuickReserveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Room? room = ModalRoute.of(context)?.settings.arguments as Room?;
    return Scaffold(
      appBar: AppBar(title: const Text('Quick Reserve')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text('Available slots for ${room?.type ?? 'Room'}'),  // Mock availability
            TextFormField(decoration: const InputDecoration(labelText: 'Name')),
            TextFormField(decoration: const InputDecoration(labelText: 'Phone')),
            TextFormField(decoration: const InputDecoration(labelText: 'Group Size')),
            CheckboxListTile(title: const Text('Save Account'), value: false, onChanged: (v) {}),
            ElevatedButton(onPressed: () {}, child: const Text('Reserve')),
            const Text('If unavailable, join queue'),  // TODO: Add queue logic
          ],
        ),
      ),
    );
  }
}
