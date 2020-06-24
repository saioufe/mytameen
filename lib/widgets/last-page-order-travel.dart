import 'package:flutter/material.dart';
import 'package:my_tameen/providers/ordering.dart';
import 'package:my_tameen/widgets/addon-template.dart';
import 'package:my_tameen/widgets/companies.dart';
import 'package:my_tameen/widgets/last-form-sea.dart';
import 'package:my_tameen/widgets/last-form-travel.dart';
import 'package:my_tameen/widgets/last-form.dart';
import 'package:provider/provider.dart';

import 'company-template.dart';

class LastPageOrderTravel extends StatefulWidget {
  final PageController c;
  LastPageOrderTravel(this.c);
  @override
  _LastPageOrderTravelState createState() => _LastPageOrderTravelState();
}

class _LastPageOrderTravelState extends State<LastPageOrderTravel> {
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
          LastFormTravel(),
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
