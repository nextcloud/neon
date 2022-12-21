part of '../app.dart';

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
          hintText: AppLocalizations.of(context).newsFolder,
        ),
        value: value,
        items: [
          DropdownMenuItem(
            child: Text(AppLocalizations.of(context).newsFolderRoot),
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
