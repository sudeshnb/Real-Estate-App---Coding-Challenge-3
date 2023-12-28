import 'package:flutter/material.dart';

class ShrinkButton extends StatefulWidget {
  final Function onPressed;
  final double shrinkScale;
  final bool isActive;
  final Widget child;
  final int duration;
  const ShrinkButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.isActive = true,
    this.duration = 150,
    this.shrinkScale = 0.9,
  });

  @override
  State<ShrinkButton> createState() => _ShrinkButtonState();
}

class _ShrinkButtonState extends State<ShrinkButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> scale;
  @override
  void initState() {
    _controller = AnimationController(
      duration: Duration(milliseconds: widget.duration),
      vsync: this,
    );
    //
    scale = Tween<double>(
      begin: 1.0,
      end: widget.shrinkScale,
    ).animate(_controller);

    super.initState();
  }

  Future<void> _onTap() async {
    _controller.forward();
    await Future.delayed(
      const Duration(milliseconds: 200),
      () => _controller.reverse(),
    );
    widget.onPressed();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.isActive ? _onTap : null,
      child: ScaleTransition(
        scale: scale,
        child: widget.child,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
