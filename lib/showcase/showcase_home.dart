import 'package:flutter/material.dart';

import 'demos/animated_container_demo.dart';
import 'demos/hero_demo.dart';
import 'demos/implicit_animations_demo.dart';
import 'demos/physics_demo.dart';
import 'demos/staggered_list_demo.dart';

class ShowcaseEntry {
  const ShowcaseEntry({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.builder,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final WidgetBuilder builder;
}

class ShowcaseHomePage extends StatelessWidget {
  const ShowcaseHomePage({super.key});

  static final List<ShowcaseEntry> _entries = [
    ShowcaseEntry(
      title: 'Implicit animations',
      subtitle: 'TweenAnimationBuilder & AnimatedAlign',
      icon: Icons.auto_awesome,
      builder: (_) => const ImplicitAnimationsDemo(),
    ),
    ShowcaseEntry(
      title: 'Animated container',
      subtitle: 'Duration, curve, and layout morphing',
      icon: Icons.view_in_ar_outlined,
      builder: (_) => const AnimatedContainerDemo(),
    ),
    ShowcaseEntry(
      title: 'Staggered list',
      subtitle: 'Interval-based slide & fade',
      icon: Icons.view_list_rounded,
      builder: (_) => const StaggeredListDemo(),
    ),
    ShowcaseEntry(
      title: 'Hero transition',
      subtitle: 'Shared element flight between routes',
      icon: Icons.flight_takeoff_rounded,
      builder: (_) => const HeroDemo(),
    ),
    ShowcaseEntry(
      title: 'Spring physics',
      subtitle: 'Simulation-driven motion',
      icon: Icons.sports_gymnastics_rounded,
      builder: (_) => const PhysicsDemo(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            title: const Text('Animation Showcase'),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Text(
                'Tap a demo to explore Flutter motion primitives.',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
            sliver: SliverList.separated(
              itemCount: _entries.length,
              separatorBuilder: (_, _) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                final entry = _entries[index];
                return Card(
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: entry.builder,
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor:
                                theme.colorScheme.primaryContainer,
                            child: Icon(
                              entry.icon,
                              color: theme.colorScheme.onPrimaryContainer,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  entry.title,
                                  style: theme.textTheme.titleMedium,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  entry.subtitle,
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: theme.colorScheme.onSurfaceVariant,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Icon(
                            Icons.chevron_right_rounded,
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
