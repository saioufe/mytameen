import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    'الفئات',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).bottomAppBarColor,
                        fontSize: 28),
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width / 1.3,
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 1.5,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
              ),
              itemCount: 6,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    // border: Border.all(color: Theme.of(context).primaryColor ,width: 2),
                    image: DecorationImage(
                      colorFilter: ColorFilter.mode(Colors.white70.withOpacity(0.96), BlendMode.srcATop),
                      repeat: ImageRepeat.repeatY,
                      image: AssetImage("assets/images/png/transport1.png" ),
                      fit: BoxFit.cover,
                    ),
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(18),
                    ),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Theme.of(context)
                            .bottomAppBarColor
                            .withOpacity(0.2),
                        offset: Offset(2.0, 3.0),
                        blurRadius: 1.4,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width /2.1,
                            child: Text(
                              "تامين السفر والسياحة",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              textDirection: TextDirection.rtl,
                              maxLines: 2,
                              style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(15),
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  color: Theme.of(context)
                                      .bottomAppBarColor
                                      .withOpacity(0.2),
                                  offset: Offset(2.0, 3.0),
                                  blurRadius: 1.4,
                                ),
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child:
                                Image.asset("assets/images/png/transport1.png"),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 30.0),
                        child: Text(
                          "هنا يتم وضع وصف نوع التامين بلتفصيل يفضل شرح بسيط مو مليون كلمة سيف ماهر محمد جمال الدين",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.justify,
                          textDirection: TextDirection.rtl,
                          maxLines: 3,
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
