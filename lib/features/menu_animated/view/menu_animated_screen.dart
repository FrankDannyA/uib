import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:uib/core/ui_kit/widgets/widgets.dart';
import 'package:uib/features/news/view/news_screen.dart';
import 'package:uib/features/profile/view/profile_screen.dart';
import 'package:uib/features/qr/view/qr_screen.dart';
import 'package:uib/features/story/view/story_screen.dart';
import 'package:uib/generated/locale_keys.g.dart';

class MenuAnimatedScreen extends StatelessWidget {
  const MenuAnimatedScreen({Key? key}) : super(key: key);

  static const String routeName = '/menu_animated_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 48),
        child: Align(
          alignment: const Alignment(0, -0.5),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                onPressed: () => Navigator.of(context).push(
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return NewsScreen();
                    },
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      var curve = Curves.easeInOutQuart;
                      var scaleAnimation = Tween(begin: 0.0, end: 1.0).animate(
                        CurvedAnimation(
                          parent: animation,
                          curve: Interval(0.0, 1.0, curve: curve),
                        ),
                      );

                      return ScaleTransition(
                        scale: scaleAnimation,
                        child: child,
                      );
                    },
                  ),
                ),
                child: Text(LocaleKeys.news.tr()),
              ),
              const HBox(height: 16),
              ElevatedButton(
                onPressed: () => Navigator.of(context).push(
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return StoryScreen();
                    },
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      const begin = Offset(1.0, 0.0);
                      const end = Offset.zero;
                      const curve = Curves.easeInOutQuart;

                      var tween = Tween(begin: begin, end: end)
                          .chain(CurveTween(curve: curve));
                      var offsetAnimation = animation.drive(tween);

                      return SlideTransition(
                        position: offsetAnimation,
                        child: child,
                      );
                    },
                  ),
                ),
                child: Text(LocaleKeys.story.tr()),
              ),
              const HBox(height: 16),
              ElevatedButton(
                onPressed: () => Navigator.of(context).push(
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const QrScreen(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      const begin = 0.0;
                      const end = 1.0;
                      const curve = Curves.easeInOut;

                      var tween = Tween(begin: begin, end: end)
                          .chain(CurveTween(curve: curve));
                      var curvedAnimation =
                          CurvedAnimation(parent: animation, curve: curve);

                      return RotationTransition(
                        turns: tween.animate(curvedAnimation),
                        child: child,
                      );
                    },
                  ),
                ),
                child: Text(LocaleKeys.our_website.tr()),
              ),
              const HBox(height: 16),
              ElevatedButton(
                onPressed: () => Navigator.of(context).push(
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        ProfileScreen(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      const begin = 0.0;
                      const end = 1.0;
                      const curve = Curves.easeInOut;

                      var tween = Tween(begin: begin, end: end)
                          .chain(CurveTween(curve: curve));
                      var curvedAnimation =
                          CurvedAnimation(parent: animation, curve: curve);

                      return SizeTransition(
                        sizeFactor: tween.animate(curvedAnimation),
                        child: child,
                      );
                    },
                  ),
                ),
                child: Text(LocaleKeys.profile.tr()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
