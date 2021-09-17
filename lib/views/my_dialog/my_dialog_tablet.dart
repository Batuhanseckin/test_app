part of my_dialog_view;

class _MyDialogTablet extends StatelessWidget {
  final MyDialogViewModel viewModel;

  _MyDialogTablet (this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('MyDialogTablet'),
      ),
    );
  }
}
