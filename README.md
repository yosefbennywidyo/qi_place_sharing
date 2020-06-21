# Place Sharing Site

Maps form an important part of our life now. Your task is to make an application which would allow one to share a location with other people.

## Project requirements:
- Node version  : 12.16.1
- Ruby version  : 2.7.1
- Rails version : 6.0.3.2
- Yarn version  : 1.22.4

## Install Ruby, Ruby on Rails, Git, and Database
### Mac
Please follow this article to [install Ruby, Ruby on Rails, Git, and Database on MacOs](https://gorails.com/setup/osx/10.15-catalina)

### Ubuntu
Please follow this article to [install Ruby, Ruby on Rails, Git, and Database on Ubuntu](https://gorails.com/setup/ubuntu/20.04)

### Windows
Please follow this article to [install Ruby, Ruby on Rails, Git, and Database on Windows](https://gorails.com/setup/ubuntu/20.04)

## Install NodeJs and Yarn
### Mac
Please follow this article to [install NodeJs on Mac](https://www.taniarascia.com/how-to-install-and-use-node-js-and-npm-mac-and-windows/#installation-on-a-mac-or-linux)

### Ubuntu
Please follow this article to [install NodeJs on Ubuntu](https://www.taniarascia.com/how-to-install-and-use-node-js-and-npm-mac-and-windows/#installation-on-a-mac-or-linux)

### Windows
Please follow this article to [install NodeJs on Windows](https://www.taniarascia.com/how-to-install-and-use-node-js-and-npm-mac-and-windows/#installation-on-windows)

## Run project locally
```bash
git clone https://github.com/fybwid/qi_place_sharing.git 
cd qi_place_sharing
bundle install
rails db:setup
rails webpacker:install # press `n` when asked about `config/webpacker.yml` and `config/webpack/environment.js`
rails assets:precompile
rails webpacker:compile
rails s
```

### Run testing
```bash
cd qi_place_sharing
rspec
```

## Testing the app
All user email using `password` as their password
- user0@placesharing.com
- user1@placesharing.com
- user2@placesharing.com
- user3@placesharing.com
- user4@placesharing.com
- user5@placesharing.com
- user6@placesharing.com
- user7@placesharing.com
- user8@placesharing.com
- user9@placesharing.com