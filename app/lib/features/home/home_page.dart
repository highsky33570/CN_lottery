import 'package:material_ui/material_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/theme/app_colors.dart';
import '../../data/mock/mock_data.dart';
import '../../data/models/lottery_models.dart';
import '../../widgets/draw_result_card.dart';
import '../results/history_page.dart';
import '../results/lottery_detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final draws = MockData.latestDraws
        .where((d) => d.region == LotteryRegion.national)
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '一起',
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 20.sp,
                fontWeight: FontWeight.w800,
              ),
            ),
            Text(
              '开奖',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 20.sp,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.refresh, size: 22.sp, color: AppColors.textSecondary),
            tooltip: '刷新',
          ),
        ],
      ),
      body: RefreshIndicator(
        color: AppColors.primary,
        onRefresh: () async {
          await Future<void>.delayed(const Duration(milliseconds: 600));
        },
        child: ListView(
          padding: EdgeInsets.fromLTRB(12.w, 8.h, 12.w, 24.h),
          children: [
            _QuickLotteryBar(
              names: MockData.categories.map((c) => c.name).toList(),
              onTap: (name) {
                final draw = MockData.latestDraws.firstWhere(
                  (d) => d.name == name,
                  orElse: () => MockData.latestDraws.first,
                );
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => LotteryDetailPage(draw: draw)),
                );
              },
            ),
            SizedBox(height: 12.h),
            _SectionTitle(title: '最新开奖'),
            SizedBox(height: 8.h),
            ...draws.map(
              (draw) => Padding(
                padding: EdgeInsets.only(bottom: 10.h),
                child: DrawResultCard(
                  draw: draw,
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => LotteryDetailPage(draw: draw)),
                  ),
                  onDetail: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => LotteryDetailPage(draw: draw)),
                  ),
                  onHistory: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => HistoryPage(draw: draw)),
                  ),
                ),
              ),
            ),
            SizedBox(height: 8.h),
            _SectionTitle(title: '资讯速览'),
            SizedBox(height: 8.h),
            _NewsCard(items: MockData.quickNews),
          ],
        ),
      ),
    );
  }
}

class _QuickLotteryBar extends StatelessWidget {
  const _QuickLotteryBar({required this.names, required this.onTap});

  final List<String> names;
  final ValueChanged<String> onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: names.length,
        separatorBuilder: (_, _) => SizedBox(width: 8.w),
        itemBuilder: (context, index) {
          final name = names[index];
          return GestureDetector(
            onTap: () => onTap(name),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.tagBg,
                borderRadius: BorderRadius.circular(18.r),
                border: Border.all(color: const Color(0xFFFFD6D6)),
              ),
              child: Text(
                name,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          );
        },
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
        Container(
          width: 3.w,
          height: 14.h,
          color: AppColors.primary,
        ),
        SizedBox(width: 6.w),
        Text(
          title,
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}

class _NewsCard extends StatelessWidget {
  const _NewsCard({required this.items});

  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          for (var i = 0; i < items.length; i++) ...[
            if (i > 0) Divider(height: 16.h, color: AppColors.border),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 5.h),
                  width: 5.w,
                  height: 5.w,
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: Text(
                    items[i],
                    style: TextStyle(fontSize: 13.sp, height: 1.35),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
