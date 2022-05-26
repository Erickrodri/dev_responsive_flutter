import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Home'),
      // ),
      body: Stack(
        children: [
          ResponsiveVisibility(
            hiddenWhen: const [
              Condition.largerThan(name: TABLET),
            ],
            child: CustomScrollView(
              slivers: [
                _buildSliverAppBar(),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Container(
                        child: ResponsiveRowColumn(
                          rowMainAxisAlignment: MainAxisAlignment.center,
                          layout: ResponsiveWrapper.of(context)
                                  .isSmallerThan(TABLET)
                              ? ResponsiveRowColumnType.COLUMN
                              : ResponsiveRowColumnType.ROW,
                          children: [
                            ResponsiveRowColumnItem(
                              rowFlex: 1,
                              child: _buildInputText(),
                            ),
                            ResponsiveRowColumnItem(
                              rowFlex: 1,
                              child: _buildInputText(),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          ResponsiveVisibility(
              visible: false,
              visibleWhen: const [
                Condition.largerThan(name: TABLET),
              ],
              child: Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(45),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(30),
                          child: Text(
                            'Image',
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Container(
                      height: sizeHeight * 0.7,
                      width: double.infinity,
                      child: Row(children: [
                        const Spacer(),
                        Container(
                          width: 350,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(255, 111, 116, 143),
                                offset: const Offset(
                                  5.0,
                                  5.0,
                                ),
                                blurRadius: 10.0,
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                          child: Padding(
                              padding: EdgeInsets.all(15),
                              child: Column(
                                children: [
                                  _buildInputText(),
                                  _buildInputText(),
                                ],
                              )),
                        ),
                        const Spacer(),
                      ]),
                    ),
                  )
                ],
              )),
        ],
      ),
    );
  }

  Padding _buildInputText() {
    return Padding(
      padding: EdgeInsets.all(15),
      child: TextFormField(
        autocorrect: true,
        autofocus: false,
        cursorColor: Colors.deepPurple,
        decoration: InputDecoration(
          hintText: 'form',
          label: const Text('form'),
          labelStyle: TextStyle(color: Colors.deepPurple),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: Colors.deepOrange,
            ),
          ),
        ),
      ),
    );
  }

  SliverAppBar _buildSliverAppBar() {
    return SliverAppBar(
      pinned: true,
      floating: false,
      expandedHeight: 200,
      flexibleSpace: Container(
        color: Colors.deepPurple,
        child: const FlexibleSpaceBar(
          title: Text(
            'Title',
            textAlign: TextAlign.left,
          ),
        ),
      ),
    );
  }
}
