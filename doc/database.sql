create table roles
(
  id          int auto_increment
    primary key,
  name        varchar(100)                        not null,
  slug        varchar(100)                        not null,
  description varchar(200)                        null,
  status      tinyint default '0'                 null,
  created     timestamp default CURRENT_TIMESTAMP not null,
  constraint roles_slug_uindex
  unique (slug)
);

create table tags
(
  id       int auto_increment
    primary key,
  title    varchar(191) null,
  created  datetime     null,
  modified datetime     null,
  constraint title
  unique (title)
)
  charset = utf8mb4;

create table users
(
  id       int auto_increment
    primary key,
  role_id  int          not null,
  email    varchar(255) not null,
  password varchar(255) not null,
  created  datetime     null,
  modified datetime     null
);

create table articles
(
  id        int auto_increment
    primary key,
  user_id   int                    not null,
  title     varchar(255)           not null,
  slug      varchar(191)           not null,
  body      text                   null,
  published tinyint(1) default '0' null,
  created   datetime               null,
  modified  datetime               null,
  constraint slug
  unique (slug),
  constraint user_key
  foreign key (user_id) references users (id)
)
  charset = utf8mb4;

create table articles_tags
(
  article_id int not null,
  tag_id     int not null,
  primary key (article_id, tag_id),
  constraint article_key
  foreign key (article_id) references articles (id),
  constraint tag_key
  foreign key (tag_id) references tags (id)
);

