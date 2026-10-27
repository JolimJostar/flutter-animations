import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

class PhysicsDemo extends StatefulWidget {
  const PhysicsDemo({super.key});

  @override
  State<PhysicsDemo> createState() => _PhysicsDemoState();
}

class _PhysicsDemoState extends State<PhysicsDemo>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late Simulation _simulation;
  double _position = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController.unbounded(vsync: this)
      ..addListener(() {
        setState(() => _position = _controller.value);
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _fling(double velocity) {
    _simulation = FrictionSimulation(0.12, _position, velocity);
    _controller.animateWith(_simulation);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Spring physics')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final trackWidth = constraints.maxWidth - 48;
          final ballX = (_position.clamp(0, trackWidth)).toDouble();

          return Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Fling the ball with friction simulation. '
                  'Uses AnimationController.animateWith.',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const Spacer(),
                SizedBox(
                  height: 80,
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      Container(
                        height: 4,
                        decoration: BoxDecoration(
                          color: Theme.of(context)
                              .colorScheme
                              .outlineVariant,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      Positioned(
                        left: ballX,
                        child: GestureDetector(
                          onHorizontalDragEnd: (details) {
                            _fling(details.velocity.pixelsPerSecond.dx);
                          },
                          child: Container(
                            width: 56,
                            height: 56,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Theme.of(context).colorScheme.primary,
                              boxShadow: [
                                BoxShadow(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .primary
                                      .withValues(alpha: 0.4),
                                  blurRadius: 12,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => _fling(-1200),
                        child: const Text('Fling left'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: FilledButton(
                        onPressed: () => _fling(1200),
                        child: const Text('Fling right'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
