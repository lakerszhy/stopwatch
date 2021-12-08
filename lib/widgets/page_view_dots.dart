import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stopwatch/blocs/page_view/page_view_cubit.dart';

class PageViewDots extends StatelessWidget {
  const PageViewDots({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageViewCubit, int>(
      builder: (context, state) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _Dot(isSelected: state == 0),
            const SizedBox(width: 12),
            _Dot(isSelected: state == 1),
          ],
        );
      },
    );
  }
}

class _Dot extends StatelessWidget {
  final bool isSelected;

  const _Dot({Key? key, required this.isSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isSelected ? Colors.white : Colors.white.withOpacity(0.5),
      ),
    );
  }
}
