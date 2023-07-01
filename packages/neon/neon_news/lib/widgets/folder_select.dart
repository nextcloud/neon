part of '../neon_news.dart';

class NewsFolderSelect extends StatelessWidget {
  const NewsFolderSelect({
    required this.folders,
    required this.onChanged,
    this.value,
    super.key,
  });

  final List<NewsFolder> folders;
  final void Function(NewsFolder?) onChanged;
  final NewsFolder? value;

  @override
  Widget build(final BuildContext context) => DropdownButtonFormField<NewsFolder>(
        decoration: InputDecoration(
          hintText: AppLocalizations.of(context).folder,
        ),
        value: value,
        items: [
          DropdownMenuItem(
            child: Text(AppLocalizations.of(context).folderRoot),
          ),
          ...folders.map(
            (final f) => DropdownMenuItem<NewsFolder>(
              value: f,
              child: Text(f.name),
            ),
          ),
        ],
        onChanged: onChanged,
      );
}
