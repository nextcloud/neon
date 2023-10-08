part of '../neon_news.dart';

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
  late final option = widget.bloc.options.defaultFolderViewTypeOption;
  late DefaultFolderViewType _viewType = option.value;

  @override
  Widget build(final BuildContext context) => Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: DropdownButton<DefaultFolderViewType>(
              isExpanded: true,
              value: _viewType,
              items: option.values.keys
                  .map(
                    (final key) => DropdownMenuItem<DefaultFolderViewType>(
                      value: key,
                      child: Text(option.values[key]!(context)),
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
                      widget.bloc,
                      widget.bloc.options,
                      widget.bloc.account,
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
