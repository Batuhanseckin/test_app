part of my_dialog_view;

class _MyDialogDesktop extends StatelessWidget {
  final MyDialogViewModel viewModel;
  
  _MyDialogDesktop (this.viewModel);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('MyDialogDesktop'),
      ),
    );
  }
}
