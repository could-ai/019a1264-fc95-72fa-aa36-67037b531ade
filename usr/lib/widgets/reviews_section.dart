import 'package:flutter/material.dart';
import '../data/mock_data.dart';

class ReviewsSection extends StatefulWidget {
  const ReviewsSection({super.key});

  @override
  State<ReviewsSection> createState() => _ReviewsSectionState();
}

class _ReviewsSectionState extends State<ReviewsSection> {
  final Map<String, bool> _expanded = {};

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Review>>(
      future: MockData.loadReviews(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Wrap(
            spacing: 16,
            runSpacing: 16,
            children: snapshot.data!.map((review) {
              final isExpanded = _expanded[review.id] ?? false;
              return Card(
                elevation: 4,
                child: Container(
                  width: 300,
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(backgroundImage: AssetImage(review.avatar), semanticLabel: 'User avatar'),
                          const SizedBox(width: 8),
                          Text(review.user),
                          const Spacer(),
                          Row(children: List.generate(5, (i) => Icon(i < review.rating ? Icons.star : Icons.star_border, color: Colors.amber))),
                        ],
                      ),
                      Text(isExpanded ? review.text : review.text.substring(0, 50) + '...'),
                      TextButton(
                        onPressed: () => setState(() => _expanded[review.id] = !isExpanded),
                        child: Text(isExpanded ? 'Show Less' : 'Show More'),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
