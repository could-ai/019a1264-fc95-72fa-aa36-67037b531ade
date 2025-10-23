import 'package:flutter/material.dart';
import '../data/mock_data.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  List<Room> _rooms = [];
  List<Reservation> _queue = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() async {
    _rooms = await MockData.loadRooms();
    _queue = await MockData.loadQueue();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Admin Dashboard')),
      body: Row(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _rooms.length,
              itemBuilder: (context, index) {
                final room = _rooms[index];
                return ListTile(
                  title: Text('${room.type} Room'),
                  subtitle: Text('Status: Free'),  // TODO: Add dynamic status
                  trailing: ElevatedButton(onPressed: () {}, child: const Text('Assign')),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _queue.length,
              itemBuilder: (context, index) {
                final res = _queue[index];
                return ListTile(
                  title: Text('Queue: ${res.customerName}'),
                  subtitle: Text('Status: ${res.status}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(onPressed: () => setState(() => res.status = 'confirmed'), child: const Text('Confirm')),
                      ElevatedButton(onPressed: () => setState(() => res.status = 'no-show'), child: const Text('No Show')),
                    ],
                  ),
                );
              },
            ),
          ),
          // Pending check-ins similar
        ],
      ),
    );
  }
}
