import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme/theme.dart';
import '../theme/images.dart';
import 'package:quiver/strings.dart';
import 'package:validator/validator.dart';
import 'ensure_visible.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => new _LoginFormState();
}

class _LoginFormState extends State<LoginForm> with SingleTickerProviderStateMixin {
  Offset position = new Offset(0.0, 0.0);
  final Offset min = const Offset(0.0, 0.0);
  final Offset max = const Offset(110.0, 110.0);

  AnimationController _buttonAnimationController;
  final GlobalKey<FormState> _key = new GlobalKey<FormState>();

  @override
    void initState() {
      // TODO: implement initState
      super.initState();
   
      _buttonAnimationController = new AnimationController(vsync: this, duration: new Duration(milliseconds: 3000))
      ..addListener(() {
        setState(() {
           print('Test');
           var f = Offset.lerp(min, max, _buttonAnimationController.value);
           position =  f;
        });
      })
      ..addStatusListener((AnimationStatus status) {
        if(status == AnimationStatus.completed) {
            setState(() {
              position = new Offset(0.0, 0.0);
            });
        }
       
      });

    }
 
 @override
   void dispose() {
     // TODO: implement dispose
     super.dispose();
     _buttonAnimationController.dispose();
   }
  

  @override
  Widget build(BuildContext context) {
      return new Container(
        height: 320.0,
        child: _buildForm(),
      );
  }

  Widget _buildForm() {
    return new Form(
      key: _key,
      child: Stack(
        children: <Widget>[
          new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              new Container(
                margin: const EdgeInsets.all(16.0),
                padding: const EdgeInsets.only(left: 32.0, right: 32.0, top:32.0),
                decoration: new BoxDecoration(
                    borderRadius:
                        const BorderRadius.all(const Radius.circular(10.0)),
                    color: white,
                    boxShadow: <BoxShadow>[
                      new BoxShadow(
                        blurRadius: 8.0,
                        offset: const Offset(0.0, 2.0),
                        color: dropShadow,
                      )
                    ]),
                height: 210.0,
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    new Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: new EnsureVisible(
                          builder: (BuildContext context, FocusNode focusNode) {
                            return new TextFormField(
                                focusNode: focusNode,
                                keyboardType: TextInputType.emailAddress,
                                decoration: new InputDecoration(
                                    hintText:"Email...",
                                    hintStyle: bodyplaceholder,
                                    prefixIcon: new Container(
                                      padding: new EdgeInsets.only(right: 8.0),
                                      child: new SvgPicture.asset(icon_email),
                                      width: 32.0,
                                      height: 32.0,
                                    ),
                                ),
                                style: body,
                                key: new Key("email"),
                                validator: (val) {
                                  if (isBlank(val)) {
                                    return 'email is required';
                                  }
                                  if (!isEmail(val)) {
                                    return 'email is invalid';
                                  }
                                },
                              );
                          },
                      ),
                    ),
                    new EnsureVisible(
                      builder: (BuildContext context, FocusNode focusNode) {
                        return  new TextFormField(
                                focusNode: focusNode,
                                decoration: new InputDecoration(
                                    hintText:"Password...",
                                    hintStyle: bodyplaceholder,
                                    prefixIcon: new Container(
                                      padding: new EdgeInsets.only(right: 8.0),
                                      child: new SvgPicture.asset(icon_password),
                                      width: 32.0,
                                      height: 32.0,
                                    ),
                                ),
                                style: body,
                                key: new Key("password"),
                                obscureText: true,
                                validator: (val) {
                                  if (isBlank(val)) {
                                    return 'password is required';
                                  }
                                
                                },
                              );
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
          new Positioned(
            left: position.dx,
            right: position.dy,
            bottom: 0.0,
            child: FractionalTranslation(
              translation: new Offset(0.0, -1.0),
                child: new Container(
                    child: new RaisedButton(
                      splashColor: dropShadow,
                      onPressed: () {
                        if(_key.currentState.validate()) {
                            _buttonAnimationController.forward(from: 0.0);
                        }
                      },
                      color: tealBlue,
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                      child: new Text("Sign in", style: buttonText),
                    ),
                    padding: const EdgeInsets.only(left: 48.0, right: 48.0),
                    height: 60.0,
                  ),
            ),
            ),
        ],
      ),
    );
  }
}