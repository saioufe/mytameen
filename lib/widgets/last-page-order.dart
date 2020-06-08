import 'package:flutter/material.dart';
import 'package:my_tameen/providers/ordering.dart';
import 'package:my_tameen/widgets/addon-template.dart';
import 'package:my_tameen/widgets/companies.dart';
import 'package:my_tameen/widgets/last-form.dart';
import 'package:provider/provider.dart';

import 'company-template.dart';

class LastPageOrdert extends StatefulWidget {
  final PageController c;
  LastPageOrdert(this.c);
  @override
  _LastPageOrdertState createState() => _LastPageOrdertState();
}

class _LastPageOrdertState extends State<LastPageOrdert> {
  @override
  Widget build(BuildContext context) {
    final allOrder = Provider.of<Ordering>(context, listen: false);
    allOrder.fetchDataPromocodes();
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          UpperLabel(label: "- الشركة المختارة -"),
          CompanyTemplate(
            c: widget.c,
            company: allOrder.selectedCompany,
            isLast: true,
          ),
          LastForm(),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

class UpperLabel extends StatelessWidget {
  final String label;
  const UpperLabel({
    @required this.label,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        fontSize: 18,
        color: Theme.of(context).bottomAppBarColor.withOpacity(0.5),
      ),
    );
  }
}
