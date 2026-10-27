import 'package:flutter/material.dart';

class HeroDemo extends StatelessWidget {
  const HeroDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hero transition')),
      body: Center(
        child: Hero(
          tag: 'showcase-hero',
          child: Material(
            color: Theme.of(context).colorScheme.tertiaryContainer,
            elevation: 4,
            borderRadius: BorderRadius.circular(16),
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (_) => const _HeroDetailPage(),
                  ),
                );
              },
              child: const SizedBox(
                width: 120,
                height: 120,
                child: Icon(Icons.image_outlined, size: 48),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _HeroDetailPage extends StatelessWidget {
  const _HeroDetailPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail')),
      body: Center(
        child: Hero(
          tag: 'showcase-hero',
          child: Material(
            color: Theme.of(context).colorScheme.tertiaryContainer,
            borderRadius: BorderRadius.circular(24),
            child: const SizedBox(
              width: 280,
              height: 280,
              child: Icon(Icons.image_outlined, size: 96),
            ),
          ),
        ),
      ),
    );
  }
}
