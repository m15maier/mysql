CREATE TABLE `player` (
  `id` integer,
  `nickname` varchar(128),
  `created_at` timestamp,
  `email` varchar(128),
  `is_blocked` bool
);

CREATE TABLE `match` (
  `match_id` integer,
  `map` map_id,
  `Player1` Player_id,
  `Player2` Player_id,
  `winner` Player_id,
  `created_at` timestamp
);

CREATE TABLE `chat` (
  `chat_id` integer,
  `created_at` timestamp,
  `message` message_id,
  `history` text,
  `match_id` integer
);

CREATE TABLE `message` (
  `message_id` integer,
  `created_at` timestamp,
  `message` varchar(128),
  `author` Player_id,
  `receiver` Player_id,
  `is_read` bool
);

CREATE TABLE `maps` (
  `map_id` integer,
  `created_at` timestamp,
  `map_url` varchar(128)
);

ALTER TABLE `match` ADD FOREIGN KEY (`Player1`) REFERENCES `player` (`id`);

ALTER TABLE `match` ADD FOREIGN KEY (`Player2`) REFERENCES `player` (`id`);

ALTER TABLE `match` ADD FOREIGN KEY (`winner`) REFERENCES `player` (`id`);

ALTER TABLE `message` ADD FOREIGN KEY (`author`) REFERENCES `player` (`id`);

ALTER TABLE `message` ADD FOREIGN KEY (`receiver`) REFERENCES `player` (`id`);

ALTER TABLE `match` ADD FOREIGN KEY (`map`) REFERENCES `maps` (`map_id`);

ALTER TABLE `message` ADD FOREIGN KEY (`message_id`) REFERENCES `chat` (`message`);
