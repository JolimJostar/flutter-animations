import 'package:flutter/material.dart';

class StaggeredListDemo extends StatefulWidget {
  const StaggeredListDemo({super.key});

  @override
  State<StaggeredListDemo> createState() => _StaggeredListDemoState();
}

class _StaggeredListDemoState extends State<StaggeredListDemo>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  static const _labels = [
    'Fade in',
    'Slide up',
    'Staggered timing',
    'Interval curves',
    'Replay anytime',
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _replay() {
    _controller.reset();
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Staggered list')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _replay,
        icon: const Icon(Icons.replay_rounded),
        label: const Text('Replay'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _labels.length,
        itemBuilder: (context, index) {
          final start = index * 0.12;
          final end = (start + 0.5).clamp(0.0, 1.0);

          final animation = CurvedAnimation(
            parent: _controller,
            curve: Interval(start, end, curve: Curves.easeOutCubic),
          );

          return AnimatedBuilder(
            animation: animation,
            builder: (context, child) {
              final t = animation.value;
              return Opacity(
                opacity: t,
                child: Transform.translate(
                  offset: Offset(0, 24 * (1 - t)),
                  child: child,
                ),
              );
            },
            child: Card(
              margin: const EdgeInsets.only(bottom: 12),
              child: ListTile(
                leading: CircleAvatar(child: Text('${index + 1}')),
                title: Text(_labels[index]),
              ),
            ),
          );
        },
      ),
    );
  }
}
