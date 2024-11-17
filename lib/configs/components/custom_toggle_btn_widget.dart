import 'package:big_cart/configs/assets/image_assets.dart';
import 'package:flutter/material.dart';

class CustomToggleButton extends StatefulWidget {
  final List<bool> isSelected;
  final ValueChanged<List<bool>> onChanged;
  final List<String> btnLabels;
  final bool asATabBar;
  final TextStyle? labelStyle;
  CustomToggleButton(
      {super.key,
      required this.isSelected,
      required this.onChanged,
      required this.btnLabels,
      this.asATabBar = false,
      this.onLongPress,
      this.labelStyle});
  final void Function()? onLongPress;

  @override
  State<CustomToggleButton> createState() => _CustomToggleButtonState();
}

class _CustomToggleButtonState extends State<CustomToggleButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        widget.btnLabels.length,
        (index) => Expanded(
          child: GestureDetector(
            onLongPress: index == 2 ? widget.onLongPress : null,
            onTap: () {
              print(index);
              List<bool> newSelectedList =
                  List<bool>.filled(widget.btnLabels.length, false);
              newSelectedList[index] = true;
              setState(() {
                widget.onChanged(newSelectedList);
              });
            },
            child: Container(
              margin: EdgeInsets.all(!widget.asATabBar ? 5 : 0),
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(widget.asATabBar ? 16 : 25),

                color: widget.isSelected[index]
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).cardColor,
                // : Colors.transparent,
                boxShadow: widget.asATabBar
                    ? null
                    : [
                        BoxShadow(
                          color: Theme.of(context).shadowColor,
                          spreadRadius: 0.1,
                          blurRadius: 3,
                          offset: const Offset(0, 5),
                        ),
                      ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(
                    widget.btnLabels[index].toLowerCase().contains('paypal')
                        ? ImageAssets.paypal
                        : widget.btnLabels[index]
                                .toLowerCase()
                                .contains('master')
                            ? ImageAssets.masterCard
                            : ImageAssets.visa,
                    height: 50,
                    width: 50,
                    fit: BoxFit.contain,
                  ),
                  // 10.height,
                  Text(
                    widget.btnLabels[index],
                    style: TextStyle(
                      color: widget.isSelected[index] ? Colors.white : null,
                      fontWeight: widget.isSelected[index]
                          ? FontWeight.w500
                          : FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
