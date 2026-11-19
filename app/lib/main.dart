import 'package:material_ui/material_ui.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/theme/app_theme.dart';
import 'features/shell/main_shell.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const CnLotteryApp());
}

class CnLotteryApp extends StatelessWidget {
  const CnLotteryApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Design size = typical phone frame; ScreenUtil scales for LDPlayer/devices.
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: '开奖APP',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light(),
          home: child,
        );
      },
      child: const MainShell(),
    );
  }
}
