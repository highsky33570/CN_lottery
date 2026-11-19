import 'package:material_ui/material_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/theme/app_colors.dart';
import '../data/models/lottery_models.dart';

class PrizeTable extends StatelessWidget {
  const PrizeTable({super.key, required this.prizes});

  final List<PrizeTier> prizes;

  @override
  Widget build(BuildContext context) {
    if (prizes.isEmpty) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h),
        child: Text(
          '暂无奖级详情',
          style: TextStyle(fontSize: 13.sp, color: AppColors.textMuted),
        ),
      );
    }

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          _Header(),
          ...prizes.map((p) => _Row(tier: p)),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: const Color(0xFFFAFAFA),
        borderRadius: BorderRadius.vertical(top: Radius.circular(10.r)),
      ),
      child: Row(
        children: [
          _cell('奖项', flex: 2, bold: true),
          _cell('中奖条件', flex: 3, bold: true),
          _cell('注数', flex: 2, bold: true, align: TextAlign.right),
          _cell('奖金(元)', flex: 3, bold: true, align: TextAlign.right),
        ],
      ),
    );
  }
}

class _Row extends StatelessWidget {
  const _Row({required this.tier});

  final PrizeTier tier;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 9.h),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: AppColors.border)),
      ),
      child: Row(
        children: [
          _cell(tier.name, flex: 2),
          _cell(tier.condition, flex: 3, color: AppColors.textSecondary),
          _cell(tier.winners, flex: 2, align: TextAlign.right),
          _cell(
            tier.amount,
            flex: 3,
            align: TextAlign.right,
            color: AppColors.primary,
            bold: true,
          ),
        ],
      ),
    );
  }
}

Widget _cell(
  String text, {
  required int flex,
  bool bold = false,
  TextAlign align = TextAlign.left,
  Color? color,
}) {
  return Expanded(
    flex: flex,
    child: Text(
      text,
      textAlign: align,
      style: TextStyle(
        fontSize: 11.sp,
        fontWeight: bold ? FontWeight.w600 : FontWeight.w400,
        color: color ?? AppColors.textPrimary,
      ),
    ),
  );
}
