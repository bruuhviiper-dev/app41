import 'package:flutter/material.dart';

/// Tokens de COR — tema SAGRADO (azul meia-noite + dourado sagrado).
/// Nenhuma tela usa cor "solta"; sempre referenciar daqui.
/// O token `gold` é o acento principal dourado (mantém o nome do template).
class AppColors {
  AppColors._();

  // Fundo (azul meia-noite profundo)
  static const bg = Color(0xFF070B1A);
  static const bg2 = Color(0xFF0D1229);
  static const surface = Color(0xFF122048);
  static const surfaceHigh = Color(0xFF1A2E5A);

  // Acento principal (dourado sagrado — nome `gold` herdado do template)
  static const gold = Color(0xFFD4A843);
  static const goldDark = Color(0xFFB08A2E);

  // Azul celeste (destaques secundários)
  static const azure = Color(0xFF4A90D9);
  static const azureLight = Color(0xFF7AB3E8);

  // Texto
  static const textPrimary = Color(0xFFF0EFF8);
  static const textSecondary = Color(0xFF8A9BC4);

  // Bordas
  static const border = Color(0xFF1E2E55);

  /// Pílula translúcida do acento (badge "SALMO DO DIA").
  static Color get goldPill => gold.withValues(alpha: 0.16);

  /// Sobreposição em elementos sobre foto/gradiente.
  static Color get onPhotoSurface => Colors.white.withValues(alpha: 0.14);

  // ---- Tema CLARO (pergaminho/creme) ----
  static const lBg = Color(0xFFF8F6F0);
  static const lBg2 = Color(0xFFF0EDE2);
  static const lSurface = Color(0xFFFFFFFF);
  static const lSurfaceHigh = Color(0xFFFDF9F0);
  static const lTextPrimary = Color(0xFF0D1229);
  static const lTextSecondary = Color(0xFF4A5680);
  static const lBorder = Color(0xFFD8DFF0);
}

/// Cores sensíveis ao TEMA (claro/escuro). As telas de "chrome" (fundos,
/// cartões sólidos, textos, nav) usam estas; as telas sobre FOTO usam branco
/// sobre scrim (iguais nos dois temas). O acento é o mesmo sempre.
class Palette {
  const Palette({
    required this.bg,
    required this.bg2,
    required this.surface,
    required this.surfaceHigh,
    required this.textPrimary,
    required this.textSecondary,
    required this.border,
  });

  final Color bg;
  final Color bg2;
  final Color surface;
  final Color surfaceHigh;
  final Color textPrimary;
  final Color textSecondary;
  final Color border;

  static const _dark = Palette(
    bg: AppColors.bg,
    bg2: AppColors.bg2,
    surface: AppColors.surface,
    surfaceHigh: AppColors.surfaceHigh,
    textPrimary: AppColors.textPrimary,
    textSecondary: AppColors.textSecondary,
    border: AppColors.border,
  );

  static const _light = Palette(
    bg: AppColors.lBg,
    bg2: AppColors.lBg2,
    surface: AppColors.lSurface,
    surfaceHigh: AppColors.lSurfaceHigh,
    textPrimary: AppColors.lTextPrimary,
    textSecondary: AppColors.lTextSecondary,
    border: AppColors.lBorder,
  );

  static Palette of(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark ? _dark : _light;
}
