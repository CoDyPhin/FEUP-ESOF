import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

class CheckUserOnProductsPage extends Given1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String input1) async {
    final emailTextField = find.byValueKey("EmailTextField");
    final passwordTextField = find.byValueKey("PasswordTextField");
    final signInButton = find.byValueKey("SignInButton");
    final productsPageButton = find.byValueKey("ProductsPageButton");
    final productsPage = find.byValueKey(input1);

    await FlutterDriverUtils.enterText(
        world.driver, emailTextField, "caio@gmail.com");
    await FlutterDriverUtils.enterText(
        world.driver, passwordTextField, "caio123");
    await FlutterDriverUtils.tap(world.driver, signInButton);
    await FlutterDriverUtils.tap(world.driver, productsPageButton);
    await FlutterDriverUtils.isPresent(world.driver, productsPage);
  }

  @override
  RegExp get pattern => RegExp(r"the user is on the {string}");
}

class TapOnProduct extends GivenWithWorld<FlutterWorld> {
  @override
  Future<void> executeStep() async {
    final product = find.byValueKey("ApplyForAProductqbgsnuaKJNc6mYjePYKj");

    await FlutterDriverUtils.tap(world.driver, product);
  }

  @override
  RegExp get pattern => RegExp(r"the user taps on a product");
}

class TapOnApply extends Given1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String input1) async {
    final applybtn = find.byValueKey(input1);

    await FlutterDriverUtils.tap(world.driver, applybtn);
  }

  @override
  RegExp get pattern => RegExp(r"the user taps the {string}");
}

class FillOutForm extends Given2WithWorld<String, String, FlutterWorld> {
  @override
  Future<void> executeStep(String input1, String input2) async {
    final fieldFinder = find.byValueKey(input1);
    await FlutterDriverUtils.enterText(world.driver, fieldFinder, input2);
  }

  @override
  RegExp get pattern =>
      RegExp(r"the user fills out a small {string} with {string}");
}

class PressContinue extends Given1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String input1) async {
    final product = find.byValueKey(input1);

    await FlutterDriverUtils.tap(world.driver, product);
  }

  @override
  RegExp get pattern => RegExp(r"the user presses {string}");
}

class ThenAdd extends GivenWithWorld<FlutterWorld> {
  @override
  Future<void> executeStep() async {}

  @override
  RegExp get pattern => RegExp(
      r"the app adds the user to the candidates list for that specific product");
}

class ThenRemove extends GivenWithWorld<FlutterWorld> {
  @override
  Future<void> executeStep() async {}

  @override
  RegExp get pattern => RegExp(
      r"the app removes the user from the candidates list for that specific product");
}
