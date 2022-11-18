import 'package:flutter/cupertino.dart';

import '../../widget/ScaffoldClass.dart';

class WalkScreen extends StatefulWidget {
  const WalkScreen({Key? key, this.timeInMinutes, required this.animalId})
      : super(key: key);
  final int? timeInMinutes;
  final List<int> animalId;
  @override
  State<StatefulWidget> createState() => _WalkScreen();
}

class _WalkScreen extends State<WalkScreen> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldClass(
        axis: MainAxisAlignment.center,
        children: [Text('Walk screen passed minutes ${widget.timeInMinutes}')]);
  }
}
