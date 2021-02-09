# delayed_widget

A simple and easy to use flutter package, to make widgets show up in a smooth way as soon as it is created.

![Gif](https://github.com/samuelhk0595/delayed_widget/blob/master/example/comparison.gif
"Comparison Gif")

![Gif](https://github.com/samuelhk0595/delayed_widget/blob/master/example/demo.gif
"Demo Gif")

![Gif](https://github.com/samuelhk0595/delayed_widget/blob/master/example/example.gif
"Example Gif")
### Add dependency

```yaml
dependencies:
  delayed_widget: ^1.0.2
```

### Easy to use

```dart
Scaffold(
    appBar: AppBar(
    title: Text('DelayedWidget Example'),
),
body: Center(
    child: DelayedWidget(
        delayDuration: Duration(milliseconds: 200),// Not required
        animationDuration: Duration(seconds: 1),// Not required
        animation: DelayedAnimations.SLIDE_FROM_BOTTOM,// Not required
        child: Container(
            width: 200,
            height: 200,
            color: Colors.red,
        ))),
    )
```

### Attributes

`enable`: Enable/Disable animation\
`delayDuration`: Set the delay time before start animation\
`animationDuration`: Set the duration of animation\
`animation`: Set the animation type
