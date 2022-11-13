# README

Построено на базе Ruby 2.7.6 + Rails 6.1.7

В Docker образах находятся БД и ES.

1) bundle install
2) Поднимаем ES и PostgreSQL командой docker-compose up -d
3) rails db:create
4) rails db:migrate
5) rails s
