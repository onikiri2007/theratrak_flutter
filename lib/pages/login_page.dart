import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import '../theme/theme.dart';
import '../theme/images.dart';
import '../components/login_form.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

final MediaQueryData mediaQueryData = MediaQuery.of(context);
  
    return new Scaffold(
        body: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            new Expanded(
            child: new Container(
              color: seafoamBlue,
              child: new ListView(
                 children: <Widget>[
                   new SizedBox(
                          child: _buildContent(context),
                          height: mediaQueryData.size.height
                )

                 ],
               ),
            )
            
            
            
        )
          ],
    ));
  }
}


Widget _buildContent(BuildContext context) {
  final MediaQueryData mediaQueryData = MediaQuery.of(context);
  final double bottomContainerHeight = mediaQueryData.size.height * 0.4;
  return new Stack(fit: StackFit.expand, children: <Widget>[
              new Image.asset(image_bg, fit: BoxFit.fill,),
              new Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    new Container(
                      color: background,
                      height: bottomContainerHeight,
                      child: new Container(
                        color: background,
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Padding(
                              padding: const EdgeInsets.only(top: 130.0, bottom: 14.0),
                              child: new GestureDetector(
                                onTap: () => print('ddd'),
                                child: new Text("forgot password?",
                                    style: metalink),
                              ),
                            ),
                            new Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Text("Don't have an account? ",
                                    style: meta),
                                new GestureDetector(
                                  onTap: () => print('ddd'),
                                  child: new Text(
                                    "Contact us",
                                    style: metalink,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ]),
              new Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Center(
                    child: new Container(
                      margin: const EdgeInsets.only(top: 60.0, bottom: 48.0),
                      child: new SvgPicture.asset(logo),
                      width: 128.0,
                      height: 128.0,
                    ),
                  ),

                  Center(
                    child:  Container(
                      child: new LoginForm()
                    )
                  )
                ],
              ),
            ]);
}