import 'package:flutter/material.dart';

class ClickableCard extends StatelessWidget {
  final VoidCallback onTap;
  final Widget? child;
  final Color? color;
  final double? elevation;
  final ShapeBorder? shape;
  final Clip? clipBehavior;
  final EdgeInsetsGeometry? margin;
  final bool? semanticContainer;
  final bool borderOnForeground;

  const ClickableCard({
    super.key,
    required this.onTap,
    this.child,
    this.color,
    this.elevation,
    this.shape,
    this.clipBehavior,
    this.margin,
    this.semanticContainer,
    this.borderOnForeground = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: color,
        elevation: elevation,
        shape: shape,
        clipBehavior: clipBehavior,
        margin: margin,
        semanticContainer: semanticContainer ?? true,
        borderOnForeground: borderOnForeground,
        child: child,
      ),
    );
  }
}
