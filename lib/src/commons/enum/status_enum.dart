enum StatusEnum {
  pending('Pendente'),
  done('Finalizado');

  final String value;

  const StatusEnum([this.value = '']);
}
