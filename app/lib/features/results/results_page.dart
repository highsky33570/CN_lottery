import 'package:material_ui/material_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/mock/mock_data.dart';
import '../../data/models/lottery_models.dart';
import '../../widgets/draw_result_card.dart';
import '../../widgets/segment_toggle.dart';
import 'history_page.dart';
import 'lottery_detail_page.dart';

class ResultsPage extends StatefulWidget {
  const ResultsPage({super.key});

  @override
  State<ResultsPage> createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  bool _national = true;

  @override
  Widget build(BuildContext context) {
    final region = _national ? LotteryRegion.national : LotteryRegion.local;
    final draws = MockData.latestDraws.where((d) => d.region == region).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('开奖公告')),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(12.w, 10.h, 12.w, 8.h),
            child: SegmentToggle(
              leftLabel: '全国彩',
              rightLabel: '地方彩',
              isLeftSelected: _national,
              onChanged: (v) => setState(() => _national = v),
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.fromLTRB(12.w, 4.h, 12.w, 24.h),
              itemCount: draws.length,
              separatorBuilder: (_, _) => SizedBox(height: 10.h),
              itemBuilder: (context, index) {
                final draw = draws[index];
                return DrawResultCard(
                  draw: draw,
                  onTap: () => _openDetail(draw),
                  onDetail: () => _openDetail(draw),
                  onHistory: () => _openHistory(draw),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _openDetail(LotteryDraw draw) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => LotteryDetailPage(draw: draw)),
    );
  }

  void _openHistory(LotteryDraw draw) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => HistoryPage(draw: draw)),
    );
  }
}
