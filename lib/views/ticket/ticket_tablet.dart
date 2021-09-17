part of ticket_view;

class _TicketTablet extends StatelessWidget {
  final TicketViewModel viewModel;

  _TicketTablet (this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('TicketTablet'),
      ),
    );
  }
}
