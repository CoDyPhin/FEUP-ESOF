import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

class CheckOnProductsPage extends Given1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String input1) async {
    final emailTextField = find.byValueKey("EmailTextField");
    final passwordTextField = find.byValueKey("PasswordTextField");
    final signInButton = find.byValueKey("SignInButton");
    final productsPageButton = find.byValueKey("ProductsPageButton");
    final productsPage = find.byValueKey(input1);

    await FlutterDriverUtils.enterText(
        world.driver, emailTextField, "marcosjeeves@gmail.com");
    await FlutterDriverUtils.enterText(
        world.driver, passwordTextField, "marcosjeeves123");
    await FlutterDriverUtils.tap(world.driver, signInButton);
    await FlutterDriverUtils.tap(world.driver, productsPageButton);
    await FlutterDriverUtils.isPresent(world.driver, productsPage);
  }

  @override
  RegExp get pattern => RegExp(r"the host is on the {string}");
}

class AddProducts extends Given1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String input1) async {
    final addProductButton = find.byValueKey(input1);
    await FlutterDriverUtils.tap(world.driver, addProductButton);
  }

  @override
  RegExp get pattern => RegExp(r"the host taps the {string} button");
}

class FillOutField extends And2WithWorld<String, String, FlutterWorld> {
  @override
  Future<void> executeStep(String input1, String input2) async {
    final fieldFinder = find.byValueKey(input1);
    await FlutterDriverUtils.enterText(world.driver, fieldFinder, input2);
  }

  @override
  RegExp get pattern =>
      RegExp(r"the host fills out the {string} with {string}");
}

class NextProductPage extends Given1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String input1) async {
    final nextPageButton = find.byValueKey(input1);
    await FlutterDriverUtils.tap(world.driver, nextPageButton);
  }

  @override
  RegExp get pattern => RegExp(r"the host taps the {string} button");
}

class SelectConference extends Given1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String input1) async {
    final nextPageButton = find.byValueKey(input1);
    await FlutterDriverUtils.tap(world.driver, nextPageButton);
  }

  @override
  RegExp get pattern => RegExp(r"the host taps the {string}");
}

class ThenCreate extends GivenWithWorld<FlutterWorld> {
  @override
  Future<void> executeStep() async {}

  @override
  RegExp get pattern => RegExp(r"the app creates a new product");
}
