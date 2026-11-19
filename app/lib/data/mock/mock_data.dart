import '../models/lottery_models.dart';

/// Temporary data until scraper/API is ready. Shape matches future API.
abstract final class MockData {
  static final List<LotteryDraw> latestDraws = [
    LotteryDraw(
      id: 'ssq',
      name: '双色球',
      issue: '2026132期',
      drawTime: '2026-11-17 (二)',
      region: LotteryRegion.national,
      scheduleHint: '每周二、四、日 21:15 开奖',
      firstPrizeCount: '6注',
      prizePool: '8.12亿',
      sales: '3.45亿',
      numbers: const [
        LotteryBallNumber('03'),
        LotteryBallNumber('08'),
        LotteryBallNumber('14'),
        LotteryBallNumber('21'),
        LotteryBallNumber('27'),
        LotteryBallNumber('33'),
        LotteryBallNumber('12', color: BallColor.blue),
      ],
      prizes: const [
        PrizeTier(name: '一等奖', condition: '6+1', winners: '6', amount: '5,000,000'),
        PrizeTier(name: '二等奖', condition: '6+0', winners: '98', amount: '168,420'),
        PrizeTier(name: '三等奖', condition: '5+1', winners: '1,204', amount: '3,000'),
        PrizeTier(name: '四等奖', condition: '5+0 / 4+1', winners: '58,210', amount: '200'),
        PrizeTier(name: '五等奖', condition: '4+0 / 3+1', winners: '812,004', amount: '10'),
        PrizeTier(name: '六等奖', condition: '2+1 / 1+1 / 0+1', winners: '6,120,331', amount: '5'),
      ],
    ),
    LotteryDraw(
      id: 'dlt',
      name: '大乐透',
      issue: '2026131期',
      drawTime: '2026-11-16 (一)',
      region: LotteryRegion.national,
      scheduleHint: '每周一、三、六 21:25 开奖',
      firstPrizeCount: '8注',
      prizePool: '7.31亿',
      sales: '3.23亿',
      numbers: const [
        LotteryBallNumber('02'),
        LotteryBallNumber('11'),
        LotteryBallNumber('18'),
        LotteryBallNumber('19'),
        LotteryBallNumber('29'),
        LotteryBallNumber('04', color: BallColor.blue),
        LotteryBallNumber('07', color: BallColor.blue),
      ],
      prizes: const [
        PrizeTier(name: '一等奖', condition: '5+2', winners: '8', amount: '6,352,665'),
        PrizeTier(name: '二等奖', condition: '5+1', winners: '142', amount: '82,140'),
        PrizeTier(name: '三等奖', condition: '5+0', winners: '986', amount: '10,000'),
        PrizeTier(name: '四等奖', condition: '4+2', winners: '3,214', amount: '3,000'),
        PrizeTier(name: '五等奖', condition: '4+1', winners: '77,793', amount: '300'),
        PrizeTier(name: '六等奖', condition: '3+2', winners: '120,441', amount: '200'),
        PrizeTier(name: '七等奖', condition: '4+0', winners: '310,220', amount: '100'),
        PrizeTier(name: '八等奖', condition: '3+1 / 2+2', winners: '2,104,550', amount: '15'),
        PrizeTier(name: '九等奖', condition: '3+0 / 1+2 / 2+1 / 0+2', winners: '18,220,110', amount: '5'),
      ],
    ),
    LotteryDraw(
      id: 'fc3d',
      name: '福彩3D',
      issue: '2026308期',
      drawTime: '2026-11-18 (三)',
      region: LotteryRegion.national,
      scheduleHint: '每日 21:15 开奖',
      numbers: const [
        LotteryBallNumber('5'),
        LotteryBallNumber('2'),
        LotteryBallNumber('9'),
      ],
    ),
    LotteryDraw(
      id: 'pl3',
      name: '排列3',
      issue: '2026308期',
      drawTime: '2026-11-18 (三)',
      region: LotteryRegion.national,
      numbers: const [
        LotteryBallNumber('1'),
        LotteryBallNumber('7'),
        LotteryBallNumber('4'),
      ],
    ),
    LotteryDraw(
      id: 'pl5',
      name: '排列5',
      issue: '2026308期',
      drawTime: '2026-11-18 (三)',
      region: LotteryRegion.national,
      numbers: const [
        LotteryBallNumber('1'),
        LotteryBallNumber('7'),
        LotteryBallNumber('4'),
        LotteryBallNumber('0'),
        LotteryBallNumber('6'),
      ],
    ),
    LotteryDraw(
      id: 'kl8',
      name: '快乐8',
      issue: '2026308期',
      drawTime: '2026-11-18 (三)',
      region: LotteryRegion.national,
      numbers: const [
        LotteryBallNumber('01'),
        LotteryBallNumber('05'),
        LotteryBallNumber('08'),
        LotteryBallNumber('12'),
        LotteryBallNumber('18'),
        LotteryBallNumber('22'),
        LotteryBallNumber('27'),
        LotteryBallNumber('33'),
        LotteryBallNumber('36'),
        LotteryBallNumber('41'),
        LotteryBallNumber('44'),
        LotteryBallNumber('48'),
        LotteryBallNumber('52'),
        LotteryBallNumber('55'),
        LotteryBallNumber('61'),
        LotteryBallNumber('66'),
        LotteryBallNumber('70'),
        LotteryBallNumber('73'),
        LotteryBallNumber('77'),
        LotteryBallNumber('80'),
      ],
    ),
    LotteryDraw(
      id: 'qxc',
      name: '七星彩',
      issue: '2026131期',
      drawTime: '2026-11-17 (二)',
      region: LotteryRegion.national,
      numbers: const [
        LotteryBallNumber('3'),
        LotteryBallNumber('8'),
        LotteryBallNumber('1'),
        LotteryBallNumber('0'),
        LotteryBallNumber('5'),
        LotteryBallNumber('9'),
        LotteryBallNumber('2', color: BallColor.blue),
      ],
    ),
    LotteryDraw(
      id: 'qlc',
      name: '七乐彩',
      issue: '2026132期',
      drawTime: '2026-11-16 (一)',
      region: LotteryRegion.national,
      numbers: const [
        LotteryBallNumber('02'),
        LotteryBallNumber('09'),
        LotteryBallNumber('15'),
        LotteryBallNumber('21'),
        LotteryBallNumber('28'),
        LotteryBallNumber('30'),
        LotteryBallNumber('33'),
        LotteryBallNumber('12', color: BallColor.blue),
      ],
    ),
    LotteryDraw(
      id: 'gd36x7',
      name: '广东36选7',
      issue: '2026310期',
      drawTime: '2026-11-17 (二)',
      region: LotteryRegion.local,
      numbers: const [
        LotteryBallNumber('03'),
        LotteryBallNumber('08'),
        LotteryBallNumber('14'),
        LotteryBallNumber('19'),
        LotteryBallNumber('25'),
        LotteryBallNumber('31'),
        LotteryBallNumber('07', color: BallColor.blue),
      ],
    ),
    LotteryDraw(
      id: 'js7w',
      name: '江苏7位数',
      issue: '2026311期',
      drawTime: '2026-11-18 (三)',
      region: LotteryRegion.local,
      numbers: const [
        LotteryBallNumber('2'),
        LotteryBallNumber('5'),
        LotteryBallNumber('0'),
        LotteryBallNumber('8'),
        LotteryBallNumber('1'),
        LotteryBallNumber('6'),
        LotteryBallNumber('3'),
      ],
    ),
  ];

