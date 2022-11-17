import 'package:flutter/material.dart';
import 'package:user_consumer/routes/route.dart';
import 'package:user_consumer/services/model/user_consumer.dart';
import 'package:user_consumer/viewmodel/view_model_home.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ViewModelHome viewModelHome = ViewModelHome();

  late Future<List<User>?> _listUser;

  @override
  void initState() {
    super.initState();
    _listUser = viewModelHome.getProviderList();
  }

  @override
  Widget build(BuildContext context) {
    double dWidth = MediaQuery.of(context).size.width;
    double dheight = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
            body: Column(
      children: [
        Container(
            color:  Colors.transparent,
            height: dheight * 0.1,
            width: double.infinity,
            child: CustomPaint(
              painter: _HeaderPainter(),
              child: const Text("USERS CONSUMER",
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 25.0,
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center),
            )),
        Expanded(
          child: FutureBuilder(
            future: _listUser,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return GridView.builder(
                    itemCount: snapshot.data?.length,
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisExtent: 130.0, crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: const EdgeInsets.only(
                              left: 30, right: 30, top: 20),
                          child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, Routes.ITEM,
                                    arguments: snapshot.data![index]);
                              },
                              child: Card(
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
                                elevation: 5.0,
                                child: Center(
                                    child: Center(
                                        child: Text(
                                  snapshot.data![index].name,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.end,
                                ))),
                              )));
                    });
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        )
      ],
    )));
  }
}

class _HeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = Colors.lightBlue;
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 20;

    final path = Path();

    /*
     moverse sin dejar linea o rastro en el PATH pintado
     path.moveTo(0,0);

     linea que se pinta en el canvas de acuerdo al PATH registrado
     path.lineTo(0, size.height);
     path.lineTo(size.width, size.height);
     path.lineTo(size.width, 0);
     */

    // linea ondulada o circular que se le da a un PATH para que se pueda pintar en el canvas
    path.lineTo(0, size.height );
    path.quadraticBezierTo(
        size.width * 0.25, size.height*1.5, size.width * 0.5, size.height );
    path.quadraticBezierTo(
        size.width * 0.75, size.height*0.5, size.width, size.height );
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
