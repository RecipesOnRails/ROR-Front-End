# Recipes On Rails-Front End
The front end portion of the Recipes On Rails application. The HTML, CSS, and JavaScript(front_end) lives on this repository and allows users to interact with the backend and microservice portions of the application. A user can make a meal plan and find recipes with the same ingredients with the ability to share them with their friends and family.
## Getting Started

### Prerequisites
Ruby 2.5.3
Rails 5.2.5

### Installing
#### Step One:
On your local terminal, use the command: `git clone git@github.com:RecipesOnRails/ROR-Front-End.git` to clone down the repository on your local machine

#### Step Two
Once that is done, in your terminal, go into that repository and run the command: `bundle install` to install the gems locally

#### Step Three
Setup Local Database with the command: `rails db:{create, migrate, seed}`

## Running the tests
This application uses RSpec for it's test suite.
To run the entire test suite, use the command `bundle exec rspec` and the run specific tests, run `bundle exec rspec` with the folder it lives in afterwards. EX: `bundle exec rspec spec/features/welcome/index_spec.rb`

### Break down into end to end tests
Explain what these tests test and why
```
Give an example
```
### And coding style tests
Explain what these tests test and why
```
Give an example
```
## Deployment
Any pull requests merged into the main branch on GitHub will first be tested by TravisCI.
Once passed by TravisCI, it will automatically deployed to the Heroku website.
https://secure-gorge-18886.herokuapp.com/ is where it lives on production level.
## Built With
* [Ruby on Rails](https://guides.rubyonrails.org/v5.2/) -  Web Framework Used
* [TravisCI](https://docs.travis-ci.com/) - Continuous Integration Service Used
* [Heroku](https://devcenter.heroku.com/categories/reference) - Cloud Platform Service Used
## Contributing
Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.
## Versioning
We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/your/project/tags).
## Authors
* **Megan Gonzales** -
* **Jacob Arellano** -
* **Arika Blenker** -
* **Harrison Blake** -
* **Hope McGee** -
* **Trevor Robinson** --
* **Jeremiah Michlitsch** --
See also the list of [contributors](https://github.com/RecipesOnRails/ROR-Front-End/graphs/contributors)
## License
## Acknowledgments
