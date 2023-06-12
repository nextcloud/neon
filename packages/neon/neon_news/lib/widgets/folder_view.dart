part of '../neon_news.dart';

class NewsFolderView extends StatefulWidget {
  const NewsFolderView({
    required this.folder,
    super.key,
  });

  final NextcloudNewsFolder folder;

  @override
  State<NewsFolderView> createState() => _NewsFolderViewState();
}

class _NewsFolderViewState extends State<NewsFolderView> {
  late NewsBloc bloc;
  late final option = bloc.options.defaultFolderViewTypeOption;
  late DefaultFolderViewType _viewType = option.value;

  @override
  void initState() {
    bloc = Provider.of<NewsBloc>(context, listen: false);

    super.initState();
  }

  @override
  Widget build(final BuildContext context) => Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: DropdownButton<DefaultFolderViewType>(
              isExpanded: true,
              value: _viewType,
              items: option.values.value.keys
                  .map(
                    (final key) => DropdownMenuItem<DefaultFolderViewType>(
                      value: key,
                      child: Text(option.values.value[key]!(context)),
                    ),
                  )
                  .toList(),
              onChanged: (final value) {
                setState(() {
                  _viewType = value!;
                });
              },
            ),
          ),
          Expanded(
            child: _viewType == DefaultFolderViewType.articles
                ? NewsArticlesView(
                    bloc: NewsArticlesBloc(
                      bloc,
                      bloc.options,
                      bloc.requestManager,
                      bloc.client,
                      id: widget.folder.id,
                      listType: ListType.folder,
                    ),
                  )
                : NewsFeedsView(
                    folderID: widget.folder.id,
                  ),
          ),
        ],
      );
}
