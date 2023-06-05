import 'package:adaptive_layout/src/app_neon/app_interface.dart';
import 'package:adaptive_layout/src/app_neon/app_route.dart';
import 'package:adaptive_layout/src/app_neon/destination.dart';
import 'package:adaptive_layout/src/app_neon/widgets/tabbar_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:go_router/go_router.dart';

part 'news.g.dart';
part 'routes.dart';

class NewsAppView extends StatelessWidget {
  const NewsAppView({
    this.articleID,
    super.key,
  });

  final int? articleID;

  Widget secondaryBodyNuilder(BuildContext context) {
    return NewsSecondaryView(id: articleID!);
  }

  @override
  Widget build(BuildContext context) {
    final topNavigation = NeonTabBar.of(context).tabBarLayout;

    final listView = ListView.builder(
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            leading: const Icon(Icons.article_outlined),
            title: const Text('item'),
            trailing: Text(index.toString()),
            onTap: () => NewsAppRoute(index).go(context),
          ),
        );
      },
    );

    return AdaptiveLayout(
      internalAnimations: false,
      topNavigation: topNavigation,
      body: SlotLayout(
        config: <Breakpoint, SlotLayoutConfig?>{
          Breakpoints.standard: SlotLayout.from(
            key: const Key('body'),
            builder: (context) {
              final drawerButton = DrawerButton(
                onPressed: Scaffold.of(context).openDrawer,
              );

              return Scaffold(
                appBar: AppBar(
                  leading: drawerButton,
                  title: const Text('News'),
                ),
                body: listView,
              );
            },
          ),
          if (articleID != null) ...{
            Breakpoints.small: SlotLayout.from(
              key: const Key('body'),
              builder: (context) {
                return NewsSecondaryView(
                  id: articleID!,
                  isPage: true,
                );
              },
            )
          },
          Breakpoints.large: SlotLayout.from(
            key: const Key('body'),
            builder: (_) => Scaffold(
              body: listView,
            ),
          ),
        },
      ),
      secondaryBody: SlotLayout(
        config: <Breakpoint, SlotLayoutConfig?>{
          Breakpoints.mediumAndUp: SlotLayout.from(
            key: const Key('secondaryBody'),
            builder: articleID != null
                ? secondaryBodyNuilder
                : AdaptiveScaffold.emptyBuilder,
          ),
        },
      ),
    );
  }
}

class NewsSecondaryView extends StatelessWidget {
  const NewsSecondaryView({
    required this.id,
    this.isPage = false,
    super.key,
  });

  final int id;
  final bool isPage;

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      leading: BackButton(
        onPressed: () => const NewsAppRoute().go(context),
      ),
      title: const Text('NewsItem'),
    );

    return Scaffold(
      appBar: isPage ? appBar : null,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const FlutterLogo(size: 100),
            const SizedBox(height: 30),
            Text(
              id.toString(),
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ],
        ),
      ),
    );
  }
}

final newsApp = App(
  route: $newsAppRoute,
  destination: const NeonNavigationDestination(
    icon: Icon(Icons.notes_outlined),
    selectedIcon: Icon(Icons.notes),
    label: 'News',
    notificationCount: 100,
  ),
);
