# CakePHP CMS Tutorial

The completed CMS tutorial application created during
https://book.cakephp.org/3.0/en/tutorials-and-examples/cms/installation.html

## Installation

1. Download [Composer](https://getcomposer.org/doc/00-intro.md) or update `composer self-update`.
2. Download this source code.
3. Install dependencies with composer

```bash
composer install
```

## Configuration

Copy `config/app.default.php` to  `config/app.php` and setup the `'Datasources'` configuration.
You'll also need to create a database and run the SQL located in the tutorial.


## Database

CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  email VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL,
  created DATETIME,
  modified DATETIME
);

CREATE TABLE articles (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL,
  title VARCHAR(255) NOT NULL,
  slug VARCHAR(191) NOT NULL,
  body TEXT,
  published BOOLEAN DEFAULT FALSE,
  created DATETIME,
  modified DATETIME,
  UNIQUE KEY (slug),
  FOREIGN KEY user_key (user_id) REFERENCES users(id)
) CHARSET=utf8mb4;

CREATE TABLE tags (
  id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(191),
  created DATETIME,
  modified DATETIME,
  UNIQUE KEY (title)
) CHARSET=utf8mb4;

CREATE TABLE articles_tags (
  article_id INT NOT NULL,
  tag_id INT NOT NULL,
  PRIMARY KEY (article_id, tag_id),
  FOREIGN KEY tag_key(tag_id) REFERENCES tags(id),
  FOREIGN KEY article_key(article_id) REFERENCES articles(id)
);

INSERT INTO users (email, password, created, modified)
VALUES
       ('cakephp@example.com', 'sekret', NOW(), NOW());

INSERT INTO articles (user_id, title, slug, body, published, created, modified)
VALUES
       (1, 'First Post', 'first-post', 'This is the first post.', 1, now(), now());