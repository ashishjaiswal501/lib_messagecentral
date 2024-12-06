import 'package:flutter/material.dart';
import 'package:messagecentral/core/constants/app_colors.dart';

class FlutterHorizontalStepper extends StatefulWidget {
  const FlutterHorizontalStepper(
      {super.key,
      required this.steps,
      required this.radius,
      required this.currentStep,
      required this.child,
      this.titleStyle,
      this.inActiveStepColor = const Color(0xFFB3B9C4),
      this.currentStepColor = const Color(0xFFB3B9C4),
      this.completeStepColor = const Color(0xFF2861B4),
      this.thickness = 1,
      this.onClick})
      : assert(currentStep <= steps.length + 1),
        assert(steps.length > 1 && steps.length < 7),
        assert(currentStep > 0),
        assert(radius >= 30 && radius <= 90),
        assert(thickness > 0 && thickness < 6),
        assert(child.length == steps.length);

  /// steps you want to add between 2-6
  final List<String> steps;

  /// radius you want to add between 45 to 90 not more than
  final double radius;

  /// add in-active color default will be grey
  final Color inActiveStepColor;

  /// add  current step color default will be blue
  final Color currentStepColor;

  /// add  completed step color default will be green
  final Color completeStepColor;

  /// add current step between
  final int currentStep;

  /// add line thickness between  1 to 5
  final double thickness;

  /// add  multiple child which display in circle default will be text widget
  final List<Widget> child;

  /// add text style
  final TextStyle? titleStyle;

  /// on click will not be work on in-active step
  final Function(int)? onClick;

  @override
  State<FlutterHorizontalStepper> createState() =>
      _FlutterHorizontalStepperState();
}

class _FlutterHorizontalStepperState extends State<FlutterHorizontalStepper> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (int i = 0; i < widget.steps.length - 1; i++) ...{
                Flexible(
                  child: Container(
                    color: getStatusColor(i),
                    margin: EdgeInsets.only(
                      top: widget.radius / 2,
                      left: i == 0 ? widget.radius : 0,
                      right: i == widget.steps.length - 2 ? widget.radius : 0,
                    ),
                    height: widget.thickness,
                  ),
                ),
              },
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (int i = 0; i < widget.steps.length; i++) ...{
                Flexible(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        child: Container(
                          height: widget.radius,
                          width: widget.radius,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: i + 1 == widget.currentStep
                                ? Colors.white
                                : getStatusColor(i),
                            border: i + 1 == widget.currentStep
                                ? Border.all(color: AppColors.blue60, width: 2)
                                : null,
                            shape: BoxShape.circle,
                          ),
                          child: getStatusWidget(i),
                        ),
                        onTap: () {
                          if (widget.onClick != null) {
                            if (getStatusColor(i) != widget.inActiveStepColor) {
                              widget.onClick!(i);
                            }
                          }
                        },
                      ),
                      const SizedBox(height: 10),
                      Text(
                        widget.steps[i],
                        textAlign: TextAlign.center,
                        style: widget.titleStyle!.merge(TextStyle( fontWeight:  i + 1 == widget.currentStep
                                          ? FontWeight.w600
                                          : FontWeight.w400)),
                      )
                    ],
                  ),
                )
              },
            ],
          ),
        ],
      ),
    );
  }

  Color getStatusColor(int index) {
    if (index + 1 == widget.currentStep) {
      return widget.currentStepColor;
    } else if (index + 1 < widget.currentStep) {
      return widget.completeStepColor;
    }
    return widget.inActiveStepColor;
  }

  Widget getStatusWidget(int index) {
    if (index + 1 < widget.currentStep) {
      return const Icon(Icons.check, color: Colors.white);
    }

    return widget.child[index];
  }
}
