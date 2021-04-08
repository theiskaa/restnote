import 'package:flutter/material.dart';

class OpacityButton extends StatefulWidget {
  final Widget child;

  final double opacityValue;

  final VoidCallback onTap;

  final bool alwaysIncludeSemantics;

  const OpacityButton({
    Key key,
    @required this.child,
    this.opacityValue = .5,
    this.onTap,
    this.alwaysIncludeSemantics,
  }) : super(key: key);

  @override
  _OpacityButtonState createState() => _OpacityButtonState();
}

class _OpacityButtonState extends State<OpacityButton> {
  bool _isTapped = false;

  void _setToTrue() => setState(() => _isTapped = true);

  void _setToFalse() => setState(() => _isTapped = false);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => (widget.onTap != null) ? _setToTrue() : null,
      onTapCancel: () => (widget.onTap != null) ? _setToFalse() : null,
      onTapUp: (_) {
        if (widget.onTap != null) {
          _setToFalse();
          return widget.onTap();
        }
      },
      child: _buttonBody(),
    );
  }

  Opacity _buttonBody() => Opacity(
        opacity: _opacityValue,
        child: widget.child,
        alwaysIncludeSemantics: (widget.alwaysIncludeSemantics != null)
            ? widget.alwaysIncludeSemantics
            : false,
      );

  double get _opacityValue => _isTapped ? widget.opacityValue : 1;
}
