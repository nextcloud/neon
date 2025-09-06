import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:news_app/l10n/localizations.dart';
import 'package:nextcloud/news.dart' as news;

class NewsFolderSelect extends StatelessWidget {
  const NewsFolderSelect({
    required this.folders,
    required this.onChanged,
    this.value,
    super.key,
  });

  final BuiltList<news.Folder> folders;

  /// {@macro flutter.material.dropdownButton.onChanged}
  final ValueChanged<news.Folder?> onChanged;
  final news.Folder? value;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<news.Folder>(
      decoration: InputDecoration(
        hintText: NewsLocalizations.of(context).folder,
      ),
      initialValue: value,
      items: [
        DropdownMenuItem(
          child: Text(NewsLocalizations.of(context).folderRoot),
        ),
        ...folders.map(
          (f) => DropdownMenuItem(
            value: f,
            child: Text(f.name),
          ),
        ),
      ],
      onChanged: onChanged,
    );
  }
}
