part of '../neon_news.dart';

class NewsFolderSelect extends StatelessWidget {
  const NewsFolderSelect({
    required this.folders,
    required this.onChanged,
    this.value,
    super.key,
  });

  final List<NextcloudNewsFolder> folders;
  final void Function(NextcloudNewsFolder?) onChanged;
  final NextcloudNewsFolder? value;

  @override
  Widget build(final BuildContext context) => DropdownButtonFormField<NextcloudNewsFolder>(
        decoration: InputDecoration(
          hintText: AppLocalizations.of(context).folder,
        ),
        value: value,
        items: [
          DropdownMenuItem(
            child: Text(AppLocalizations.of(context).folderRoot),
          ),
          ...folders.map(
            (final f) => DropdownMenuItem<NextcloudNewsFolder>(
              value: f,
              child: Text(f.name),
            ),
          ),
        ],
        onChanged: onChanged,
      );
}
