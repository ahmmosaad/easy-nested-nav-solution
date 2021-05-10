import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeRootPage extends StatefulWidget {
  @override
  _HomeRootPageState createState() => _HomeRootPageState();
}

class _HomeRootPageState extends State<HomeRootPage> {
  int navindex = 0;
  @override
  Widget build(BuildContext context) {
    var generalProv = Provider.of<GeneralProvider>(context);
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          if (generalProv.muCurrentIndex == 0) {
            return true;
          } else if (generalProv.muCurrentIndex == 1) {
            navindex = 0;
            generalProv.managePages(0);
            return false;
          } else if (generalProv.muCurrentIndex == 2) {
            generalProv.managePages(0);
            return false;
          } else if (generalProv.muCurrentIndex == 3) {
            generalProv.managePages(2);
            return false;
          } else if (generalProv.muCurrentIndex == 4) {
            generalProv.managePages(3);
            return false;
          } else {
            return false;
          }
        },
        child: SafeArea(
          child: PageView(
            controller: generalProv.myPageController,
            children: [
              PageHome(),
              Profile(),
              PageOne(),
              PageTwo(),
              Pagethree(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (choosedIndex) {
          setState(() {
            navindex = choosedIndex;
          });
          generalProv.managePages(choosedIndex);
        },
        currentIndex: navindex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'profile'),
        ],
      ),
    );
  }
}

class PageHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: MaterialButton(
            onPressed: () {
              Provider.of<GeneralProvider>(context, listen: false)
                  .managePages(2);
            },
            child: Text('move to page one'),
          ),
        ),
      ),
    );
  }
}

class PageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: MaterialButton(
            onPressed: () {
              Provider.of<GeneralProvider>(context, listen: false)
                  .managePages(3);
            },
            child: Text('move to page two'),
          ),
        ),
      ),
    );
  }
}

class PageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: MaterialButton(
            onPressed: () {
              Provider.of<GeneralProvider>(context, listen: false)
                  .managePages(4);
            },
            child: Text('move to page three'),
          ),
        ),
      ),
    );
  }
}

class Pagethree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: MaterialButton(
            onPressed: () {},
            child: Text('this is page 3'),
          ),
        ),
      ),
    );
  }
}

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: MaterialButton(
            onPressed: () {},
            child: Text('this is profile'),
          ),
        ),
      ),
    );
  }
}

class GeneralProvider extends ChangeNotifier {
  int muCurrentIndex = 0;
  PageController myPageController = PageController();
  managePages(int index) {
    muCurrentIndex = index;
    myPageController.jumpToPage(index);
    notifyListeners();
  }
}
