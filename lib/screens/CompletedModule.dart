import 'package:flutter/material.dart';

class CompletedModule extends StatefulWidget {
  // List<Module> completedModule = [];
  var csModules = [
    "CS1101S Programming Methodology",
    "CS1231S Discrete Structures",
    "MA1521 Calculus for Computing",
    "MA1101R Linear Algebra I",
    "ULR",
    "CS2030S Programming Methodology II",
    "CS2040S Data Structures and Algorithms",
    "CS2100 Computer Organisation",
    "IS1103 Ethics in Computing",
    "ULR",
    "CP2106 Independent Software Development Project (Orbital)",
    "CS2103T Software Engineering",
    "CS2105 Introduction to Computer Networks",
    "CS2106 Introduction to Operating Systems",
    "ST2334 Probability and Statistics",
    "ULR",
    "CS3230 Design and Analysis of Algorithms",
    "ES2660 Communicating in the Information Age",
    "Focus Area",
    "ULR",
    "ULR",
    "CS3203 Software Engineering Project",
    "CS3219 Software Engineering Principles and Patterns",
    "CS4211 Formal Methods for Software Engineering",
    "CS4239 Software Security",
    "CS4218 Software Testing",
    "Science",
    "UE",
    "UE",
    "UE",
    "Focus Area",
    "UE",
    "UE",
    "UE",
    "UE"
  ];

  // CompletedModule(this.completedModule,);

  @override
  _CompletedModuleState createState() => _CompletedModuleState();
}

class _CompletedModuleState extends State<CompletedModule> {
  // Image appBarImage(BuildContext context) {
  //   // int hour = DateTime.parse("2020-06-13 18:00:04Z").hour;
  //   int hour = DateTime.now().hour;
  //   String imageUrl;

  //   if (hour >= 6 && hour <= 11) imageUrl = 'assets/images/Sunrise.jpg';
  //   if (hour > 11 && hour <= 16) imageUrl = 'assets/images/Afternoon.jpg';
  //   if (hour > 16 && hour <= 19) imageUrl = 'assets/images/Sunset.jpg';
  //   if (hour > 19 || hour < 6) imageUrl = 'assets/images/NightSky.jpg';

  //   print(DateTime.now());

  //   return Image.asset(
  //     imageUrl,
  //     fit: BoxFit.cover, //can be Boxfit.fill
  //     height: MediaQuery.of(context).size.height * 0.4,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/soc.jpg'), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        // drawer: AppDrawer(),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Colors.blueAccent,
              iconTheme: new IconThemeData(color: Colors.white, size: 20),
              centerTitle: false,
              forceElevated: false,
              expandedHeight: 250,
              floating: true,
              pinned: false,
              title: Text(
                'Completed Modules',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.white),
              ),
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                background: Stack(
                  children: <Widget>[
                    Positioned.fill(
                        child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50)),
                      child: Image.asset('assets/images/soc.jpg'),
                    )),
                    // Padding(
                    //     padding: EdgeInsets.only(top: 80),
                    //     child: PieChartDiagram(widget._completedTask,
                    //         widget._userToDo, UniqueKey()))
                  ],
                ),
              ),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              for (var i = 0; i < widget.csModules.length; i++)
                Container(
                  child: Text(widget.csModules[i]),
                  height: 100,
                  color: Colors.orange,
                )
            ]))
          ],
        ),
      ),
    );
  }
}