  static List<LotteryDraw> historyFor(String lotteryId) {
    final latest = latestDraws.firstWhere((d) => d.id == lotteryId);
    return List.generate(12, (i) {
      final issueNo = _shiftIssue(latest.issue, i);
      return LotteryDraw(
        id: latest.id,
        name: latest.name,
        issue: issueNo,
        drawTime: '往期示例 ${12 - i}',
        region: latest.region,
        numbers: latest.numbers,
        prizes: latest.prizes,
      );
    });
  }

  static String _shiftIssue(String issue, int back) {
    final digits = RegExp(r'\d+').firstMatch(issue)?.group(0);
    if (digits == null) return issue;
    final n = int.parse(digits) - back;
    return issue.replaceFirst(digits, '$n');
  }

  static final List<LotteryCategory> categories = [
    LotteryCategory(
      id: 'ssq',
      name: '双色球',
      region: LotteryRegion.national,
      tools: _basicTools,
    ),
    LotteryCategory(
      id: 'dlt',
      name: '大乐透',
      region: LotteryRegion.national,
      tools: _basicTools,
    ),
    LotteryCategory(
      id: 'fc3d',
      name: '福彩3D',
      region: LotteryRegion.national,
      tools: _basicTools,
    ),
    LotteryCategory(
      id: 'kl8',
      name: '快乐8',
      region: LotteryRegion.national,
      tools: _basicTools,
    ),
    LotteryCategory(
      id: 'pl3',
      name: '排列3',
      region: LotteryRegion.national,
      tools: _basicTools,
    ),
    LotteryCategory(
      id: 'pl5',
      name: '排列5',
      region: LotteryRegion.national,
      tools: _basicTools,
    ),
    LotteryCategory(
      id: 'qxc',
      name: '七星彩',
      region: LotteryRegion.national,
      tools: _basicTools,
    ),
    LotteryCategory(
      id: 'qlc',
      name: '七乐彩',
      region: LotteryRegion.national,
      tools: _basicTools,
    ),
  ];

  static const List<TrendTool> _basicTools = [
    TrendTool(title: '基本走势', icon: 'timeline'),
    TrendTool(title: '历史开奖', icon: 'history'),
    TrendTool(title: '冷热分析', icon: 'whatshot'),
    TrendTool(title: '遗漏走势', icon: 'show_chart'),
    TrendTool(title: '奇偶分析', icon: 'contrast'),
    TrendTool(title: '大小分析', icon: 'swap_vert'),
    TrendTool(title: '和值走势', icon: 'functions'),
    TrendTool(title: '玩法规则', icon: 'menu_book'),
  ];

  static const List<String> quickNews = [
    '双色球：前区连号走势偏热，关注小号回补',
    '大乐透：后区间隔拉长，可关注重号',
    '福彩3D：和值落在中区，形态以组六为主',
    '快乐8：奇偶比趋向均衡，跨度收窄',
  ];
}
