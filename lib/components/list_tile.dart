import 'package:flutter/material.dart';


///List-tile0
class ListTileExample extends StatefulWidget {
  const ListTileExample({super.key});

  @override
  State<ListTileExample> createState() => _ListTileExampleState();
}

class _ListTileExampleState extends State<ListTileExample>
    with TickerProviderStateMixin {
  late final AnimationController _fadeController;
  late final AnimationController _sizeController;
  late final Animation<double> _fadeAnimation;
  late final Animation<double> _sizeAnimation;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);

    _sizeController = AnimationController(
      duration: const Duration(milliseconds: 850),
      vsync: this,
    )..repeat(reverse: true);

    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    );

    _sizeAnimation = CurvedAnimation(
      parent: _sizeController,
      curve: Curves.easeOut,
    );
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _sizeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ListTile Samples')),
      body: Column(
        mainAxisAlignment: .spaceEvenly,
        children: <Widget>[
          Hero(
            tag: 'ListTile-Hero',
            // Wrap the ListTile in a Material widget so the ListTile has someplace
            // to draw the animated colors during the hero transition.
            child: Material(
              child: ListTile(
                title: const Text('ListTile with Hero'),
                subtitle: const Text('Tap here for Hero transition'),
                tileColor: Colors.cyan,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<Widget>(
                      builder: (BuildContext context) {
                        return Scaffold(
                          appBar: AppBar(title: const Text('ListTile Hero')),
                          body: Center(
                            child: Hero(
                              tag: 'ListTile-Hero',
                              child: Material(
                                child: ListTile(
                                  title: const Text('ListTile with Hero'),
                                  subtitle: const Text('Tap here to go back'),
                                  tileColor: Colors.blue[700],
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ),
          FadeTransition(
            opacity: _fadeAnimation,
            // Wrap the ListTile in a Material widget so the ListTile has someplace
            // to draw the animated colors during the fade transition.
            child: const Material(
              child: ListTile(
                title: Text('ListTile with FadeTransition'),
                selectedTileColor: Colors.green,
                selectedColor: Colors.white,
                selected: true,
              ),
            ),
          ),
          SizedBox(
            height: 100,
            child: Center(
              child: SizeTransition(
                sizeFactor: _sizeAnimation,
                alignment: .topLeft,
                // Wrap the ListTile in a Material widget so the ListTile has someplace
                // to draw the animated colors during the size transition.
                child: const Material(child:Center(
                  child: ListTile(
                    title: Text('ListTile with SizeTransition'),
                    tileColor: Colors.yellow,
                    minVerticalPadding: 25.0,
                  ),
                ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}



///List-tile1
class ListTileExample1 extends StatelessWidget {
  const ListTileExample1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ListTile Sample')),
      body: ListView(
        children: const <Widget>[
          Card(child: ListTile(title: Text('One-line ListTile'))),
          Card(
            child: ListTile(
              leading: FlutterLogo(),
              title: Text('One-line with leading widget'),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('One-line with trailing widget'),
              trailing: Icon(Icons.more_vert),
            ),
          ),
          Card(
            child: ListTile(
              leading: FlutterLogo(),
              title: Text('One-line with both widgets'),
              trailing: Icon(Icons.more_vert),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('One-line dense ListTile'),
              dense: true,
            ),
          ),
          Card(
            child: ListTile(
              leading: FlutterLogo(size: 56.0),
              title: Text('Two-line ListTile'),
              subtitle: Text('Here is a second line'),
              trailing: Icon(Icons.more_vert),
            ),
          ),
          Card(
            child: ListTile(
              leading: FlutterLogo(size: 72.0),
              title: Text('Three-line ListTile'),
              subtitle: Text(
                'A sufficiently long subtitle warrants three lines.',
              ),
              trailing: Icon(Icons.more_vert),
              isThreeLine: true,
            ),
          ),
        ],
      ),
    );
  }
}


///List-tile2
class ListTileExample2 extends StatelessWidget {
  const ListTileExample2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ListTile Sample')),
      body: ListView(
        children: const <Widget>[
          ListTile(
            leading: CircleAvatar(child: Text('A')),
            title: Text('Headline'),
            subtitle: Text('Supporting text'),
            trailing: Icon(Icons.favorite_rounded),
          ),
          Divider(height: 0),
          ListTile(
            leading: CircleAvatar(child: Text('B')),
            title: Text('Headline'),
            subtitle: Text(
              'Longer supporting text to demonstrate how the text wraps and how the leading and trailing widgets are centered vertically with the text.',
            ),
            trailing: Icon(Icons.favorite_rounded),
          ),
          Divider(height: 0),
          ListTile(
            leading: CircleAvatar(child: Text('C')),
            title: Text('Headline'),
            subtitle: Text(
              "Longer supporting text to demonstrate how the text wraps and how setting 'ListTile.isThreeLine = true' aligns leading and trailing widgets to the top vertically with the text.",
            ),
            trailing: Icon(Icons.favorite_rounded),
            isThreeLine: true,
          ),
          Divider(height: 0),
        ],
      ),
    );
  }
}


///List-tile3
class ListTileExample3 extends StatefulWidget {
  const ListTileExample3({super.key});

  @override
  State<ListTileExample3> createState() => _ListTileExampleState3();
}
class _ListTileExampleState3 extends State<ListTileExample3> {
  bool _selected = false;
  bool _enabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ListTile Sample')),
      body: Center(
        child: ListTile(
          enabled: _enabled,
          selected: _selected,
          onTap: () {
            setState(() {
              // This is called when the user toggles the switch.
              _selected = !_selected;
            });
          },
          iconColor:
          const WidgetStateColor.fromMap(<WidgetStatesConstraint, Color>{
            WidgetState.disabled: Colors.red,
            WidgetState.selected: Colors.green,
            WidgetState.any: Colors.black,
          }),
          // The same can be achieved using the .resolveWith() constructor.
          // The text color will be identical to the icon color above.
          textColor: WidgetStateColor.resolveWith((Set<WidgetState> states) {
            if (states.contains(WidgetState.disabled)) {
              return Colors.red;
            }
            if (states.contains(WidgetState.selected)) {
              return Colors.green;
            }
            return Colors.black;
          }),
          leading: const Icon(Icons.person),
          title: const Text('Headline'),
          subtitle: Text('Enabled: $_enabled, Selected: $_selected'),
          trailing: Switch(
            onChanged: (bool value) {
              // This is called when the user toggles the switch.
              setState(() {
                _enabled = value;
              });
            },
            value: _enabled,
          ),
        ),
      ),
    );
  }
}


///List-tile4
class ListTileExample4 extends StatefulWidget {
  const ListTileExample4({super.key});
  @override
  State<ListTileExample4> createState() => _ListTileExampleState4();
}
class _ListTileExampleState4 extends State<ListTileExample4> {
  ListTileTitleAlignment? titleAlignment;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ListTile.titleAlignment Sample')),
      body: Column(
        children: <Widget>[
          const Divider(),
          ListTile(
            titleAlignment: titleAlignment,
            leading: Checkbox(value: true, onChanged: (bool? value) {}),
            title: const Text('Headline Text'),
            subtitle: const Text(
              'Tapping on the trailing widget will show a menu that allows you to change the title alignment. The title alignment is set to threeLine by default if `ThemeData.useMaterial3` is true. Otherwise, defaults to titleHeight.',
            ),
            trailing: PopupMenuButton<ListTileTitleAlignment>(
              onSelected: (ListTileTitleAlignment? value) {
                setState(() {
                  titleAlignment = value;
                });
              },
              itemBuilder: (BuildContext context) =>
              <PopupMenuEntry<ListTileTitleAlignment>>[
                const PopupMenuItem<ListTileTitleAlignment>(
                  value: ListTileTitleAlignment.threeLine,
                  child: Text('threeLine'),
                ),
                const PopupMenuItem<ListTileTitleAlignment>(
                  value: ListTileTitleAlignment.titleHeight,
                  child: Text('titleHeight'),
                ),
                const PopupMenuItem<ListTileTitleAlignment>(
                  value: ListTileTitleAlignment.top,
                  child: Text('top'),
                ),
                const PopupMenuItem<ListTileTitleAlignment>(
                  value: ListTileTitleAlignment.center,
                  child: Text('center'),
                ),
                const PopupMenuItem<ListTileTitleAlignment>(
                  value: ListTileTitleAlignment.bottom,
                  child: Text('bottom'),
                ),
              ],
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}