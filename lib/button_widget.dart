import 'package:flutter/material.dart';

class ButtonWidget extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  final Color color;
  final bool? large;
  ButtonWidget(this.large,
      {Key? key, required this.label, required this.onTap, required this.color})
      : super(key: key);

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: InkWell(
        onTap: widget.onTap,
        child: Container(
          width: widget.large == false ? 72 : 160,
          height: 72,
          decoration: BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.circular(500),
          ),
          child: Center(
            child: Text(
              widget.label,
              style: TextStyle(
                color: Colors.blueGrey[800],
                fontSize: 32,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
