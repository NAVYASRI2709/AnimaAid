/// Global design constants used throughout AnimaAid.
///
/// Keeps spacing, radius, and animation values consistent
/// across all features.
abstract final class AppThemeConstants {
  // Spacing system
  static const double spacingXS = 4;
  static const double spacingSM = 8;
  static const double spacingMD = 16;
  static const double spacingLG = 24;
  static const double spacingXL = 32;

  // Border radius system
  static const double radiusSM = 8;
  static const double radiusMD = 12;
  static const double radiusLG = 20;

  // Animation durations
  static const Duration animationFast = Duration(milliseconds: 200);
  static const Duration animationNormal = Duration(milliseconds: 300);
}