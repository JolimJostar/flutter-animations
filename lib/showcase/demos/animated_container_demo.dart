import 'package:flutter/material.dart';

class AnimatedContainerDemo extends StatefulWidget {
  const AnimatedContainerDemo({super.key});

  @override
  State<AnimatedContainerDemo> createState() => _AnimatedContainerDemoState();
}

class _AnimatedContainerDemoState extends State<AnimatedContainerDemo> {
  bool _morphed = false;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Animated container')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 800),
              curve: Curves.easeInOutCubicEmphasized,
              width: _morphed ? 280 : 120,
              height: _morphed ? 120 : 280,
              decoration: BoxDecoration(
                color: _morphed ? scheme.secondaryContainer : scheme.primary,
                borderRadius: BorderRadius.circular(_morphed ? 60 : 16),
              ),
              alignment: Alignment.center,
              child: AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 800),
                style: TextStyle(
                  color: _morphed
                      ? scheme.onSecondaryContainer
                      : scheme.onPrimary,
                  fontWeight: FontWeight.w600,
                  fontSize: _morphed ? 18 : 14,
                ),
                child: const Text('Morph'),
              ),
            ),
            const SizedBox(height: 48),
            FilledButton.tonal(
              onPressed: () => setState(() => _morphed = !_morphed),
              child: const Text('Toggle shape'),
            ),
          ],
        ),
      ),
    );
  }
}
