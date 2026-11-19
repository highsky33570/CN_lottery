import 'package:material_ui/material_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/theme/app_colors.dart';
import '../home/home_page.dart';
import '../mine/mine_page.dart';
import '../results/results_page.dart';
import '../trends/trends_page.dart';

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _index = 0;

  final _pages = const [
    HomePage(),
    ResultsPage(),
    TrendsPage(),
    MinePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _index, children: _pages),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: AppColors.border)),
        ),
        child: BottomNavigationBar(
          currentIndex: _index,
          onTap: (i) => setState(() => _index = i),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined, size: 22.sp),
              activeIcon: Icon(Icons.home, size: 22.sp),
              label: '首页',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.emoji_events_outlined, size: 22.sp),
              activeIcon: Icon(Icons.emoji_events, size: 22.sp),
              label: '开奖',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.show_chart_outlined, size: 22.sp),
              activeIcon: Icon(Icons.show_chart, size: 22.sp),
              label: '走势',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline, size: 22.sp),
              activeIcon: Icon(Icons.person, size: 22.sp),
              label: '我的',
            ),
          ],
        ),
      ),
    );
  }
}
