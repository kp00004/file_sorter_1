import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'theme.dart';

class PageofLand extends StatelessWidget {
  const PageofLand({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: Center(
        child: Container(
          width: 512,
          height: 1024,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: colorScheme.surface,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Stack(
            children: [
              Positioned(
                left: -65,
                top: 130,
                child: Icon(
                  Icons.folder,
                  size: 520,
                  color: colorScheme.secondaryContainer.withOpacity(0.4),
                ),
              ),
              Positioned(
                left: -60,
                top: 205,
                child: Icon(
                  Icons.folder,
                  size: 520,
                  color: colorScheme.secondaryContainer.withOpacity(0.6),
                ),
              ),
              Positioned(
                left: -60,
                top: 280,
                child: Icon(
                  Icons.folder,
                  size: 520,
                  color: colorScheme.secondary,
                ),
              ),
              Positioned(
                left: -60,
                top: 355,
                child: Icon(
                  Icons.folder,
                  size: 520,
                  color: colorScheme.primaryContainer,
                ),
              ),
              Positioned(
                left: -60,
                top: 430,
                child: Icon(
                  Icons.folder,
                  size: 520,
                  color: colorScheme.primary,
                ),
              ),
                Positioned(
                left: 0,
                right: 0,
                top: 100,
                bottom: null,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                  'Elif Retros Oolala',
                  textAlign: TextAlign.center,
                  style: textTheme.headlineMedium?.copyWith(
                    color: colorScheme.tertiaryContainer,
                    fontSize: 40,
                    fontWeight: FontWeight.w400,
                  ),
                  ),
                ),
                ),
              Positioned(
                right: 10,
                bottom: 80,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FileHome(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorScheme.primaryContainer,
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    textStyle: textTheme.titleLarge?.copyWith(
                      fontSize: 24,
                      color: colorScheme.onPrimary,
                    ),
                  ),
                  child: Text(
                    'Start',
                    style: TextStyle(
                      fontSize: 24,
                      color: colorScheme.tertiaryContainer,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}