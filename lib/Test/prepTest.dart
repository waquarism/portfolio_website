import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/tab_controller.dart';

class Subject extends StatefulWidget {
  const Subject({Key? key}) : super(key: key);

  @override
  State<Subject> createState() => _SubjectState();
}

class _SubjectState extends State<Subject> with TickerProviderStateMixin {
  late TabController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TabController(vsync: this, length: 4, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    String? drop;
    List<String> subject = [
      "History",
      "Geography",
      "Politics",
      "Current Affairs",
      "General Science",
      "Economy",
      "Environment",
    ];
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: h / 2.6,
                  width: w,
                  color: Colors.blue,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 80,
                        ),
                        Text(
                          "History",
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Container(
                          width: 180,
                          child: DropdownButtonFormField(
                            decoration: InputDecoration(
                              // focusedBorder: OutlineInputBorder(
                              //   //<-- SEE HERE
                              //   borderSide: BorderSide(color: Colors.black, width: 2),
                              // ),
                              filled: true,
                              fillColor: Colors.indigo,
                            ),
                            items: subject.map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                drop = newValue!;
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        DefaultTabController(
                          length: 4,
                          child: Column(
                            children: [
                              TabBar(
                                indicatorColor: Colors.amber,
                                isScrollable: true,
                                controller: _controller,
                                tabs: [
                                  Tab(
                                    text: "Ancient History",
                                  ),
                                  Tab(
                                    text: "History",
                                  ),
                                  Tab(
                                    text: "Geo",
                                  ),
                                  Tab(
                                    text: "Geo",
                                  ),
                                ],
                              ),
                              TabBarView(
                                children: [
                                  Container(
                                    height: 800,
                                    child: ListView.builder(
                                      itemBuilder: (BuildContext context, int index) {
                                        return new Card(
                                          child: Padding(
                                            padding: const EdgeInsets.all(20.0),
                                            child: Text(
                                              "test",
                                              style: TextStyle(fontSize: 22.0),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  Center(child: Text("2"),),
                                  Center(child: Text("3"),),
                                  Center(child: Text("4"),),
                                ],
                              )
                            ],
                          ),
                        )
                        //TextBox.fromLTRBD(left, top, right, bottom, direction)
                      ],
                    ),
                  ),
                ),
              ],
            ),),
  );
  }
}