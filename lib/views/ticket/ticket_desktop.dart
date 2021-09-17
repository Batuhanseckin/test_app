part of ticket_view;

class _TicketDesktop extends StatelessWidget {
  final TicketViewModel viewModel;
  
  _TicketDesktop (this.viewModel);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('TicketDesktop'),
      ),
    );
  }
}
