import 'package:flutter/material.dart';

extension VGlobalKey on GlobalKey {
  Offset get position {
    final RenderBox? renderBox =
        currentContext?.findRenderObject() as RenderBox?;
    final NavigatorState? state =
        currentContext?.findAncestorStateOfType<NavigatorState>();
    if (state != null) {
      return renderBox?.localToGlobal(
            Offset.zero,
            ancestor: state.context.findRenderObject(),
          ) ??
          Offset.zero;
    }
    return renderBox?.localToGlobal(Offset.zero) ?? Offset.zero;
  }

  Size get size {
    final RenderBox? renderBox =
        currentContext?.findRenderObject() as RenderBox?;
    return renderBox?.size ?? Size.zero;
  }
}
