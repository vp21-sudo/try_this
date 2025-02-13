import 'package:flutter/material.dart';

IconData getActivityIcon(String type) {
  switch (type.toLowerCase()) {
    case 'recreational':
      return Icons.category;
    case 'social':
      return Icons.group;
    case 'education':
    case 'educational':
      return Icons.school;
    case 'relaxation':
      return Icons.spa; // Spa for relaxation
    case 'charity':
      return Icons.volunteer_activism; // Heart and hand symbol for charity
    case 'cooking':
      return Icons.restaurant_menu; // Cooking/food icon
    case 'diy':
      return Icons.handyman; // DIY tools icon
    case 'music':
      return Icons.music_note;
    case 'sports':
      return Icons.sports_soccer; // Generic sports icon
    case 'travel':
      return Icons.flight_takeoff; // Airplane icon for travel
    case 'health':
      return Icons.health_and_safety; // Health symbol
    case 'fitness':
      return Icons.fitness_center;
    case 'technology':
      return Icons.computer;
    case 'arts':
      return Icons.palette; // Painting palette for arts
    case 'games':
      return Icons.videogame_asset; // Gaming controller icon
    case 'reading':
      return Icons.menu_book; // Open book for reading
    case 'writing':
      return Icons.create; // Writing/editing icon
    case 'meditation':
      return Icons.self_improvement; // Person meditating
    default:
      return Icons.help_outline; // Default icon for unspecified types
  }
}
