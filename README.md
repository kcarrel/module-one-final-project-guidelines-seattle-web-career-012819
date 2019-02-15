#Marvel Query Generator

##Description

We have utilized the Marvel API to generate a database where users are tracking characters. The user may then find information about their characters and their associated Marvel events (e.g. Civil War). The user can interact with the database using the provided CLI.  

##Install Instructions
1. Fork the repository: https://github.com/kcarrel/apis-and-iteration-seattle-web-career-012819/blob/master/README.md
2. Clone the repository into the desired folder in your terminal
3. Run bundle install
4. Create a secrets.yml file under the config folder with the content as reflected below:
  api_key: 'enter your api key here'
  private_key: 'enter your private api key here'
5. Enter the public and private Marvel API keys (which you can get at https://developer.marvel.com/) into secrets.yml file.
6. Enter '$ rake db:migrate'
7. Enter '$ rake db:seed' to seed the database.
8. Enter '$ ruby .\bin\run.rb' to enter the CLI.

##Contributors Guide
1. Fork the project.
2. Start a feature/bugfix branch.
3. Commit and push.


#License for our code
Link to the license for our code: https://github.com/kcarrel/module-one-final-project-guidelines-seattle-web-career-012819/blob/master/LICENSE.md


This project was created in collaboration with tiefengeist (github.com/tiefengeist).
