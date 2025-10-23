import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class Room {
  final String id;
  final String type;
  final int capacity;
  final double hourlyRate;
  final String imagePath;
  final String description;

  Room({required this.id, required this.type, required this.capacity, required this.hourlyRate, required this.imagePath, required this.description});

  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
      id: json['id'],
      type: json['type'],
      capacity: json['capacity'],
      hourlyRate: json['hourlyRate'],
      imagePath: json['imagePath'],
      description: json['description'],
    );
  }
}

class Offer {
  final String id;
  final String title;
  final String description;
  final double discount;

  Offer({required this.id, required this.title, required this.description, required this.discount});

  factory Offer.fromJson(Map<String, dynamic> json) {
    return Offer(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      discount: json['discount'],
    );
  }
}

class Review {
  final String id;
  final String user;
  final int rating;
  final String text;
  final String avatar;

  Review({required this.id, required this.user, required this.rating, required this.text, required this.avatar});

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      id: json['id'],
      user: json['user'],
      rating: json['rating'],
      text: json['text'],
      avatar: json['avatar'],
    );
  }
}

class Reservation {
  final String id;
  final String roomId;
  final String customerName;
  final String status;  // e.g., 'pending', 'confirmed'

  Reservation({required this.id, required this.roomId, required this.customerName, required this.status});

  factory Reservation.fromJson(Map<String, dynamic> json) {
    return Reservation(
      id: json['id'],
      roomId: json['roomId'],
      customerName: json['customerName'],
      status: json['status'],
    );
  }
}

class MockData {
  static Future<List<Room>> loadRooms() async {
    final jsonString = await rootBundle.loadString('assets/data/rooms.json');
    final List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((json) => Room.fromJson(json)).toList();
  }

  static Future<List<Offer>> loadOffers() async {
    final jsonString = await rootBundle.loadString('assets/data/offers.json');
    final List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((json) => Offer.fromJson(json)).toList();
  }

  static Future<List<Review>> loadReviews() async {
    final jsonString = await rootBundle.loadString('assets/data/reviews.json');
    final List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((json) => Review.fromJson(json)).toList();
  }

  static Future<List<Reservation>> loadQueue() async {
    final jsonString = await rootBundle.loadString('assets/data/queue.json');
    final List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((json) => Reservation.fromJson(json)).toList();
  }
}
