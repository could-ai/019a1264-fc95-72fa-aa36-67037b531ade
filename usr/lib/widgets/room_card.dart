import 'package:flutter/material.dart';
import '../models/room.dart';

class RoomCard extends StatefulWidget {
  final Room room;
  const RoomCard({Key? key, required this.room}) : super(key: key);

  @override
  _RoomCardState createState() => _RoomCardState();
}

class _RoomCardState extends State<RoomCard> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _showInfo = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: const Duration(milliseconds: 200), vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onHover(bool isHovering) {
    if (isHovering) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _onHover(true),
      onExit: (_) => _onHover(false),
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateX(_controller.value * 0.1)
              ..rotateY(_controller.value * 0.1),
            alignment: Alignment.center,
            child: Container(
              width: 300,
              height: 400,
              decoration: BoxDecoration(
                color: kWhite,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: kDeep.withOpacity(0.3),
                    blurRadius: 8 + (_controller.value * 4),
                    offset: Offset(0, 4 - (_controller.value * 2)),
                  ),
                ],
                image: DecorationImage(
                  image: AssetImage(widget.room.imagePath),
                  fit: BoxFit.cover,
                  opacity: 0.8,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${widget.room.type} Room',
                          style: TextStyle(color: kWhite, fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text('Capacity: ${widget.room.capacity}', style: TextStyle(color: kMint1)),
                        Text('Rate: \\\\$ ${widget.room.hourlyRate}/hr', style: TextStyle(color: kMint1)),
                        if (_showInfo) Text('Extra info: ${widget.room.description}', style: TextStyle(color: kWhite)),
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                // TODO: Add queue/reservation logic here (e.g., navigate to QuickReserveScreen or call API)
                                Navigator.pushNamed(context, '/reserve', arguments: widget.room);
                              },
                              child: Text('Reserve', style: TextStyle(color: kDeep)),
                            ),
                            IconButton(
                              icon: Icon(_showInfo ? Icons.expand_less : Icons.expand_more, color: kWhite),
                              onPressed: () => setState(() => _showInfo = !_showInfo),
                              tooltip: 'Toggle Info',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
