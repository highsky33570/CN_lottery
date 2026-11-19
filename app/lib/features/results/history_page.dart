import 'package:material_ui/material_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/theme/app_colors.dart';
import '../../data/mock/mock_data.dart';
import '../../data/models/lottery_models.dart';
import '../../widgets/lottery_ball.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key, required this.draw});

  final LotteryDraw draw;

  @override
  Widget build(BuildContext context) {
    final history = MockData.historyFor(draw.id);

    return Scaffold(
      appBar: AppBar(title: Text('${draw.name}历史开奖')),
      body: ListView.separated(
        padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 24.h),
        itemCount: history.length,
        separatorBuilder: (_, _) => SizedBox(height: 8.h),
        itemBuilder: (context, index) {
          final item = history[index];
          return Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(color: AppColors.border),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      item.issue,
                      style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700),
                    ),
                    const Spacer(),
                    Text(
                      item.drawTime,
                      style: TextStyle(fontSize: 11.sp, color: AppColors.textMuted),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                LotteryBallRow(numbers: item.numbers),
              ],
            ),
          );
        },
      ),
    );
  }
}
