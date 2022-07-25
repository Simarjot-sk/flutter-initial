import 'package:flutter/material.dart';
import 'package:zumi_app/ui/theme/colors.dart';

class BottomSheetBase extends StatefulWidget {
  static const double topPortionHeightDefault = 120.0;
  static const double bottomSheetRadius = 40;
  final double topPortionHeight;
  final Widget topPortion;
  final Widget bottomPortion;

  const BottomSheetBase({
    Key? key,
    double? topPortionHeight,
    required this.topPortion,
    required this.bottomPortion,
  })  : topPortionHeight = topPortionHeight ?? topPortionHeightDefault,
        super(key: key);

  @override
  State<BottomSheetBase> createState() => _BottomSheetBaseState();
}

class _BottomSheetBaseState extends State<BottomSheetBase> {
  final controller = ScrollController();
  bool topPortionCloneShown = true;

  @override
  void initState() {
    controller.addListener(() {
      final currentPosition = controller.position.pixels;
      if (currentPosition > (widget.topPortionHeight / 3)) {
        if (topPortionCloneShown == false) return; //already in correct state
        setState(() {
          topPortionCloneShown = false;
        });
      } else {
        if (topPortionCloneShown == true) return; //already in correct state
        setState(() {
          topPortionCloneShown = true;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.yellow,
      child: Stack(
        children: [
          SizedBox(
            height: widget.topPortionHeight,
            child: Center(child: widget.topPortion),
          ),
          SingleChildScrollView(
            controller: controller,
            padding: EdgeInsets.only(top: widget.topPortionHeight),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(BottomSheetBase.bottomSheetRadius),
                  topRight: Radius.circular(BottomSheetBase.bottomSheetRadius),
                ),
              ),
              child: widget.bottomPortion,
            ),
          ),
          if (topPortionCloneShown)
            SizedBox(
              height: widget.topPortionHeight,
              child: Center(child: widget.topPortion),
            ),
        ],
      ),
    );
  }
}
