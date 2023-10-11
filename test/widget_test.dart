import 'package:com.rado.mosque/views/constants/app_constant.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:com.rado.mosque/main.dart';

void main() {
  testWidgets(
    AppConstants.appName,
        (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
    },
  );
}
