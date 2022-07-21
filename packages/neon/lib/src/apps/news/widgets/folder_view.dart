part of '../app.dart';

class NewsFolderView extends StatefulWidget {
  const NewsFolderView({
    required this.bloc,
    required this.folder,
    super.key,
  });

  final NewsBloc bloc;
  final NewsFolder folder;

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
                      widget.bloc,
                      isMainArticlesBloc: false,
                      id: widget.folder.id,
                      listType: ListType.folder,
                    ),
                  )
                : NewsFeedsView(
                    bloc: widget.bloc,
                    folderID: widget.folder.id,
                  ),
          ),
        ],
      );
}
