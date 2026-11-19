import 'package:flutter_test/flutter_test.dart';
import 'package:cn_lottery/main.dart';

void main() {
  testWidgets('App boots to home shell', (tester) async {
    await tester.pumpWidget(const CnLotteryApp());
    await tester.pumpAndSettle();

    expect(find.text('最新开奖'), findsOneWidget);
    expect(find.text('首页'), findsOneWidget);
    expect(find.text('开奖'), findsWidgets);
  });
}
