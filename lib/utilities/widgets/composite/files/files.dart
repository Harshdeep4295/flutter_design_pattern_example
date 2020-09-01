import 'package:flutter/material.dart';
import 'package:flutter_design_pattern_example/design_pattern/composite/ifile.dart';
import 'package:flutter_design_pattern_example/helpers/file_size_converter.dart';
import 'package:flutter_design_pattern_example/utilities/app_constants.dart';

// This is base class to display the size of file
class File extends StatelessWidget implements IFile {
  final String title;
  final int size;
  final IconData icon;

  const File(this.title, this.size, this.icon);

  @override
  int getSize() {
    return size;
  }

  @override
  Widget render(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: paddingS),
      child: ListTile(
        title: Text(
          title,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        leading: Icon(icon),
        trailing: Text(
          FileSizeConverter.bytesToString(size),
          style: Theme.of(context)
              .textTheme
              .bodyText2
              .copyWith(color: Colors.black54),
        ),
        dense: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return render(context);
  }
}
