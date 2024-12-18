import 'package:flutter/material.dart';
import 'package:teatally/core/app_colors.dart';
import 'package:teatally/core/styles/text/txt.dart';

class CustomExpandableCard extends StatefulWidget {
  final String title;
  final int itemCount;
  final List<Widget> children;

  const CustomExpandableCard({
    Key? key,
    required this.title,
    required this.itemCount,
    required this.children,
  }) : super(key: key);

  @override
  _CustomExpandableCardState createState() => _CustomExpandableCardState();
}

class _CustomExpandableCardState extends State<CustomExpandableCard>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  late AnimationController _controller;
  late Animation<double> _animation;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _colorAnimation = ColorTween(
      begin: Colors.transparent,
      end: AppColors.lightGreen.withOpacity(0.3),
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleExpansion() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedBuilder(
          animation: _colorAnimation,
          builder: (context, child) {
            return Container(
              color: _colorAnimation.value,
              padding: const EdgeInsets.only(left: 15, right: 5, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                      text: TextSpan(children: [
                    txtSpan(context,
                        text: widget.title, style: TxtStyle.bodyLSemiBold),
                    txtSpan(context, text: ": "),
                    txtSpan(context,
                        text: "(${widget.itemCount})",
                        style: TxtStyle.bodyLBold)
                  ])),
                  IconButton(
                    icon: Icon(
                        _isExpanded ? Icons.expand_less : Icons.expand_more),
                    onPressed: _toggleExpansion,
                  ),
                ],
              ),
            );
          },
        ),
        SizeTransition(
          sizeFactor: _animation,
          axisAlignment: 1.0,
          child: Column(
            children: widget.children,
          ),
        ),
      ],
    );
  }
}
