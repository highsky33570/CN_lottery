import 'package:material_ui/material_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/theme/app_colors.dart';

class MinePage extends StatelessWidget {
  const MinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('我的')),
      body: ListView(
        padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 24.h),
        children: [
          Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFFE60012), Color(0xFFFF5A5A)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 24.r,
                  backgroundColor: Colors.white.withValues(alpha: 0.2),
                  child: Icon(Icons.person, color: Colors.white, size: 28.sp),
                ),
                SizedBox(width: 12.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '开奖访客',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      '数据来源接入后自动更新',
                      style: TextStyle(color: Colors.white70, fontSize: 12.sp),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 12.h),
          _Group(
            children: const [
              _Tile(icon: Icons.notifications_none, title: '开奖提醒'),
              _Tile(icon: Icons.favorite_border, title: '我的收藏'),
              _Tile(icon: Icons.cached, title: '清除缓存'),
            ],
          ),
          SizedBox(height: 10.h),
          _Group(
            children: const [
              _Tile(icon: Icons.info_outline, title: '关于我们'),
              _Tile(icon: Icons.description_outlined, title: '使用说明'),
            ],
          ),
          SizedBox(height: 20.h),
          Center(
            child: Text(
              'CN Lottery v1.0.0',
              style: TextStyle(fontSize: 12.sp, color: AppColors.textMuted),
            ),
          ),
        ],
      ),
    );
  }
}

class _Group extends StatelessWidget {
  const _Group({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
        side: const BorderSide(color: AppColors.border),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(children: children),
    );
  }
}

class _Tile extends StatelessWidget {
  const _Tile({required this.icon, required this.title});

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: AppColors.primary, size: 22.sp),
      title: Text(title, style: TextStyle(fontSize: 14.sp)),
      trailing: Icon(Icons.chevron_right, color: AppColors.textMuted, size: 20.sp),
      onTap: () {},
    );
  }
}
