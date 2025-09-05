import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MainAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          // 앱 테마의 색 구성표를 변경합니다.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: const HomePage(),
      ),
    );
  }
}

// 앱이 동작하는 데 필요한 데이터를 정의합니다.
class MainAppState extends ChangeNotifier {
  var current = WordPair.random();
  var history = <WordPair>[];
  GlobalKey? historyListKey;

  void getNext() {
    history.insert(0, current);
    var animatedList = historyListKey?.currentState as AnimatedListState?;
    // 해당 인덱스에 새로운 아이템을 추가했다고 알려 애니메이션을 구동합니다.
    animatedList?.insertItem(0);
    current = WordPair.random();
    // MyAppState를 추적하는 위젯에게 알림을 보냅니다.
    notifyListeners();
  }

  var favorites = <WordPair>[];

  void toggleFavorite([WordPair? pair]) {
    pair = pair ?? current;

    if (favorites.contains(pair)) {
      favorites.remove(pair);
    } else {
      favorites.add(pair);
    }
    notifyListeners();
  }

  void deleteFavorite(WordPair pair) {
    favorites.remove(pair);
    notifyListeners();
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

// HomePage 위젯 전용 상태를 관리할 수 있습니다.
class _HomePageState extends State<HomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = const GeneratorPage();
        break;
      case 1:
        // Placeholder는 교차 사각형을 그려 미완성 UI임을 표시하는 위젯입니다.
        // page = Placeholder();
        page = const FavoritesPage();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return LayoutBuilder(
        // constraints가 변경될 때 마다 콜백 함수를 호출합니다.
        // 사용자가 앱의 창 크기를 조절할 때,
        // 사용자가 휴대 전화를 세로 모드에서 가로 모드로 회전할 때,
        // 다른 위젯에 의해 HomePage 위젯의 크기가 조절될 때,
        // constraints가 변경됩니다.
        builder: (context, constraints) {
      return Scaffold(
        body: Row(
          children: [
            SafeArea(
              child: NavigationRail(
                // HomePage 위젯의 가로가 600 픽셀 이상일 때 true로 설정합니다.
                extended: constraints.maxWidth >= 600,
                destinations: const [
                  NavigationRailDestination(
                    icon: Icon(Icons.home),
                    label: Text('Home'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.favorite),
                    label: Text('Favorites'),
                  ),
                ],
                selectedIndex: selectedIndex,
                onDestinationSelected: (value) {
                  setState(() {
                    selectedIndex = value;
                  });
                },
              ),
            ),
            // NavigationRail 위젯이 차지하고 남은 공간을 모두 차지합니다.
            Expanded(
              child: Container(
                color: Theme.of(context).colorScheme.primaryContainer,
                child: page,
              ),
            ),
          ],
        ),
      );
    });
  }
}

class GeneratorPage extends StatelessWidget {
  const GeneratorPage({super.key});

  @override
  Widget build(BuildContext context) {
    // GeneratorPage 위젯은 watch 메서드를 사용하여 상태의 변경 사항을 추적합니다.
    var appState = context.watch<MainAppState>();
    var pair = appState.current;

    IconData icon;
    if (appState.favorites.contains(pair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          const Expanded(
            flex: 3,
            child: HistoryViewList(),
          ),
          const SizedBox(
            height: 10,
          ),
          BigCard(pair: pair),
          const SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  appState.toggleFavorite();
                },
                label: const Text('Like'),
                icon: Icon(icon),
              ),
              const SizedBox(
                width: 10.0,
              ),
              ElevatedButton(
                onPressed: () {
                  appState.getNext();
                },
                child: const Text('Next'),
              ),
            ],
          ),
          const Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }
}

class HistoryViewList extends StatefulWidget {
  const HistoryViewList({
    super.key,
  });

  @override
  State<HistoryViewList> createState() => _HistoryViewListState();
}

class _HistoryViewListState extends State<HistoryViewList> {
  final _key = GlobalKey();
  static const Gradient _maskingGradient = LinearGradient(
    colors: [Colors.transparent, Colors.black],
    stops: [0.0, 0.5],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MainAppState>();
    var history = appState.history;
    appState.historyListKey = _key;

    return ShaderMask(
      shaderCallback: (bounds) => _maskingGradient.createShader(bounds),
      blendMode: BlendMode.dstIn,
      child: AnimatedList(
        key: _key,
        reverse: true,
        initialItemCount: history.length,
        itemBuilder: (context, index, animation) {
          final pair = history[index];
          return SizeTransition(
            sizeFactor: animation,
            child: Center(
              child: TextButton.icon(
                onPressed: () {
                  appState.toggleFavorite(pair);
                },
                icon: appState.favorites.contains(pair)
                    ? const Icon(Icons.favorite)
                    : const SizedBox(),
                label: Text(
                  pair.asLowerCase,
                  semanticsLabel: '${pair.first} ${pair.second}',
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.pair,
  });

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // 앱 테마, 글꼴 테마, 중간 크기의 디스플레이 스타일에 접근합니다.
    // 디스플레이란 짧고 중요한 텍스트입니다.
    // 그밖에 body(본문), caption(이미지 설명용 주석), headline(제목) 멤버가 있습니다.
    // onPrimary는 색 구성표의 기본 색상입니다.
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );

    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          pair.asLowerCase,
          style: style,
          // 접근성을 개선하기 위해 스크린 리더가 복합어 대신 개별 단어를 식별할 수 있도록 합니다.
          semanticsLabel: '${pair.first} ${pair.second}',
        ),
      ),
    );
  }
}

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MainAppState>();
    var favorites = appState.favorites;

    if (favorites.isEmpty) {
      return const Center(
        child: Text('No favorites yet!'),
      );
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text('You have ${favorites.length} favorites:'),
        ),
        Expanded(
          child: GridView(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 400,
              childAspectRatio: 400 / 80,
            ),
            children: [
              for (var pair in favorites)
                ListTile(
                  leading: IconButton(
                    onPressed: () {
                      appState.deleteFavorite(pair);
                    },
                    icon: const Icon(Icons.delete_outline),
                  ),
                  title: Text(pair.asLowerCase),
                )
            ],
          ),
        ),
      ],
    );
  }
}
