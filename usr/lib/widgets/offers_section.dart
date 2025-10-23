import 'package:flutter/material.dart';
import '../data/mock_data.dart';

class OffersSection extends StatelessWidget {
  const OffersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Offer>>(
      future: MockData.loadOffers(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SizedBox(
            height: 300,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final offer = snapshot.data![index];
                return Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: Container(
                    width: 250,
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Text(offer.title, style: Theme.of(context).textTheme.headlineSmall),
                        Text(offer.description),
                        Text('Discount: ${(offer.discount * 100).toInt()}%'),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
