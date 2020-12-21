import 'dart:async';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';
import 'package:glob/glob.dart';

import 'steps/apply_for_products_step.dart';
import 'steps/create_new_product_step.dart';
import 'steps/giveaway_product_step.dart';

Future<void> main() {
  final config = FlutterTestConfiguration()
    ..features = [
      Glob(r"test_driver/features/**.feature")
    ] // ..features = [Glob(r"test_driver/features/**.feature")]
    ..reporters = [ProgressReporter()]
    ..stepDefinitions = [
      CheckOnProductsPage(),
      AddProducts(),
      FillOutField(),
      NextProductPage(),
      SelectConference(),
      ThenCreate(),
      CheckUserOnProductsPage(),
      TapOnProduct(),
      TapOnApply(),
      FillOutForm(),
      PressContinue(),
      ThenAdd(),
      TapMyProducts(),
      HostTapOnProduct(),
      HostTapOnAttendee(),
      ConfirmGiveaway(),
      ThenGiveaway(),
      ThenRemove()
    ]
    ..restartAppBetweenScenarios = true
    ..targetAppPath = "test_driver/app.dart"
    ..exitAfterTestRun = true;
  return GherkinRunner().execute(config);
}
