import 'package:flutter/material.dart';

import '../../models/models.dart';
import '../../utils/utils.dart';

part 'controller.dart';

class ListViewScrollNext<T extends TItem> extends StatefulWidget {
  const ListViewScrollNext({
    super.key,
    required this.childrens,
    required this.controller,
    required this.itemBuilder,
    this.alignment = .9,
  });
  final List<T> childrens;
  final Widget Function(T) itemBuilder;
  final ListViewScrollNextController<T> controller;
  final double alignment;

  @override
  State<ListViewScrollNext<T>> createState() => _ListViewScrollNextState<T>();
}

class _ListViewScrollNextState<T extends TItem>
    extends State<ListViewScrollNext<T>> {
  final _controller = ScrollController();
  final key = GlobalKey();
  @override
  void initState() {
    super.initState();
    widget.controller.scrollNext = scrollNext;
  }

  void scrollNext(T item) {
    if (widget.childrens.last == item) {
      return;
    }
    final index = widget.childrens.indexOf(item);
    final itemNext = widget.childrens[index + 1];
    final position = itemNext.key.position.dy + itemNext.key.size.height;

    if (position >= key.size.height) {
      Scrollable.ensureVisible(
        itemNext.key.currentContext!,
        alignment: widget.alignment,
        duration: const Duration(
          milliseconds: 180,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      key: key,
      controller: _controller,
      cacheExtent: 30,
      children: [
        for (final child in widget.childrens)
          Container(
            key: child.key,
            child: widget.itemBuilder(child),
          )
      ],
    );
  }
}
