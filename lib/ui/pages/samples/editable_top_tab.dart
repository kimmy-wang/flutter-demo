import 'package:flutter/material.dart';

import 'package:md2_tab_indicator/md2_tab_indicator.dart';

import 'package:flutter_demo/ui/widgets/app_bar.dart';

class EditableTopTab extends StatefulWidget {
  final String headerTitle;

  const EditableTopTab({Key key, this.headerTitle}) : super(key: key);

  @override
  _EditableTopTabState createState() => _EditableTopTabState();
}

class _EditableTopTabState extends State<EditableTopTab>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          FAppBar(
            title: widget.headerTitle,
            bottom: Container(
              height: 48,
              child: TabBar(
                controller: _tabController,
                labelStyle: TextStyle(fontWeight: FontWeight.w700),
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: Colors.orangeAccent,
                unselectedLabelColor: Colors.white,
                isScrollable: true,
                indicator: MD2Indicator(
                  indicatorHeight: 3,
                  indicatorColor: Colors.orangeAccent,
                  indicatorSize: MD2IndicatorSize.full,
                ),
                tabs: <Widget>[
                  Tab(
                    text: "Home",
                  ),
                  Tab(
                    text: "Personal",
                  ),
                  Tab(
                    text: "personalization",
                  ),
                  Tab(
                    text: "Security",
                  ),
                  Tab(
                    text: "Beauty",
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                Container(
                  child: Text("TopTab1"),
                ),
                Container(
                  child: Text("TopTab2"),
                ),
                Container(
                  child: Text("TopTab3"),
                ),
                Container(
                  child: Text("TopTab4"),
                ),
                Container(
                  child: Text("TopTab5"),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
