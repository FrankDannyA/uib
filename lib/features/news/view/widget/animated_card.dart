import 'package:flutter/material.dart';
import 'package:uib/core/models/news.dart';

class AnimatedNewsTile extends StatefulWidget {
  final News news;

  const AnimatedNewsTile({required this.news, Key? key}) : super(key: key);

  @override
  _AnimatedNewsTileState createState() => _AnimatedNewsTileState();
}

class _AnimatedNewsTileState extends State<AnimatedNewsTile>
    with SingleTickerProviderStateMixin {
  bool isExpanded = false;

  late AnimationController _animationController;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    // Add delay before starting the animation
    Future.delayed(Duration(milliseconds: 500), () {
      _animationController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: Card(
        margin: EdgeInsets.all(16),
        child: ExpansionTile(
          title: Text(widget.news.title),
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: AnimatedCrossFade(
                duration: Duration(milliseconds: 300),
                firstChild: Text(
                  widget.news.content,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                ),
                secondChild: Text(widget.news.content),
                crossFadeState: isExpanded
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
              ),
            ),
          ],
          onExpansionChanged: (expanded) {
            setState(() {
              isExpanded = expanded;
            });
          },
        ),
      ),
    );
  }
}
