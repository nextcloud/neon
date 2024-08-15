import 'package:flutter/material.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/utils.dart';
import 'package:news_app/src/blocs/articles.dart';
import 'package:news_app/src/blocs/news.dart';
import 'package:news_app/src/options.dart';
import 'package:news_app/src/widgets/articles_view.dart';
import 'package:news_app/src/widgets/feeds_view.dart';
import 'package:nextcloud/news.dart' as news;

class NewsFolderView extends StatefulWidget {
  const NewsFolderView({
    required this.bloc,
    required this.folder,
    super.key,
  });

  final NewsBloc bloc;
  final news.Folder folder;

  @override
  State<NewsFolderView> createState() => _NewsFolderViewState();
}

class _NewsFolderViewState extends State<NewsFolderView> {
  late final NewsOptions options;
  late DefaultFolderViewType viewType;

  @override
  void initState() {
    super.initState();

    options = NeonProvider.of<NewsOptions>(context);
    viewType = options.defaultFolderViewTypeOption.value;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child: DropdownButton(
            isExpanded: true,
            value: viewType,
            items: options.defaultFolderViewTypeOption.values.keys
                .map(
                  (key) => DropdownMenuItem(
                    value: key,
                    child: Text(options.defaultFolderViewTypeOption.values[key]!(context)),
                  ),
                )
                .toList(),
            onChanged: (value) {
              setState(() {
                viewType = value!;
              });
            },
          ),
        ),
        Expanded(
          child: viewType == DefaultFolderViewType.articles
              ? NewsArticlesView(
                  bloc: NewsArticlesBloc(
                    newsBloc: widget.bloc,
                    options: options,
                    account: NeonProvider.of<Account>(context),
                    id: widget.folder.id,
                    listType: ListType.folder,
                  ),
                  newsBloc: widget.bloc,
                )
              : NewsFeedsView(
                  bloc: widget.bloc,
                  folderID: widget.folder.id,
                ),
        ),
      ],
    );
  }
}
