import 'package:flutter/material.dart';
import 'package:my_tameen/models/companies.dart';
import 'package:my_tameen/providers/ordering.dart';
import 'package:provider/provider.dart';

import 'company-template.dart';

class CompaniesWidgetSea extends StatefulWidget {
  final PageController c;
  CompaniesWidgetSea(this.c);

  @override
  _CompaniesWidgetSeaState createState() => _CompaniesWidgetSeaState();
}

class _CompaniesWidgetSeaState extends State<CompaniesWidgetSea> {
  @override
  Widget build(BuildContext context) {
    final allPosts = Provider.of<Ordering>(context, listen: false);

    return SingleChildScrollView(
        child: FutureBuilder(
            future: allPosts.fetchDataCompanies(),
            builder: (ctx, authResultSnap) {
              if (authResultSnap.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (authResultSnap.hasError) {
                print(authResultSnap.error);
                return RaisedButton(
                  onPressed: () {
                    setState(() {
                      //other.getUserLocation();
                    });
                  },
                  child: Text("تفقد من الاتصال بلانترنت",
                      style: TextStyle(color: Colors.black)),
                );
              } else {
                return Template(allPosts: allPosts, widget: widget);
              }
            }));
  }
}

class Template extends StatelessWidget {
  const Template({
    Key key,
    @required this.allPosts,
    @required this.widget,
  }) : super(key: key);

  final Ordering allPosts;
  final CompaniesWidgetSea widget;

  @override
  Widget build(BuildContext context) {
    double thePrice;
    return Column(
        children: allPosts.companies.map((item) {
      if (allPosts.theSeaData.seaType == "قوارب ويخوت") {
        if (allPosts.theSeaData.limitOfResp == "100000") {
          thePrice = (double.parse(item.boats_100000));
        } else if (allPosts.theSeaData.limitOfResp == "50000") {
          thePrice = (double.parse(item.boats_50000));
        } else if (allPosts.theSeaData.limitOfResp == "30000") {
          thePrice = (double.parse(item.boats_30000));
        } else if (allPosts.theSeaData.limitOfResp == "10000") {
          thePrice = (double.parse(item.boats_10000));
        }
      } else if (allPosts.theSeaData.seaType == "جت سكي") {
        if (allPosts.theSeaData.limitOfResp == "10000") {
          thePrice = (double.parse(item.jetski_10000));
        }
      }

      if (item.insurance_type == "التأمين البحري") {
        return CompanyTemplate(
          c: widget.c,
          company: Companies(
            id: item.id,
            name_arabic: item.name_arabic,
            name_english: item.name_english,
            toc_arabic: item.toc_arabic,
            toc_english: item.toc_english,
            logo: item.logo,
            is_takaful: item.is_takaful,
            is_featured: item.is_featured,
            insurance_type: item.insurance_type,
            american: item.american,
            asian: item.asian,
            euro: item.euro,
            pickup: item.pickup,
            chines: item.chines,
            sport: item.sport,
            price: thePrice,
            small_10: item.small_10,
            small_15: item.small_15,
            small_20: item.small_20,
            medium_10: item.medium_10,
            medium_15: item.medium_15,
            medium_20: item.medium_20,
            large_10: item.large_10,
            large_15: item.large_15,
            large_20: item.large_20,
            not_allow: item.not_allow,
            help_allways: item.help_allways,
            jeep_forOther: item.jeep_forOther,
            salon_forOther: item.salon_forOther,
            other_forOther: item.other_forOther,
            pickup_forOther: item.pickup_forOther,
            boats_100000: item.boats_100000,
            boats_50000: item.boats_50000,
            boats_30000: item.boats_30000,
            boats_10000: item.boats_10000,
            jetski_10000: item.jetski_10000,
                        travel_single_silver: item.travel_single_silver,
            travel_single_gold: item.travel_single_gold,
            travel_single_platinum: item.travel_single_platinum,
            travel_family_silver: item.travel_family_silver,
            travel_family_gold: item.travel_family_gold,
            travel_family_platinum: item.travel_family_platinum,
          ),
          isLast: false,
          isNotSpical: true,
        );
      } else {
        return SizedBox(
          height: 1,
        );
      }
    }).toList());
  }
}
