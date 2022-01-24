import 'package:flutter/material.dart';
import 'package:easy_localization/src/public_ext.dart';

enum TrackerRange { country, worldwide }

class RangeSlectionView extends StatefulWidget {
  final void Function(TrackerRange) onChangeRange;
  const RangeSlectionView({Key? key, required this.onChangeRange})
      : super(key: key);

  @override
  _RangeSlectionViewState createState() => _RangeSlectionViewState();
}

class _RangeSlectionViewState extends State<RangeSlectionView> {
  int selectedIndex = 0;
  final _selectedTextColor = Colors.black;
  final _unselectedTextColor = Colors.black.withOpacity(0.5);
  final _selectedFontWeight = FontWeight.bold;
  final _unselectedFontWeight = FontWeight.normal;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(36, 18, 36, 18),
      child: Row(
        children: [
          const Spacer(),
          buildRangeView(0, TrackerRange.country),
          const Spacer(),
          buildRangeView(1, TrackerRange.worldwide),
          const Spacer(),
        ],
      ),
    );
  }

  GestureDetector buildRangeView(int index, TrackerRange range) {
    bool isSelected = selectedIndex == index;
    String title = getTitle(range);
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
        widget.onChangeRange(range);
      },
      child: Text(title,
          style: TextStyle(
              color: isSelected ? _selectedTextColor : _unselectedTextColor,
              fontWeight:
                  isSelected ? _selectedFontWeight : _unselectedFontWeight)),
    );
  }

  String getTitle(TrackerRange range) {
    switch (range) {
      case TrackerRange.country:
        return "country".tr();
      case TrackerRange.worldwide:
        return "worldwide".tr();
    }
  }
}
