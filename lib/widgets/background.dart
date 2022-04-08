import 'package:firstapplicationsqyavril2022/widgets/CustomClip.dart';
import 'package:flutter/material.dart';

class Background extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return backgroundState();
  }
}

class backgroundState extends State<Background>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodyPage(),
    );
  }

  Widget bodyPage() {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: 150),
      duration: const Duration(seconds: 8),
      curve: Curves.elasticOut,
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.blue,
      ),
      builder: (context, value, child) {
        return ClipPath(clipper: CustomClip(value), child: child);
      },
    );
  }
}
