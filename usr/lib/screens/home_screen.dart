import 'package:flutter/material.dart';
import '../data/mock_data.dart';
import '../widgets/header.dart';
import '../widgets/room_card.dart';
import '../widgets/offers_section.dart';
import '../widgets/reviews_section.dart';
import '../widgets/footer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  double _parallaxOffset = 0.0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_updateParallax);
  }

  void _updateParallax() {
    setState(() {
      _parallaxOffset = _scrollController.offset * 0.5;  // Slower layer
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            // Hero Section with Parallax
            Stack(
              children: [
                Transform.translate(
                  offset: Offset(0, _parallaxOffset),
                  child: Container(
                    height: 600,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/hero_bg.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 600,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, kMint1.withOpacity(0.8)],
                    ),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Royal KTV Experience', style: Theme.of(context).textTheme.headlineLarge?.copyWith(color: kWhite)),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(onPressed: () {}, child: const Text('Reserve Now')),
                            const SizedBox(width: 20),
                            ElevatedButton(onPressed: () {}, child: const Text('View Offers')),
                          ],
                        ),
                        // Music control (placeholder)
                        IconButton(
                          icon: const Icon(Icons.play_arrow, color: kWhite),
                          onPressed: () {},  // TODO: Add audio playback
                          tooltip: 'Play Music',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            // Header (fixed at top via app bar or stack)
            const Header(),
            // Room Gallery
            FutureBuilder<List<Room>>(
              future: MockData.loadRooms(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) => RoomCard(room: snapshot.data![index]),
                  );
                }
                return const CircularProgressIndicator();
              },
            ),
            // Other sections
            const OffersSection(),
            const ReviewsSection(),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
