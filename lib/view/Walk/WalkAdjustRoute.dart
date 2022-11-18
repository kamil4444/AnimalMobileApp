import 'package:animal_app/widget/ScaffoldClass.dart';
import 'package:flutter/cupertino.dart';

class WalkAdjustRoute extends StatefulWidget {
  const WalkAdjustRoute({Key? key, this.timeInMinutes, required this.animalId})
      : super(key: key);
  final int? timeInMinutes;
  final List<int> animalId;
  @override
  State<StatefulWidget> createState() => _WalkAdjustRoute();
}

class _WalkAdjustRoute extends State<WalkAdjustRoute> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldClass(axis: MainAxisAlignment.center, children: [
      Text(
          'Walking Adjust Route. Time in minutes ${widget.timeInMinutes}. Animals passed ${widget.animalId}')
    ]);
  }
}
