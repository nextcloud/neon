part of '../neon_news.dart';

class NewsFolderSelect extends StatelessWidget {
  const NewsFolderSelect({
    required this.folders,
    required this.onChanged,
    this.value,
    super.key,
  });

  final List<news.Folder> folders;
  final ValueChanged<news.Folder?> onChanged;
  final news.Folder? value;

  @override
  Widget build(final BuildContext context) => DropdownButtonFormField<news.Folder>(
        decoration: InputDecoration(
          hintText: NewsLocalizations.of(context).folder,
        ),
        value: value,
        items: [
          DropdownMenuItem(
            child: Text(NewsLocalizations.of(context).folderRoot),
          ),
          ...folders.map(
            (final f) => DropdownMenuItem<news.Folder>(
              value: f,
              child: Text(f.name),
            ),
          ),
        ],
        onChanged: onChanged,
      );
}
