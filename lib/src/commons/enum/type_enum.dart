enum TypeEnum {
  shareLink('Compartilhar Link'),
  postSocial('Postar no Feed do Instagram'),
  postStatus('Postar no Status do Instagram');

  final String value;
  const TypeEnum([this.value = '']);
}
