// ignore_for_file: public_member_api_docs, constant_identifier_names
enum ConstantsPERMISSION {
  create(4),
  read(1),
  update(2),
  delete(8),
  share(16),
  all(31);

  const ConstantsPERMISSION(this.value);
  final int value;
}

enum ActionTYPE {
  get('GET'),
  post('POST'),
  put('PUT'),
  delete('DELETE'),
  web('WEB');

  const ActionTYPE(this.value);
  final String value;
}

enum WidgetButtonTYPE {
  new('new'),
  more('more'),
  setup('setup');

  const WidgetButtonTYPE(this.value);
  final String value;
}

enum TaskSTATUS {
  failed(4),
  successful(3),
  running(2),
  scheduled(1),
  unknown(0);

  const TaskSTATUS(this.value);
  final int value;
}

enum TaskSTATUS {
  failed(4),
  successful(3),
  running(2),
  scheduled(1),
  unknown(0);

  const TaskSTATUS(this.value);
  final int value;
}

enum ShareTYPE {
  user(0),
  group(1),
  usergroup(2),
  link(3),
  email(4),
  contact(5),
  remote(6),
  circle(7),
  guest(8),
  remote_group(9),
  room(10),
  userroom(11),
  deck(12),
  deck_user(13),
  sciencemesh(15);

  const ShareTYPE(this.value);
  final int value;
}

enum ShareSTATUS {
  pending(0),
  accepted(1),
  rejected(2);

  const ShareSTATUS(this.value);
  final int value;
}
