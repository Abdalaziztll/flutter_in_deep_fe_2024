import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

AnimatedStyle style = AnimatedStyle(
  Style(
    $box.height(100),
    $box.width(100),
    $box.color(Colors.red),
    $on.hover(
      $box.color.brighten(30),
    ),
  ),
  duration: Durations.long1,
  curve: Curves.decelerate,
);
