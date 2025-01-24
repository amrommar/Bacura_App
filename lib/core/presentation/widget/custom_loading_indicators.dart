import 'package:bacura_app/core/utils/app_sizes.dart';
import 'package:bacura_app/core/utils/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomLoadingIndicators {
  static Widget loadingAnimation({
    double? size,
  }) {
    return Center(
      child: LoadingAnimationWidget.beat(
        size: size ?? AppSizes.ph35,
      ),
    );
  }

  static Widget defaultLoading({double? size, Color? color}) {
    return SizedBox(
      width: size ?? AppSizes.ph50,
      height: size ?? AppSizes.ph50,
      child: Center(
          child: CircularProgressIndicator(
        strokeWidth: AppSizes.ph1,
        color: color ?? Theme.of(Get.context!).progressIndicatorTheme.color,
      )),
    );
  }
}

class LoadingAnimationWidget {
  LoadingAnimationWidget._();

  /// One ring emerge from the center and scale up until touches the outer ring.
  /// Then the outer ring expand a bit then come back to normal.
  /// Required color is applied to both rings.
  static Widget beat({
    required double size,
    Key? key,
  }) {
    return Beat(
      size: size,
      key: key,
    );
  }
}

class Beat extends StatefulWidget {
  final double size;

  const Beat({
    super.key,
    required this.size,
  });

  @override
  _BeatState createState() => _BeatState();
}

class _BeatState extends State<Beat> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 1000,
      ),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    final double size = widget.size;
    return SizedBox(
      width: size,
      height: size,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (_, __) => Stack(
          alignment: Alignment.center,
          children: <Widget>[
            ///small
            Visibility(
              visible: _animationController.value <= 0.7,
              child: Transform.scale(
                scale: Tween<double>(begin: 0.15, end: 1.0)
                    .animate(
                      CurvedAnimation(
                        parent: _animationController,
                        curve: const Interval(
                          0.0,
                          0.7,
                          curve: Curves.easeInCubic,
                        ),
                      ),
                    )
                    .value,
                child: Opacity(
                  opacity: Tween<double>(begin: 0.0, end: 1.0)
                      .animate(
                        CurvedAnimation(
                          parent: _animationController,
                          curve: const Interval(0.0, 0.2),
                        ),
                      )
                      .value,
                  child: Ring.draw(
                    color: ColorManager.greyColor,
                    size: size,
                    strokeWidth: Tween<double>(begin: size / 5, end: size / 8)
                        .animate(
                          CurvedAnimation(
                            parent: _animationController,
                            curve: const Interval(0.0, 0.7),
                          ),
                        )
                        .value,
                  ),
                ),
              ),
            ),
            Visibility(
              visible: _animationController.value <= 0.7,
              child: Ring.draw(
                color: Theme.of(context).primaryColor,
                size: size,
                strokeWidth: size / 8,
              ),
            ),

            ///when bigger
            Visibility(
              visible: _animationController.value <= 0.8 && _animationController.value >= 0.7,
              child: Transform.scale(
                scale: Tween<double>(begin: 1.0, end: 1.15)
                    .animate(
                      CurvedAnimation(
                        parent: _animationController,
                        curve: const Interval(
                          0.7,
                          0.8,
                        ),
                      ),
                    )
                    .value,
                child: Ring.draw(
                  color: ColorManager.greyColor,
                  size: size,
                  strokeWidth: size / 8,
                ),
              ),
            ),
            Visibility(
              visible: _animationController.value >= 0.8,
              child: Transform.scale(
                scale: Tween<double>(begin: 1.15, end: 1.0)
                    .animate(
                      CurvedAnimation(
                        parent: _animationController,
                        curve: const Interval(
                          0.8,
                          0.9,
                        ),
                      ),
                    )
                    .value,
                child: Ring.draw(
                  color: Theme.of(context).primaryColor,
                  size: size,
                  strokeWidth: size / 8,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

class Ring extends CustomPainter {
  final Color _color;
  final double _strokeWidth;

  Ring(
    this._color,
    this._strokeWidth,
  );

  static Widget draw({
    required Color color,
    required double size,
    required double strokeWidth,
  }) =>
      SizedBox(
        width: size,
        height: size,
        child: CustomPaint(
          painter: Ring(
            color,
            strokeWidth,
          ),
        ),
      );

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = _color
      ..style = PaintingStyle.stroke
      ..strokeWidth = _strokeWidth;
    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      size.height / 2,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
