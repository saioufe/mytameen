import 'package:flutter/material.dart';
import 'package:my_tameen/models/categories.dart';
import 'package:my_tameen/screens/category-pressed-screen.dart';
import 'package:provider/provider.dart';
import '../providers/allProvider.dart';

class CategoryTemplate extends StatelessWidget {
  const CategoryTemplate({
    Key key,
    @required this.animationController,
    @required this.animation,
  }) : super(key: key);

  final AnimationController animationController;
  final Animation animation;

  @override
  Widget build(BuildContext context) {
    final allCategories = Provider.of<AllProvider>(context, listen: false);
    return SizedBox(
      //height: MediaQuery.of(context).size.height * 3.55,
      child: CategoryItem(
        animationController: animationController,
        animation: animation,
        category: allCategories.categories,
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    Key key,
    @required this.animationController,
    @required this.animation,
    @required this.category,
  }) : super(key: key);

  final AnimationController animationController;
  final Animation animation;
  final List<Categories> category;
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return FadeTransition(
          opacity: animation,
          child: new Transform(
            transform: new Matrix4.translationValues(
                0.0, 30 * (1.0 - animation.value), 0.0),
            child: Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width / 1.3,
                  child: GridView.builder(
                    // controller: scrollController,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      childAspectRatio: 1.0,
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                    ),
                    itemCount: category.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                              CategoryPressedScreen.routeName,
                              arguments: category[index]);
                        },
                        child: Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            // border: Border.all(color: Theme.of(context).primaryColor ,width: 2),
                            image: DecorationImage(
                              colorFilter: ColorFilter.mode(
                                  Colors.white70.withOpacity(0.96),
                                  BlendMode.srcATop),
                              repeat: ImageRepeat.repeatY,
                              image: NetworkImage(
                                  "${AllProvider.hostName}/images/categories/${category[index].image}"),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2.1,
                                    child: Text(
                                      category[index].title,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      textDirection: TextDirection.rtl,
                                      maxLines: 2,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
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
                                    child: Image.network(
                                        "${AllProvider.hostName}/images/categories/${category[index].image}"),
                                  ),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 30.0),
                                child: Text(
                                  category[index].text,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.justify,
                                  textDirection: TextDirection.rtl,
                                  maxLines: 3,
                                  style: TextStyle(fontSize: 17),
                                ),
                              ),
                            ],
                          ),
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
          ),
        );
      },
    );
  }
}
