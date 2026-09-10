import 'package:flutter/material.dart';
import 'package:sample_project2/components/list_view.dart';

///TabBar-1
class ExampleTabBar extends StatelessWidget {
  const ExampleTabBar({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Default Tabbar"),
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.cake),),
                Tab(icon: Icon(Icons.playlist_add_circle_outlined),),
                Tab(icon: Icon(Icons.surround_sound),)
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Center(child: Text("One"),),
              Center(child: Text("Two"),),
              Center(child: Text("Three"),),
            ],
          ),
        ),
    );
  }
}


///TabBar-2
class ExampleTabBar2 extends StatefulWidget {
  const ExampleTabBar2({super.key});
  @override
  State<ExampleTabBar2> createState() => _ExampleTabBar2State();
}
class _ExampleTabBar2State extends State<ExampleTabBar2>with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    print("initialaised tab controller");

  }
  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
    print("Dispose tab controller");
  }

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text("Tab using TabController"),
      bottom: TabBar(
        controller: _tabController,
        tabs: [
          Tab(icon: Icon(Icons.backup_outlined),),
          Tab(icon: Icon(Icons.dark_mode_outlined),),
          Tab(icon: Icon(Icons.savings_outlined),),
        ],
      ),
    ),
    body: TabBarView(
      controller: _tabController,
        children: [
          Center(child: Text("String 1"),),
          Center(child: Text("String 2 "),),
          Center(child: Text("String 3"),),
        ]),
  );
  }
}


///TabBar-3 (Nested TabBar)
class ExampleTabBar3 extends StatelessWidget {
  const ExampleTabBar3({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Nested Tab-Bar"),
          bottom: TabBar(
              tabs: [
                const Tab(child: Text("Local Shipping"),icon: Icon(Icons.local_shipping),),
                const Tab(child: Text("Sefety Check"),icon: Icon(Icons.safety_check_outlined),),
                const Tab(child: Text("Factory Area"),icon: Icon(Icons.factory_outlined),)
              ]),
        ),
        body: TabBarView(
            children:[
              ExampleTabBar(),
              Center(child: Text("Safety for App"),),
              NestedTabBar()
            ]
        ),
      ),
    );
  }
}
class NestedTabBar extends StatefulWidget {
  const NestedTabBar({super.key});
  @override
  State<NestedTabBar> createState() => _NestedTabBarState();
}
class _NestedTabBarState extends State<NestedTabBar> with TickerProviderStateMixin {
  late final TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }
  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        bottom: TabBar(
          controller: _tabController,
            tabs: [
          Tab(icon: Icon(Icons.flight),),
          Tab(icon: Icon(Icons.train_sharp),),
          Tab(icon: Icon(Icons.emoji_transportation),),
        ]),
      ),
      body: TabBarView(
          controller: _tabController,
          children: [
        const Center(child: Text("Flight services"),),
        const Center(child: Text("Train time"),),
        const Center(child: Text("Car Drive"),),
      ]),
    );
  }
}


///TabBar-4 (Scroll Tab-Bar)
class ExampleTabBar4 extends StatefulWidget {
  const ExampleTabBar4({super.key});
  @override
  State<ExampleTabBar4> createState() => _ExampleTabBar4State();
}
class _ExampleTabBar4State extends State<ExampleTabBar4> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 20,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Scroll Tab-Bar"),
            bottom: TabBar(
                isScrollable: true,
                tabs: List<Widget>.generate(20, (int index)=>Tab(text: 'Tab $index',))),
          ),
        ),);
  }
}



///TabBar-5 (Custom Behaviour Scroll Tab-Bar)
class ExampleTabBar5 extends StatefulWidget {
  const ExampleTabBar5({super.key});
  @override
  State<ExampleTabBar5> createState() => _ExampleTabBar5State();
}
class _ExampleTabBar5State extends State<ExampleTabBar5> {
  double scrollOffset = 0;
  double maxScrollExtent = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 20,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TabBar with scroll notifications'),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(56.0),
            child: NotificationListener<Notification>(
              onNotification: (Notification notification) {
                // ScrollMetricsNotification is for initial layout.
                // ScrollNotification is for real-time scroll updates.
                final ScrollMetrics? metrics = switch (notification) {
                  ScrollMetricsNotification(:final metrics) => metrics,
                  ScrollNotification(:final metrics) => metrics,
                  _ => null,
                };
                if (metrics != null) {
                  setState(() {
                    scrollOffset = metrics.pixels;
                    maxScrollExtent = metrics.maxScrollExtent;
                  });
                }
                return false;
              },
              child: Stack(
                children: [
                  TabBar(
                    isScrollable: true,
                    tabs: List<Widget>.generate(
                      20,
                          (int index) => Tab(text: 'Tab $index'),
                    ),
                  ),
                  // When the selected tab is not at the beginning or end
                  // (indicating TabBar is scrollable), add a gradient mask
                  // to left or right.
                  Positioned(
                    top: 0,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: GradientMasks(
                      scrollOffset: scrollOffset,
                      maxScrollExtent: maxScrollExtent,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
class GradientMasks extends StatelessWidget {
  final double scrollOffset;
  final double maxScrollExtent;

  const GradientMasks({
    super.key,
    required this.scrollOffset,
    required this.maxScrollExtent,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (scrollOffset > 0) const LeftMask(),
        const Spacer(),
        if (scrollOffset < maxScrollExtent) const RightMask(),
      ],
    );
  }
}
/// This mask shows when the selected tab is not at the beginning.
class LeftMask extends StatelessWidget {
  const LeftMask({super.key});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: ClipRect(
        child: BackdropFilter(
          filter: ColorFilter.mode(
            Colors.black.withValues(alpha: 0.2),
            BlendMode.srcOver,
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Colors.white.withValues(alpha: 0.8),
                  Colors.white.withValues(alpha: 0.2),
                ],
              ),
            ),
            child: Align(
              alignment: .centerLeft,
              child: Padding(
                  padding: .only(left: 4),
              child: Icon(
                Icons.chevron_left,
                color: Colors.black.withValues(alpha: 0.4),
              ),
            ),
          ),
        ),
      ),
    ),
    );
  }
}
/// This mask shows when the selected tab is not at the end.
class RightMask extends StatelessWidget {
  const RightMask({super.key});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: ClipRect(
        child: BackdropFilter(
          filter: ColorFilter.mode(
            Colors.black.withValues(alpha: 0.2),
            BlendMode.srcOver,
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                colors: [
                  Colors.white.withValues(alpha: 0.8),
                  Colors.white.withValues(alpha: 0.2),
                ],
              ),
            ),
            child: Align(
              alignment: .centerRight,
              child: Padding(
                  padding: .only(right: 4),
              child: Icon(
                Icons.chevron_right,
                color: Colors.black.withValues(alpha: 0.4),
              ),
            ),
          ),
        ),
      ),
    ),
    );
  }
}




