//import 'dart:html';
import 'package:flame_game/bunny_game.dart';
import 'package:flutter/widgets.dart';
import 'dart:ui';
import 'package:flame/game.dart';
//import 'package:flame/input.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/gestures.dart';
import 'package:flame/flame.dart';
import 'package:flame/components.dart';
import 'navigation_keys.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.fullScreen();
  await Flame.device.setLandscape();
  final game = BunnyGame();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            GameWidget(
              game: game,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: NavigationKeys(
                onDirectionChanged: game.onArrowKeyChanged,
              ),
            )
          ],
        ),
      ),
    ),
  );
}

