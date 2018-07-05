import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:theratrack/theme/images.dart';
import 'package:theratrack/theme/theme.dart';

class HomePage extends StatefulWidget 
{

  @override
  State<StatefulWidget> createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage>
{
  @override
    void initState() {
      // TODO: implement initState
      super.initState();
    }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    final double bottomContainerHeight = mediaQueryData.size.height * 0.4;
    final double topContainerHeight = mediaQueryData.size.height * 0.6;

    return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: topContainerHeight,
              child: Stack(
               fit: StackFit.expand,
               children: <Widget>[
                 Image.asset(image_bg, fit: BoxFit.fill,),
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: <Widget>[
                     new Container(
                       margin: new EdgeInsets.only(top:52.0),
                       child: new SvgPicture.asset(logo),
                       width: 160.0,
                       height: 160.0,
                     )
                   ],
                 )
               ], 
              ),
            ),
            SizedBox(
              height: bottomContainerHeight,
              child: Container(
                color: background, 
              ),
            )
          ],
        );
  }

}