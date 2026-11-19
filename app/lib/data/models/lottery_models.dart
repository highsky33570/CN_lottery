enum LotteryRegion { national, local }

enum BallColor { red, blue }

class LotteryBallNumber {
  const LotteryBallNumber(this.value, {this.color = BallColor.red});

  final String value;
  final BallColor color;
}

class PrizeTier {
  const PrizeTier({
    required this.name,
    required this.condition,
    required this.winners,
    required this.amount,
  });

  final String name;
  final String condition;
  final String winners;
  final String amount;
}

class LotteryDraw {
  const LotteryDraw({
    required this.id,
    required this.name,
    required this.issue,
    required this.drawTime,
    required this.numbers,
    required this.region,
    this.scheduleHint,
    this.firstPrizeCount,
    this.prizePool,
    this.sales,
    this.prizes = const [],
    this.source = 'mock',
  });

  final String id;
  final String name;
  final String issue;
  final String drawTime;
  final List<LotteryBallNumber> numbers;
  final LotteryRegion region;
  final String? scheduleHint;
  final String? firstPrizeCount;
  final String? prizePool;
  final String? sales;
  final List<PrizeTier> prizes;
  final String source;
}

class TrendTool {
  const TrendTool({required this.title, required this.icon});

  final String title;
  final String icon; // Material icon name key for mock
}

class LotteryCategory {
  const LotteryCategory({
    required this.id,
    required this.name,
    required this.region,
    required this.tools,
  });

  final String id;
  final String name;
  final LotteryRegion region;
  final List<TrendTool> tools;
}
