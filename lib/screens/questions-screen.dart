import 'package:flutter/material.dart';
import 'package:groovin_widgets/groovin_widgets.dart';
import 'package:my_tameen/providers/importantQuestion.dart';
import 'package:my_tameen/providers/languages.dart';
import 'package:my_tameen/widgets/question-widget.dart';
import 'package:provider/provider.dart';

class QuestionsScreen extends StatelessWidget {
  static const routeName = '/question-screen';

  Widget build(BuildContext context) {
    final lang = Provider.of<Languages>(context, listen: false);
    final allQuestions =
        Provider.of<ImportantQuestions>(context, listen: false);

    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        title: Container(
          width: MediaQuery.of(context).size.width,
          child: Text(
            lang.translation['commonQuestions'][Languages.selectedLanguage],
            textAlign: TextAlign.right,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontFamily: "tajawal",
                color: Colors.white,
                fontSize: 28),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Languages.selectedLanguage == 0
                ? Column(
                    children: allQuestions.questions.map((item) {
                    return QuestionWidget(
                      question: item.question,
                      answer: item.answer,
                    );
                  }).toList())
                : Column(
                    children: allQuestions.questions2.map((item) {
                    return QuestionWidget(
                      question: item.question,
                      answer: item.answer,
                    );
                  }).toList())),
      ),
    );
  }
}
