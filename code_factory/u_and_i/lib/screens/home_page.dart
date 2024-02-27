import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // 처음 만난 날의 상태를 관리해야 합니다.
  // 이 값을 변수에 할당하고 기본값은 오늘로 지정합니다.
  DateTime firstDay = DateTime.now();

  Future<void> onHeartPressed() async {
    DateTime? selectedDay = await showDatePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2099),
    );

    if (selectedDay == null) {
      return;
    }
    
    setState(() {
      firstDay = selectedDay;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: SafeArea(
        top: true,
        bottom: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _DDay(
              onHeartPressed: onHeartPressed,
              firstDay: firstDay,
            ),
            _CoupleImage(),
          ],
        ),
      ),
    );
  }
}

class _DDay extends StatelessWidget {
  final GestureTapCallback onHeartPressed;
  final DateTime firstDay;

  const _DDay({
    super.key,
    required this.onHeartPressed,
    required this.firstDay,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final dateDifference = DateTime(today.year, today.month, today.day).difference(firstDay).inDays;
    late String dDayText;
    
    if (dateDifference > 0) {
      dDayText = 'D+$dateDifference';
    } else if (dateDifference == 0) {
      dDayText = 'D-Day';
    } else {
      dDayText = 'D$dateDifference';
    }

    return Column(
      children: [
        SizedBox(
          height: 16,
        ),
        Text(
          'U & I',
          style: textTheme.displayLarge,
        ),
        Text(
          '우리 처음 만난 날',
          style: textTheme.bodyLarge,
        ),
        Text(
          '${firstDay.year}.${firstDay.month}.${firstDay.day}',
          style: textTheme.bodyMedium,
        ),
        SizedBox(height: 16),
        IconButton(
          onPressed: onHeartPressed,
          icon: Icon(
            Icons.favorite,
            color: Colors.red,
          ),
        ),
        SizedBox(height: 16),
        Text(
          dDayText,
          style: textTheme.displayMedium,
        ),
      ],
    );
  }
}

class _CoupleImage extends StatelessWidget {
  const _CoupleImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Image.asset(
        'assets/images/couple_image.png',
        height: MediaQuery.of(context).size.height / 2,
      ),
    );
  }
}
