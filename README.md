# README

Single Page App named Socio

Step to run:

* cp config/database.yml.sample config/database.yml
* Add username & password in config/database.yml
* Add google client_id & client_secret in

EDITOR="vim" rails credentials:edit -e development

* rails db:create
* rails db:migrate
* rails s
