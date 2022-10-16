import 'package:evena/budget.dart';
import 'package:evena/guest.dart';
import 'package:evena/tasks.dart';
import 'package:evena/vendors.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final String budget;
  final String surname;
  final String partnerName;
  final DateTime dateTime;
  const Home({
    Key? key,
    required this.budget,
    required this.surname,
    required this.partnerName,
    required this.dateTime,
  }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentTabIndex = 0;
  @override
  Widget build(BuildContext context) {
    final _kTabPages = [
      SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2.75,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/bg.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Container(
                  height: MediaQuery.of(context).size.height / 3,
                  width: MediaQuery.of(context).size.width / 1.5,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/7.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 10),
                      Text(
                        "${widget.surname} & ${widget.partnerName}",
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        "Congratulations!",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 19),
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        "We will get married!",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        widget.dateTime.toString().substring(0, 10),
                        style:
                            const TextStyle(color: Colors.white, fontSize: 11),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 5.5,
              width: double.infinity,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(right: 20),
                child: Row(
                  children: [
                    const SizedBox(width: 20),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Tasks(),
                            ),
                          ),
                          child: Image.asset(
                            'assets/3.png',
                            height: MediaQuery.of(context).size.height / 10,
                            width: 50,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          'Tasks',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    const SizedBox(width: 40),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Budget(),
                            ),
                          ),
                          child: Image.asset(
                            'assets/4.png',
                            height: MediaQuery.of(context).size.height / 10,
                            width: 70,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          'Budget',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    const SizedBox(width: 40),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Guest(
                                  name: widget.surname,
                                  partnerName: widget.partnerName),
                            ),
                          ),
                          child: Image.asset(
                            'assets/5.png',
                            height: MediaQuery.of(context).size.height / 10,
                            width: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          'Guests',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    const SizedBox(width: 40),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Vendors(),
                            ),
                          ),
                          child: Image.asset(
                            'assets/6.png',
                            height: MediaQuery.of(context).size.height / 10,
                            width: 65,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          'Vendors',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Divider(color: Colors.grey, height: 0),
            SizedBox(
              height: MediaQuery.of(context).size.height / 4.5,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'TASKS',
                    style: TextStyle(fontSize: 18),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height / 5.5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Tasks(),
                                  ),
                                ),
                                child: Image.asset(
                                  'assets/3.png',
                                  height:
                                      MediaQuery.of(context).size.height / 10,
                                  width: 50,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(height: 3),
                              const Text(
                                '16',
                                style: TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 3),
                              const Text(
                                'All tasks',
                                style:
                                    TextStyle(fontSize: 15, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 25),
                      Expanded(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height / 5.5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Tasks(),
                                  ),
                                ),
                                child: Image.asset(
                                  'assets/3.png',
                                  height:
                                      MediaQuery.of(context).size.height / 10,
                                  width: 50,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(height: 3),
                              const Text(
                                '0',
                                style: TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 3),
                              const Text(
                                'Incomplete tasks',
                                style:
                                    TextStyle(fontSize: 15, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(color: Colors.grey, height: 0),
            SizedBox(
              height: MediaQuery.of(context).size.height / 4.5,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'BUDGET',
                    style: TextStyle(fontSize: 18),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height / 5.5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Budget(),
                                  ),
                                ),
                                child: Image.asset(
                                  'assets/4.png',
                                  height:
                                      MediaQuery.of(context).size.height / 10,
                                  width: 50,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(height: 3),
                              Text(
                                '${widget.budget} CFA',
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 3),
                              const Text(
                                'total',
                                style:
                                    TextStyle(fontSize: 15, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 25),
                      Expanded(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height / 5.5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Budget(),
                                  ),
                                ),
                                child: Image.asset(
                                  'assets/3.png',
                                  height:
                                      MediaQuery.of(context).size.height / 10,
                                  width: 50,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(height: 3),
                              const Text(
                                '0%',
                                style: TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 3),
                              const Text(
                                'used',
                                style:
                                    TextStyle(fontSize: 15, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(color: Colors.grey, height: 0),
            SizedBox(
              height: MediaQuery.of(context).size.height / 4.5,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'GUESTS',
                    style: TextStyle(fontSize: 18),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height / 5.5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Guest(
                                        name: widget.surname,
                                        partnerName: widget.partnerName),
                                  ),
                                ),
                                child: Image.asset(
                                  'assets/5.png',
                                  height:
                                      MediaQuery.of(context).size.height / 10,
                                  width: 65,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(height: 3),
                              const Text(
                                '7',
                                style: TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 3),
                              const Text(
                                'All guests',
                                style:
                                    TextStyle(fontSize: 15, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 25),
                      Expanded(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height / 5.5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Guest(
                                        name: widget.surname,
                                        partnerName: widget.partnerName),
                                  ),
                                ),
                                child: Image.asset(
                                  'assets/5.png',
                                  height:
                                      MediaQuery.of(context).size.height / 10,
                                  width: 50,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(height: 3),
                              const Text(
                                '3',
                                style: TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 3),
                              const Text(
                                'All events',
                                style:
                                    TextStyle(fontSize: 15, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(color: Colors.grey, height: 0),
          ],
        ),
      ),
      const Tasks(),
      const Budget(),
      Guest(name: widget.surname, partnerName: widget.partnerName),
      const Vendors(),
      const Center(
        child: Icon(Icons.forum, size: 64, color: Colors.teal),
      ),
    ];
    final _kBottomNavBarItems = <BottomNavigationBarItem>[
      const BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: '',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.playlist_add_check),
        label: '',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.wallet_giftcard),
        label: '',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.group),
        label: '',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.work),
        label: '',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.menu),
        label: '',
      ),
    ];
    assert(_kTabPages.length == _kBottomNavBarItems.length);
    final bottomNavBar = BottomNavigationBar(
      items: _kBottomNavBarItems,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      iconSize: 26,
      currentIndex: _currentTabIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        setState(() {
          _currentTabIndex = index;
        });
      },
    );
    return Scaffold(
      appBar: _currentTabIndex != 0
          ? null
          : AppBar(
              elevation: 0,
              centerTitle: true,
              automaticallyImplyLeading: false,
              backgroundColor: Colors.transparent,
              leading: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.settings),
                color: Colors.black87,
              ),
              title: const Text(
                'Home',
                style: TextStyle(color: Colors.black54),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.message),
                  color: Colors.black87,
                ),
              ],
            ),
      body: _kTabPages[_currentTabIndex],
      bottomNavigationBar: bottomNavBar,
    );
  }
}
