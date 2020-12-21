import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

class TapMyProducts extends Given1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String input1) async {
    final myproductsTab = find.byValueKey(input1);
    await FlutterDriverUtils.tap(world.driver, myproductsTab);
  }

  @override
  RegExp get pattern => RegExp(r"the host taps the {string}");
}

class HostTapOnProduct extends GivenWithWorld<FlutterWorld> {
  @override
  Future<void> executeStep() async {
    final product = find.byValueKey("ApplyForAProductqbgsnuaKJNc6mYjePYKj");

    await FlutterDriverUtils.tap(world.driver, product);
  }

  @override
  RegExp get pattern => RegExp(r"the host taps on a product");
}

class HostTapOnAttendee extends GivenWithWorld<FlutterWorld> {
  @override
  Future<void> executeStep() async {
    final product = find.byValueKey("CandidatedsM9pO5uV4F6j5ABjRfP");

    await FlutterDriverUtils.tap(world.driver, product);
  }

  @override
  RegExp get pattern => RegExp(r"the host picks an attendee");
}

class ConfirmGiveaway extends Given1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String input1) async {
    final button = find.byValueKey(input1);

    await FlutterDriverUtils.tap(world.driver, button);
  }

  @override
  RegExp get pattern => RegExp(r"the host taps the {string}");
}

class ThenGiveaway extends GivenWithWorld<FlutterWorld> {
  @override
  Future<void> executeStep() async {}

  @override
  RegExp get pattern => RegExp(r"the app creates a new product");
}
