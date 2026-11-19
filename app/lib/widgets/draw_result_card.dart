import 'package:material_ui/material_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/theme/app_colors.dart';
import '../data/models/lottery_models.dart';
import 'lottery_ball.dart';

class DrawResultCard extends StatelessWidget {
  const DrawResultCard({
    super.key,
    required this.draw,
    this.onTap,
    this.onHistory,
    this.onDetail,
    this.showActions = true,
  });

  final LotteryDraw draw;
  final VoidCallback? onTap;
  final VoidCallback? onHistory;
  final VoidCallback? onDetail;
  final bool showActions;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.card,
      borderRadius: BorderRadius.circular(10.r),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10.r),
        child: Container(
          padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 10.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(color: AppColors.border),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 3.w,
                    height: 14.h,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(2.r),
                    ),
                  ),
                  SizedBox(width: 6.w),
                  Text(
                    draw.name,
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    draw.issue,
                    style: TextStyle(fontSize: 12.sp, color: AppColors.textSecondary),
                  ),
                ],
              ),
              SizedBox(height: 4.h),
              Text(
                draw.drawTime,
                style: TextStyle(fontSize: 11.sp, color: AppColors.textMuted),
              ),
              SizedBox(height: 10.h),
              LotteryBallRow(
                numbers: draw.numbers,
                wrap: draw.numbers.length > 10,
              ),
              if (showActions) ...[
                SizedBox(height: 10.h),
                Divider(height: 1.h, color: AppColors.border),
                SizedBox(height: 6.h),
                Row(
                  children: [
                    _ActionLink(label: '详情', onTap: onDetail ?? onTap),
                    SizedBox(width: 16.w),
                    _ActionLink(label: '历史开奖', onTap: onHistory),
                    SizedBox(width: 16.w),
                    _ActionLink(label: '走势图', onTap: () {}),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _ActionLink extends StatelessWidget {
  const _ActionLink({required this.label, this.onTap});

  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        label,
        style: TextStyle(
          fontSize: 12.sp,
          color: AppColors.primary,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
