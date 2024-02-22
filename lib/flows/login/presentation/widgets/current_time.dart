import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:make_it/common/app_styles.dart';

class CurrentTime extends StatelessWidget {
  const CurrentTime({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(const Duration(seconds: 1)),
      builder: (_, __) {
        return Text(
          DateFormat('HH:mm').format(DateTime.now()),
          style: AppStyles.shared.h1Bold,
          textAlign: TextAlign.center,
        );
      },
    );
  }
}
