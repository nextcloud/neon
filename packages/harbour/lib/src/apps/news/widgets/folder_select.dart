part of '../app.dart';

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
          hintText: AppLocalizations.of(context).newsFolder,
        ),
        value: value,
        items: [
          DropdownMenuItem(
            child: Text(AppLocalizations.of(context).newsFolderRoot),
          ),
          ...folders.map(
            (final f) => DropdownMenuItem<NewsFolder>(
              value: f,
              child: Text(f.name!),
            ),
          ),
        ],
        onChanged: onChanged,
      );
}
