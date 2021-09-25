import 'dart:async';
import 'dart:math';

import 'package:equbchallange/data/model/bank_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BankChartInfo extends StatefulWidget {
  // mock data
  final List<BankInfo> dataSet = [
    BankInfo(value: 0.2, label: 'Awash', color: Colors.red),
    BankInfo(value: 0.2, label: 'Coop', color: Colors.yellow),
    BankInfo(value: 0.2, label: 'CBE', color: Colors.blue),
    BankInfo(value: 0.2, label: 'Berhan', color: Colors.brown),
    BankInfo(value: 0.2, label: 'Zemen', color: Colors.green),
  ];

  BankChartInfo({Key? key}) : super(key: key);

  @override
  _BankChartInfoState createState() => _BankChartInfoState();
}

class _BankChartInfoState extends State<BankChartInfo> {
  late Timer timer;
  double fullAngle = 0.0;
  double secondsToComplete = 5.0;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(milliseconds: 100 ~/ 60), (timer) {
      setState(() {
        fullAngle += 360.0 / (secondsToComplete * 1000 ~/ 60);
        if (fullAngle >= 360.0) {
          fullAngle = 360.0;
          timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomPaint(
        child: Container(),
        painter: BankChartInfoPainter(widget.dataSet, fullAngle),
      ),
    );
  }
}

final linePaint = Paint()
  ..color = Colors.white
  ..strokeWidth = 1.0
  ..style = PaintingStyle.stroke;

final midPaint = Paint()
  ..color = Colors.white
  ..style = PaintingStyle.fill;

const textFieldTextBigStyle = TextStyle(
    color: Colors.black38, fontWeight: FontWeight.bold, fontSize: 30.0);

const labelStyle = TextStyle(
  color: Colors.white,
  fontSize: 8.0,
  fontWeight: FontWeight.bold,
);

class BankChartInfoPainter extends CustomPainter {
  final List<BankInfo> dataSet;
  final double fullAngle;

  BankChartInfoPainter(this.dataSet, this.fullAngle);

  @override
  void paint(Canvas canvas, Size size) {
    final c = Offset(size.width / 2.0, size.height / 2.0);
    final radius = size.width * 0.9;
    final rect = Rect.fromCenter(center: c, width: radius, height: radius);
    var startAngle = 0.0;
    canvas.drawArc(rect, startAngle, fullAngle * pi / 180.0, false, linePaint);

    dataSet.forEach((d) {
      final sweepAngle = d.value * fullAngle * pi / 180.0;
      drawSector(canvas, d, rect, startAngle, sweepAngle);
      startAngle += sweepAngle;
    });
    startAngle = 0.0;
    dataSet.forEach((d) {
      final sweepAngle = d.value * fullAngle * pi / 180.0;
      drawLables(canvas, c, radius, startAngle, sweepAngle,
          ((d.value * 100)).toStringAsFixed(0) + '%');
      startAngle += sweepAngle;
    });

    dataSet.forEach((d) {
      final sweepAngle = d.value * fullAngle * pi / 180.0;
      drawLine(canvas, c, radius, startAngle);
      startAngle += sweepAngle;
    });

    // Draw the middle
    canvas.drawCircle(c, radius * 0.37, midPaint);
    // Draw title
    drawTextCentered(
        canvas, c, "Bank Name", textFieldTextBigStyle, radius * 0.8);
  }

  void drawLine(Canvas canvas, Offset c, double radius, double startAngle) {
    final dx = radius / 2.0 * cos(startAngle);
    final dy = radius / 2.0 * sin(startAngle);
    final p2 = c + Offset(dx, dy);
    canvas.drawLine(c, p2, linePaint);
  }

  double drawSector(Canvas canvas, BankInfo d, Rect rect, double startAngle,
      double sweepAngle) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = d.color;

    canvas.drawArc(rect, startAngle, sweepAngle, true, paint);

    return sweepAngle;
  }

  void drawLables(Canvas canvas, Offset c, double radius, double startAngle,
      double sweepAngle, String label) {
    final r = radius * 0.42;
    final dx = r * cos(startAngle + sweepAngle / 2.0);
    final dy = r * sin(startAngle + sweepAngle / 2.0);
    final position = c + Offset(dx, dy);
    drawTextCentered(canvas, position, label, labelStyle, 100.0);
  }

  TextPainter measureText(
      String s, TextStyle style, double maxWidth, TextAlign align) {
    final span = TextSpan(text: s, style: style);
    final tp = TextPainter(
        text: span, textAlign: align, textDirection: TextDirection.ltr);
    // ellipsis
    tp.layout(minWidth: 0, maxWidth: maxWidth);
    return tp;
  }

  Size drawTextCentered(Canvas canvas, Offset position, String text,
      TextStyle style, double maxWidth) {
    final tp = measureText(text, style, maxWidth, TextAlign.center);
    final pos = position + Offset(-tp.width / 2.0, -tp.height / 2.0);

    tp.paint(canvas, pos);
    return tp.size;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
