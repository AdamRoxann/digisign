class Khotib {
  String firstName;
  String tanggal;

  Khotib({
    this.firstName,
    this.tanggal,
  });

  static List<Khotib> getKhotibs() {
    return <Khotib>[
      Khotib(
        firstName: 'Ustad A',
        tanggal: '22/03/2020',
      ),
      Khotib(
        firstName: 'Ustad B',
        tanggal: '09/04/2020',
      ),
      Khotib(
        firstName: 'Ustad C',
        tanggal: '12/06/2020',
      ),
      Khotib(
        firstName: 'Ustad D',
        tanggal: '24/06/2020',
      ),
    ];
  }
}
