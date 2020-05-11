import 'package:flutter/material.dart';
import 'package:my_tameen/providers/languages.dart';
import 'package:my_tameen/widgets/myorders-template.dart';
import 'package:provider/provider.dart';

class PoliciesScreen extends StatelessWidget {
  static const routeName = '/policies-screen';
  @override
  Widget build(BuildContext context) {
    final lang = Provider.of<Languages>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        title: Container(
          width: MediaQuery.of(context).size.width,
          child: Text(
            lang.translation['policies'][Languages.selectedLanguage],
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
          child: Container(
            margin: EdgeInsets.all(15),
            color: Theme.of(context).canvasColor,
            child: Text(
              "rivacy is a fundamental human right that many governments from all over the world recognize. There are numerous legislations made to support and protect an individual’s right to have their personal data kept a secret if they choose not to divulge their information. As much as possible, such legislations ensure that one’s data are safe from the unfair collection, distribution, and other types of uses that are done without the knowledge of the individual. The idea of displaying a privacy policy was required by law to respect and protect privacy even in spaces as risky as online web pages. As a private company, you have the right to protect your legal documents from the eyes of others. Yet, there’s one legal document that you’re absolutely required to divulge the contents of - the privacy policy. The law strictly regulates the practice of displaying the privacy policy on websites or apps. We’ll talk more about this in a while when we discuss the requirements when displaying your privacy policy. The definition of a privacy policy is easy to understand. It is a type of agreement required by law for those who use or collect any personal data on websites or mobile applications. It lets website visitors know that their data might be stored and used.Additionally, it reminds them that remaining on the website means that they are comfortable with the uses of their data. Simply put, it is a document that describes in detail what personal information your website collects from its visitors, along with how you store it and use it. Of course, this disclaimer shouldn’t be used to justify unscrupulous data collection and use. There are still limits to how you can use the data collected via cookies. To help you understand what we consider as “personal data” here are some of the factors that meet the criteria",
              textAlign: TextAlign.justify,
              textDirection: TextDirection.rtl,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
