part of main_view;

class _MainDesktop extends StatelessWidget {
  final MainViewModel viewModel;
  
  _MainDesktop (this.viewModel);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('MainDesktop'),
      ),
    );
  }
}
