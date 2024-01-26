import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Offset offset = const Offset(10, 10);
  bool _isPressed = true;

  void _onPointerUp(PointerUpEvent event){
    setState(() {
      _isPressed = true;
    });
  }

  void _onPointerDown(PointerDownEvent event){
    setState(() {
      _isPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            Neumorphic(
              style: NeumorphicStyle(
                color: Colors.grey[400],
              ),
              child: TextField(),
            ),
            // custom
            Listener(
              onPointerUp: _onPointerUp,
              onPointerDown: _onPointerDown,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 100),
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey[400],
                  boxShadow: _isPressed ?[

                    BoxShadow(
                      color: Colors.grey,
                      blurRadius:15,
                      spreadRadius: 5,
                      offset: offset,
                    ),

                    BoxShadow(
                      color: Colors.white12,
                      blurRadius: 15,
                      spreadRadius: 5,
                      offset: -offset,
                    ),

                  ]:null,
                ),
                child: MaterialButton(
                  splashColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  onPressed: (){
                    // _isPressed = !_isPressed;
                    // setState(() {});
                    // Future.delayed(const Duration(milliseconds: 400)).then((value) {
                    //   _isPressed = !_isPressed;
                    //   setState(() {});
                    // });
                  },
                  child: const Text("Press"),
                ),
              ),
            ),

            ClayText("Seize the Clay!", emboss: true, size: 40, color: Colors.grey[400],),

            //clay package
            ClayContainer(
              emboss: true,
              height: 200,
              width: 200,
              color: Colors.grey[400],
              borderRadius: 50,
            ),

            ClayContainer(
              color: Colors.grey[400],
              height: 150,
              width: 150,
              customBorderRadius: BorderRadius.only(
                  topRight: Radius.elliptical(150, 150),
                  bottomLeft: Radius.circular(50)),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ClayAnimatedContainer(
                  duration: const Duration(seconds: 2),
                  color: Colors.grey[400],
                  height: 150,
                  width: 150,
                  borderRadius: 75,
                  curveType: CurveType.concave,
                ),
                const SizedBox(width: 50),
                ClayContainer(
                  color: Colors.grey[400],
                  height: 150,
                  width: 150,
                  borderRadius: 75,
                  curveType: CurveType.none,
                ),
                const SizedBox(width: 50),
                ClayContainer(
                  color: Colors.grey[400],
                  height: 150,
                  width: 150,
                  borderRadius: 75,
                  curveType: CurveType.convex,
                ),
              ],
            ),

            NeumorphicButton(),



          ],
        ),
      ),
    );
  }
}
