import 'package:flutter/material.dart';

class LiveIndicator extends StatefulWidget {
  const LiveIndicator({super.key});

  @override
  State<LiveIndicator> createState() => _LiveIndicatorState();
}

class _LiveIndicatorState extends State<LiveIndicator> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);

    _animationController.repeat(reverse: true); // Continuously animate opacity change
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _opacityAnimation,
      builder: (context, child) => Opacity(
        opacity: _opacityAnimation.value,
        child: Container(
          width: 10.0,
          height: 10.0,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
