import 'package:material_ui/material_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/theme/app_colors.dart';
import '../../data/models/lottery_models.dart';
import '../../widgets/lottery_ball.dart';
import '../../widgets/prize_table.dart';
import 'history_page.dart';

class LotteryDetailPage extends StatelessWidget {
  const LotteryDetailPage({super.key, required this.draw});

  final LotteryDraw draw;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${draw.name}开奖')),
      body: ListView(
        padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 28.h),
        children: [
          _LatestCard(draw: draw),
          SizedBox(height: 12.h),
          _ToolGrid(
            onHistory: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => HistoryPage(draw: draw)),
              );
            },
          ),
          if (draw.prizes.isNotEmpty) ...[
            SizedBox(height: 16.h),
            _SectionTitle(title: '奖级详情'),
            SizedBox(height: 8.h),
            PrizeTable(prizes: draw.prizes),
          ],
        ],
      ),
    );
  }
}

class _LatestCard extends StatelessWidget {
  const _LatestCard({required this.draw});

  final LotteryDraw draw;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                draw.issue,
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
              ),
              const Spacer(),
              Text(
                draw.drawTime,
                style: TextStyle(fontSize: 12.sp, color: AppColors.textSecondary),
              ),
            ],
          ),
          if (draw.scheduleHint != null) ...[
            SizedBox(height: 4.h),
            Text(
              draw.scheduleHint!,
              style: TextStyle(fontSize: 11.sp, color: AppColors.textMuted),
            ),
          ],
          SizedBox(height: 14.h),
          LotteryBallRow(numbers: draw.numbers, ballSize: 32.w),
          if (draw.prizePool != null || draw.sales != null) ...[
            SizedBox(height: 14.h),
            Row(
              children: [
                if (draw.firstPrizeCount != null)
                  _StatChip(label: '一等奖', value: draw.firstPrizeCount!),
                if (draw.prizePool != null) ...[
                  SizedBox(width: 8.w),
                  _StatChip(label: '奖池', value: draw.prizePool!),
                ],
                if (draw.sales != null) ...[
                  SizedBox(width: 8.w),
                  _StatChip(label: '销量', value: draw.sales!),
                ],
              ],
            ),
          ],
        ],
      ),
    );
  }
}

class _StatChip extends StatelessWidget {
  const _StatChip({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        decoration: BoxDecoration(
          color: AppColors.tagBg,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Column(
          children: [
            Text(
              label,
              style: TextStyle(fontSize: 10.sp, color: AppColors.textSecondary),
            ),
            SizedBox(height: 2.h),
            Text(
              value,
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ToolGrid extends StatelessWidget {
  const _ToolGrid({required this.onHistory});

  final VoidCallback onHistory;

  @override
  Widget build(BuildContext context) {
    final tools = [
      (Icons.history, '历史开奖', onHistory),
      (Icons.schedule, '开奖时间', () {}),
      (Icons.menu_book_outlined, '玩法规则', () {}),
      (Icons.percent, '返奖率', () {}),
      (Icons.show_chart, '遗漏走势', () {}),
      (Icons.auto_awesome, 'AI选号', () {}),
      (Icons.videocam_outlined, '出球回放', () {}),
      (Icons.notifications_none, '开奖提醒', () {}),
    ];

    return Container(
      padding: EdgeInsets.fromLTRB(8.w, 12.h, 8.w, 8.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 6.w, bottom: 8.h),
            child: Text(
              '彩种工具箱',
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700),
            ),
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: tools.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 8.h,
              crossAxisSpacing: 4.w,
              childAspectRatio: 0.95,
            ),
            itemBuilder: (context, index) {
              final t = tools[index];
              return InkWell(
                onTap: t.$3,
                borderRadius: BorderRadius.circular(8.r),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 36.w,
                      height: 36.w,
                      decoration: BoxDecoration(
                        color: AppColors.tagBg,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Icon(t.$1, color: AppColors.primary, size: 18.sp),
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      t.$2,
                      style: TextStyle(fontSize: 11.sp, color: AppColors.textPrimary),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(width: 3.w, height: 14.h, color: AppColors.primary),
        SizedBox(width: 6.w),
        Text(title, style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w700)),
      ],
    );
  }
}
