import 'package:material_ui/material_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/theme/app_colors.dart';
import '../data/models/lottery_models.dart';

class LotteryBall extends StatelessWidget {
  const LotteryBall({
    super.key,
    required this.number,
    this.size,
  });

  final LotteryBallNumber number;
  final double? size;

  @override
  Widget build(BuildContext context) {
    final dim = size ?? 28.w;
    final bg = number.color == BallColor.blue ? AppColors.ballBlue : AppColors.ballRed;

    return Container(
      width: dim,
      height: dim,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: bg,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: bg.withValues(alpha: 0.25),
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Text(
        number.value,
        style: TextStyle(
          color: Colors.white,
          fontSize: (dim * 0.38).clamp(10, 14),
          fontWeight: FontWeight.w700,
          height: 1,
        ),
      ),
    );
  }
}

class LotteryBallRow extends StatelessWidget {
  const LotteryBallRow({
    super.key,
    required this.numbers,
    this.ballSize,
    this.spacing,
    this.wrap = true,
  });

  final List<LotteryBallNumber> numbers;
  final double? ballSize;
  final double? spacing;
  final bool wrap;

  @override
  Widget build(BuildContext context) {
    final gap = spacing ?? 6.w;
    final children = numbers
        .map((n) => LotteryBall(number: n, size: ballSize))
        .toList();

    if (!wrap) {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            for (var i = 0; i < children.length; i++) ...[
              if (i > 0) SizedBox(width: gap),
              children[i],
            ],
          ],
        ),
      );
    }

    return Wrap(
      spacing: gap,
      runSpacing: gap,
      children: children,
    );
  }
}
