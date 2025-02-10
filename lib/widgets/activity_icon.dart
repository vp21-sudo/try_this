import 'package:flutter/material.dart';

IconData getActivityIcon(String type) {
  switch (type.toLowerCase()) {
    case 'recreational':
      return Icons.category;
    case 'education':
    case 'educational':
      return Icons.school;
    case 'social':
      return Icons.group;
    case 'fitness':
      return Icons.fitness_center;
    case 'creative':
      return Icons.brush;
    default:
      return Icons.help_outline; // Default icon for unspecified types
  }
}
