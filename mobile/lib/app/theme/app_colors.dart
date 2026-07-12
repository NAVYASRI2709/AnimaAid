import 'package:flutter/material.dart';

/// Central color system for AnimaAid.
///
/// All application colors should be defined here.
/// Widgets should consume colors through ThemeData.
abstract final class AppColors {
  // Brand identity
  static const Color primary = Color(0xFF2E7D32);

  // Rescue and emergency actions
  static const Color emergency = Color(0xFFD32F2F);

  // Positive states
  static const Color success = Color(0xFF388E3C);

  // Warning states
  static const Color warning = Color(0xFFF57C00);

  // Neutral surfaces
  static const Color background = Color(0xFFF8FAF8);
  static const Color surface = Color(0xFFFFFFFF);

  // Text colors
  static const Color textPrimary = Color(0xFF1B1B1B);
  static const Color textSecondary = Color(0xFF666666);

  // Utility
  static const Color border = Color(0xFFE0E0E0);
}