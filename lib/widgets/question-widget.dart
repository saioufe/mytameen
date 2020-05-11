import 'package:flutter/material.dart';
import 'package:groovin_widgets/groovin_expansion_tile.dart';

class QuestionWidget extends StatefulWidget {
  final String question;
  final String answer;

  QuestionWidget({this.question, this.answer});
  @override
  _QuestionWidgetState createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        top: 20,
      ),
      child: Material(
        color: Colors.grey[100],
        elevation: 1,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        child: GroovinExpansionTile(
          defaultTrailingIconColor: Colors.grey.withOpacity(0.5),
          leading: Icon(
            Icons.link,
            color: Colors.grey,
          ),
          title: Text(
            widget.question,
            style: TextStyle(color: Colors.black),
          ),
          onExpansionChanged: (value) {
            setState(() {
              isExpanded = value;
            });
          },
          inkwellRadius: !isExpanded
              ? BorderRadius.all(Radius.circular(8.0))
              : BorderRadius.only(
                  topRight: Radius.circular(8.0),
                  topLeft: Radius.circular(8.0),
                ),
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(5.0),
                bottomRight: Radius.circular(5.0),
              ),
              child: Container(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      widget.answer,
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
