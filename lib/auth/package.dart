import 'package:flutter/material.dart';

import 'package:digisign/auth/packages/bronze.dart' as bronze;
import 'package:digisign/auth/packages/silver.dart' as silver;
import 'package:digisign/auth/packages/gold.dart' as gold;

class Package extends StatefulWidget {
  @override
  _PackageState createState() => _PackageState();
}

class _PackageState extends State<Package> with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    controller = TabController(vsync: this, length: 3);
    controller.addListener(_handleTabSelection);
    super.initState();
  }

  void _handleTabSelection() {
    setState(() {});
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(140),
        child: AppBar(
          backgroundColor: Color.fromRGBO(15, 213, 152, 1),
          centerTitle: true,
          elevation: 1,
          title: Text(
            'Package',
          ),
          bottom: TabBar(
            indicator: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              color: Colors.white,
            ),
            controller: controller,
            indicatorColor: Colors.white,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.white,
            tabs: <Widget>[
              Tab(
                icon: Container(
                  child: Image(
                    image: AssetImage(
                      'assets/images/Bronze_Medal.png',
                    ),
                    width: 28,
                    height: 28,
                  ),
                ),
                child: Text(
                  'Bronze',
                  style: TextStyle(
                    color: controller.index == 0 ? Colors.black : Colors.white,
                  ),
                ),
              ),
              Tab(
                icon: Container(
                  child: Image(
                    image: AssetImage(
                      'assets/images/Silver_Medal.png',
                    ),
                    width: 28,
                    height: 28,
                  ),
                ),
                child: Text(
                  'Silver',
                  style: TextStyle(
                    color: controller.index == 1 ? Colors.black : Colors.white,
                  ),
                ),
              ),
              Tab(
                icon: Container(
                  child: Image(
                    image: AssetImage(
                      'assets/images/Gold_Medal.png',
                    ),
                    width: 28,
                    height: 28,
                  ),
                ),
                child: Text(
                  'Gold',
                  style: TextStyle(
                    color: controller.index == 2 ? Colors.black : Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: <Widget>[
          new bronze.Bronze(),
          new silver.Silver(),
          new gold.Gold(),
        ],
      ),
    );
  }
}
