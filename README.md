Animation a ListView
* [![listview_animation version](https://img.shields.io/pub/v/listview_animation?label=listview_animation)](https://pub.dev/packages/listview_animation)
[![listview_animation size](https://img.shields.io/github/repo-size/ho-doan/listview_animation)](https://github.com/ho-doan/listview_animation)
[![listview_animation issues](https://img.shields.io/github/issues/ho-doan/listview_animation)](https://github.com/ho-doan/listview_animation)
[![listview_animation issues](https://img.shields.io/pub/likes/listview_animation)](https://github.com/ho-doan/listview_animation)
## Features

* ListViewScrollNext

## Usage

```dart
final controller = ListViewScrollNextController<WItem>();

class WItem extends TItem {
  final Color color;
  final double height;

  WItem({
    required this.color,
    required this.height,
  }) : super(
          key: GlobalKey(),
        );
}

ListViewScrollNext<WItem>(
    controller: controller,
    childrens: colors,
    itemBuilder: (item) => GestureDetector(
        onTap: () {
            controller.scrollNext(item);
        },
        child: Container(
            color: item.color,
            height: item.height,
        ),
    ),
)
```
