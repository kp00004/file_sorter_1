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
      secondary: Color(0xff35395c),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff4c5075),
      onSecondaryContainer: Color(0xffc0c3ef),
      tertiary: Color(0xff825426),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xfff8bb84),
      onTertiaryContainer: Color(0xff75491c),
      error: Color(0xff006955),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff00846c),
      onErrorContainer: Color(0xfff4fff9),
      surface: Color(0xfffcf8fb),
      onSurface: Color(0xff1b1b1e),
      onSurfaceVariant: Color(0xff46464e),
      outline: Color(0xff77767f),
      outlineVariant: Color(0xffc7c5cf),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff303033),
      inversePrimary: Color(0xffc0c4ea),
      primaryFixed: Color(0xffdee0ff),
      onPrimaryFixed: Color(0xff141936),
      primaryFixedDim: Color(0xffc0c4ea),
      onPrimaryFixedVariant: Color(0xff404564),
      secondaryFixed: Color(0xffdfe0ff),
      onSecondaryFixed: Color(0xff14183a),
      secondaryFixedDim: Color(0xffc0c3ef),
      onSecondaryFixedVariant: Color(0xff404468),
      tertiaryFixed: Color(0xffffdcc0),
      onTertiaryFixed: Color(0xff2d1600),
      tertiaryFixedDim: Color(0xfff7ba83),
      onTertiaryFixedVariant: Color(0xff663d11),
      surfaceDim: Color(0xffdcd9dc),
      surfaceBright: Color(0xfffcf8fb),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff6f2f6),
      surfaceContainer: Color(0xfff0edf0),
      surfaceContainerHigh: Color(0xffeae7ea),
      surfaceContainerHighest: Color(0xffe5e1e5),
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
      secondary: Color(0xff2f3357),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff4c5075),
      onSecondaryContainer: Color(0xfff5f3ff),
      tertiary: Color(0xff532d02),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff936334),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff003e32),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff007c65),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffcf8fb),
      onSurface: Color(0xff111113),
      onSurfaceVariant: Color(0xff35353d),
      outline: Color(0xff52525a),
      outlineVariant: Color(0xff6d6c75),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff303033),
      inversePrimary: Color(0xffc0c4ea),
      primaryFixed: Color(0xff666b8c),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff4e5373),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff666a91),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff4e5277),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff936334),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff774b1e),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc8c6c9),
      surfaceBright: Color(0xfffcf8fb),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff6f2f6),
      surfaceContainer: Color(0xffeae7ea),
      surfaceContainerHigh: Color(0xffdfdcdf),
      surfaceContainerHighest: Color(0xffd3d1d4),
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
      secondary: Color(0xff25294c),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff42466b),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff452400),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff693f13),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff003328),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff005343),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffcf8fb),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff2b2b33),
      outlineVariant: Color(0xff494850),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff303033),
      inversePrimary: Color(0xffc0c4ea),
      primaryFixed: Color(0xff424766),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff2c314f),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff42466b),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff2c3053),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff693f13),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff4e2a00),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffbab8bb),
      surfaceBright: Color(0xfffcf8fb),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff3f0f3),
      surfaceContainer: Color(0xffe5e1e5),
      surfaceContainerHigh: Color(0xffd6d3d7),
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
      secondary: Color(0xffc0c3ef),
      onSecondary: Color(0xff292e50),
      secondaryContainer: Color(0xff4c5075),
      onSecondaryContainer: Color(0xffc0c3ef),
      tertiary: Color(0xffffddc2),
      onTertiary: Color(0xff4b2800),
      tertiaryContainer: Color(0xfff8bb84),
      onTertiaryContainer: Color(0xff75491c),
      error: Color(0xff5ddbbb),
      onError: Color(0xff00382c),
      errorContainer: Color(0xff02a486),
      onErrorContainer: Color(0xff003026),
      surface: Color(0xff131315),
      onSurface: Color(0xffe5e1e5),
      onSurfaceVariant: Color(0xffc7c5cf),
      outline: Color(0xff919099),
      outlineVariant: Color(0xff46464e),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe5e1e5),
      inversePrimary: Color(0xff585c7d),
      primaryFixed: Color(0xffdee0ff),
      onPrimaryFixed: Color(0xff141936),
      primaryFixedDim: Color(0xffc0c4ea),
      onPrimaryFixedVariant: Color(0xff404564),
      secondaryFixed: Color(0xffdfe0ff),
      onSecondaryFixed: Color(0xff14183a),
      secondaryFixedDim: Color(0xffc0c3ef),
      onSecondaryFixedVariant: Color(0xff404468),
      tertiaryFixed: Color(0xffffdcc0),
      onTertiaryFixed: Color(0xff2d1600),
      tertiaryFixedDim: Color(0xfff7ba83),
      onTertiaryFixedVariant: Color(0xff663d11),
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
      secondary: Color(0xffd8daff),
      onSecondary: Color(0xff1f2345),
      secondaryContainer: Color(0xff8a8eb7),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffffddc2),
      onTertiary: Color(0xff432300),
      tertiaryContainer: Color(0xfff8bb84),
      onTertiaryContainer: Color(0xff532d02),
      error: Color(0xff76f2d1),
      onError: Color(0xff002c22),
      errorContainer: Color(0xff02a486),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff131315),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffdddbe5),
      outline: Color(0xffb2b1ba),
      outlineVariant: Color(0xff908f98),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe5e1e5),
      inversePrimary: Color(0xff414665),
      primaryFixed: Color(0xffdee0ff),
      onPrimaryFixed: Color(0xff090f2b),
      primaryFixedDim: Color(0xffc0c4ea),
      onPrimaryFixedVariant: Color(0xff2f3452),
      secondaryFixed: Color(0xffdfe0ff),
      onSecondaryFixed: Color(0xff090d2f),
      secondaryFixedDim: Color(0xffc0c3ef),
      onSecondaryFixedVariant: Color(0xff2f3357),
      tertiaryFixed: Color(0xffffdcc0),
      onTertiaryFixed: Color(0xff1e0d00),
      tertiaryFixedDim: Color(0xfff7ba83),
      onTertiaryFixedVariant: Color(0xff532d02),
      surfaceDim: Color(0xff131315),
      surfaceBright: Color(0xff454447),
      surfaceContainerLowest: Color(0xff070709),
      surfaceContainerLow: Color(0xff1d1d20),
      surfaceContainer: Color(0xff28272a),
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
      secondary: Color(0xfff0eeff),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffbcc0eb),
      onSecondaryContainer: Color(0xff04072a),
      tertiary: Color(0xffffede0),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xfff8bb84),
      onTertiaryContainer: Color(0xff200e00),
      error: Color(0xffb4ffe7),
      onError: Color(0xff000000),
      errorContainer: Color(0xff59d7b7),
      onErrorContainer: Color(0xff000e0a),
      surface: Color(0xff131315),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xfff1eff9),
      outlineVariant: Color(0xffc3c1cb),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe5e1e5),
      inversePrimary: Color(0xff414665),
      primaryFixed: Color(0xffdee0ff),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffc0c4ea),
      onPrimaryFixedVariant: Color(0xff090f2b),
      secondaryFixed: Color(0xffdfe0ff),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffc0c3ef),
      onSecondaryFixedVariant: Color(0xff090d2f),
      tertiaryFixed: Color(0xffffdcc0),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xfff7ba83),
      onTertiaryFixedVariant: Color(0xff1e0d00),
      surfaceDim: Color(0xff131315),
      surfaceBright: Color(0xff505052),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff201f22),
      surfaceContainer: Color(0xff303033),
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
