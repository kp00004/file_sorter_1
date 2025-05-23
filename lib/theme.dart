import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff181d3a),
      surfaceTint: Color(0xff585c7d),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff2d3250),
      onPrimaryContainer: Color(0xff969abe),
      secondary: Color(0xff5c5d6c),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffdedeef),
      onSecondaryContainer: Color(0xff606270),
      tertiary: Color(0xff7a5900),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffcc9f3a),
      onTertiaryContainer: Color(0xff4e3800),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfffcf8fb),
      onSurface: Color(0xff1b1b1e),
      onSurfaceVariant: Color(0xff46464d),
      outline: Color(0xff77767e),
      outlineVariant: Color(0xffc7c5ce),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff303032),
      inversePrimary: Color(0xffc0c4ea),
      primaryFixed: Color(0xffdee0ff),
      onPrimaryFixed: Color(0xff141936),
      primaryFixedDim: Color(0xffc0c4ea),
      onPrimaryFixedVariant: Color(0xff404564),
      secondaryFixed: Color(0xffe1e1f2),
      onSecondaryFixed: Color(0xff191b27),
      secondaryFixedDim: Color(0xffc5c5d6),
      onSecondaryFixedVariant: Color(0xff444653),
      tertiaryFixed: Color(0xffffdea1),
      onTertiaryFixed: Color(0xff261900),
      tertiaryFixedDim: Color(0xfff0bf57),
      onTertiaryFixedVariant: Color(0xff5c4300),
      surfaceDim: Color(0xffdcd9dc),
      surfaceBright: Color(0xfffcf8fb),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff6f3f6),
      surfaceContainer: Color(0xfff0edf0),
      surfaceContainerHigh: Color(0xffeae7ea),
      surfaceContainerHighest: Color(0xffe5e1e4),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff181d3a),
      surfaceTint: Color(0xff585c7d),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff2d3250),
      onPrimaryContainer: Color(0xffbdc1e6),
      secondary: Color(0xff343542),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff6b6c7b),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff473300),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff8c6700),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffcf8fb),
      onSurface: Color(0xff111113),
      onSurfaceVariant: Color(0xff35363d),
      outline: Color(0xff525259),
      outlineVariant: Color(0xff6d6c74),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff303032),
      inversePrimary: Color(0xffc0c4ea),
      primaryFixed: Color(0xff666b8c),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff4e5373),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff6b6c7b),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff535462),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff8c6700),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff6e5000),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc8c6c9),
      surfaceBright: Color(0xfffcf8fb),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff6f3f6),
      surfaceContainer: Color(0xffeae7ea),
      surfaceContainerHigh: Color(0xffdfdcdf),
      surfaceContainerHighest: Color(0xffd4d1d4),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff181d3a),
      surfaceTint: Color(0xff585c7d),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff2d3250),
      onPrimaryContainer: Color(0xfff1f0ff),
      secondary: Color(0xff2a2b38),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff474856),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff3b2900),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff5f4500),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffcf8fb),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff2b2c32),
      outlineVariant: Color(0xff484850),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff303032),
      inversePrimary: Color(0xffc0c4ea),
      primaryFixed: Color(0xff424766),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff2c314f),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff474856),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff30323f),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff5f4500),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff432f00),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffbab8bb),
      surfaceBright: Color(0xfffcf8fb),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff3f0f3),
      surfaceContainer: Color(0xffe5e1e4),
      surfaceContainerHigh: Color(0xffd6d3d6),
      surfaceContainerHighest: Color(0xffc8c6c9),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffc0c4ea),
      surfaceTint: Color(0xffc0c4ea),
      onPrimary: Color(0xff292e4c),
      primaryContainer: Color(0xff2d3250),
      onPrimaryContainer: Color(0xff969abe),
      secondary: Color(0xffc5c5d6),
      onSecondary: Color(0xff2e303c),
      secondaryContainer: Color(0xff474856),
      onSecondaryContainer: Color(0xffb7b7c7),
      tertiary: Color(0xfff0bf57),
      onTertiary: Color(0xff402d00),
      tertiaryContainer: Color(0xffcc9f3a),
      onTertiaryContainer: Color(0xff4e3800),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff131315),
      onSurface: Color(0xffe5e1e4),
      onSurfaceVariant: Color(0xffc7c5ce),
      outline: Color(0xff919098),
      outlineVariant: Color(0xff46464d),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe5e1e4),
      inversePrimary: Color(0xff585c7d),
      primaryFixed: Color(0xffdee0ff),
      onPrimaryFixed: Color(0xff141936),
      primaryFixedDim: Color(0xffc0c4ea),
      onPrimaryFixedVariant: Color(0xff404564),
      secondaryFixed: Color(0xffe1e1f2),
      onSecondaryFixed: Color(0xff191b27),
      secondaryFixedDim: Color(0xffc5c5d6),
      onSecondaryFixedVariant: Color(0xff444653),
      tertiaryFixed: Color(0xffffdea1),
      onTertiaryFixed: Color(0xff261900),
      tertiaryFixedDim: Color(0xfff0bf57),
      onTertiaryFixedVariant: Color(0xff5c4300),
      surfaceDim: Color(0xff131315),
      surfaceBright: Color(0xff39393b),
      surfaceContainerLowest: Color(0xff0e0e10),
      surfaceContainerLow: Color(0xff1b1b1e),
      surfaceContainer: Color(0xff201f22),
      surfaceContainerHigh: Color(0xff2a2a2c),
      surfaceContainerHighest: Color(0xff353437),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffd6daff),
      surfaceTint: Color(0xffc0c4ea),
      onPrimary: Color(0xff1f2441),
      primaryContainer: Color(0xff8a8fb2),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffdbdbec),
      onSecondary: Color(0xff232531),
      secondaryContainer: Color(0xff8f8f9f),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffffd788),
      onTertiary: Color(0xff332300),
      tertiaryContainer: Color(0xffcc9f3a),
      onTertiaryContainer: Color(0xff251900),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff131315),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffdddbe4),
      outline: Color(0xffb2b1ba),
      outlineVariant: Color(0xff908f98),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe5e1e4),
      inversePrimary: Color(0xff414665),
      primaryFixed: Color(0xffdee0ff),
      onPrimaryFixed: Color(0xff090f2b),
      primaryFixedDim: Color(0xffc0c4ea),
      onPrimaryFixedVariant: Color(0xff2f3452),
      secondaryFixed: Color(0xffe1e1f2),
      onSecondaryFixed: Color(0xff0f101c),
      secondaryFixedDim: Color(0xffc5c5d6),
      onSecondaryFixedVariant: Color(0xff343542),
      tertiaryFixed: Color(0xffffdea1),
      onTertiaryFixed: Color(0xff191000),
      tertiaryFixedDim: Color(0xfff0bf57),
      onTertiaryFixedVariant: Color(0xff473300),
      surfaceDim: Color(0xff131315),
      surfaceBright: Color(0xff454447),
      surfaceContainerLowest: Color(0xff070709),
      surfaceContainerLow: Color(0xff1d1d20),
      surfaceContainer: Color(0xff28282a),
      surfaceContainerHigh: Color(0xff333235),
      surfaceContainerHighest: Color(0xff3e3d40),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffefeeff),
      surfaceTint: Color(0xffc0c4ea),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffbcc0e6),
      onPrimaryContainer: Color(0xff040825),
      secondary: Color(0xffefeeff),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffc1c1d2),
      onSecondaryContainer: Color(0xff090a16),
      tertiary: Color(0xffffeed2),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffecbc54),
      onTertiaryContainer: Color(0xff110a00),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff131315),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xfff1eff8),
      outlineVariant: Color(0xffc3c1ca),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe5e1e4),
      inversePrimary: Color(0xff414665),
      primaryFixed: Color(0xffdee0ff),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffc0c4ea),
      onPrimaryFixedVariant: Color(0xff090f2b),
      secondaryFixed: Color(0xffe1e1f2),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffc5c5d6),
      onSecondaryFixedVariant: Color(0xff0f101c),
      tertiaryFixed: Color(0xffffdea1),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xfff0bf57),
      onTertiaryFixedVariant: Color(0xff191000),
      surfaceDim: Color(0xff131315),
      surfaceBright: Color(0xff505052),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff201f22),
      surfaceContainer: Color(0xff303032),
      surfaceContainerHigh: Color(0xff3c3b3e),
      surfaceContainerHighest: Color(0xff474649),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.background,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
