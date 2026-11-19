import 'package:material_ui/material_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/theme/app_colors.dart';
import '../../data/mock/mock_data.dart';
import '../../data/models/lottery_models.dart';
import '../../widgets/segment_toggle.dart';

class TrendsPage extends StatefulWidget {
  const TrendsPage({super.key});

  @override
  State<TrendsPage> createState() => _TrendsPageState();
}

class _TrendsPageState extends State<TrendsPage> {
  bool _national = true;

  @override
  Widget build(BuildContext context) {
    final region = _national ? LotteryRegion.national : LotteryRegion.local;
    final cats = MockData.categories.where((c) => c.region == region).toList();
    // Local categories are sparse in mock; fall back so UI still demos.
    final display = cats.isEmpty ? MockData.categories : cats;

    return Scaffold(
      appBar: AppBar(title: const Text('走势图')),
      body: ListView(
        padding: EdgeInsets.fromLTRB(12.w, 10.h, 12.w, 24.h),
        children: [
          SegmentToggle(
            leftLabel: '全国彩',
            rightLabel: '地方彩',
            isLeftSelected: _national,
            onChanged: (v) => setState(() => _national = v),
          ),
          SizedBox(height: 12.h),
          ...display.map((cat) {
            return Padding(
              padding: EdgeInsets.only(bottom: 10.h),
              child: Container(
                padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 10.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(color: AppColors.border),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cat.name,
                      style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: 10.h),
                    Wrap(
                      spacing: 8.w,
                      runSpacing: 8.h,
                      children: cat.tools.map((tool) {
                        return Container(
                          width: (1.sw - 24.w - 24.w - 24.w) / 4,
                          padding: EdgeInsets.symmetric(vertical: 8.h),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppColors.tagBg,
                            borderRadius: BorderRadius.circular(6.r),
                          ),
                          child: Text(
                            tool.title,
                            style: TextStyle(
                              fontSize: 11.sp,
                              color: AppColors.primary,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            );
          }),
          SizedBox(height: 8.h),
          Text(
            '走势图表将在真实开奖历史接入后启用',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12.sp, color: AppColors.textMuted),
          ),
        ],
      ),
    );
  }
}
