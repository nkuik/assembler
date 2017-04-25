# Assembler

## Assignment Requirements
* ERD file is found at `erd.pdf` in the repo
* Questions and thoughts I had can be found in `docs/questions_assumptions.md`
* Note: The file upload won't work locally due to users not having the correct env variables. The upload will need to be viewed on the production instance.

## Tech
Assembler is a Rails 5 app, using a PostgreSQL database and (very) basic CSS styling.

## Purpose
The main purpose of this app is to assign team members with different skill sets
to projects. The app goes beyond the simple act of assigning members to projects,
in that it calculates a match score for each team member for each project and ranks
them according to project specifications and staff qualifications.

## Installation
### Prerequisites
* Homebrew
* Git
* Ruby 2.3.1
* Postgres
* Bundler

### Local Installation Instructions
#### Mac
Make sure you have homebrew installed. If not, go [here](https://brew.sh/), then come back.

If you don't have git, install that: `brew install git`

Copy the app files to a directory, or clone the repo into an appropriate directory: `git clone "https://github.com/nkuik/assembler.git"`

Next, ensure ruby is installed:
`ruby -v`

Bundler is next: `gem install bundler`

The app uses PostgreSQL, so this is also necessary: `brew install postgresql`

After installing postgres, cd into the app: `cd assembler`

Run `bundle install` and then `rails db:create db:migrate db:seed`

Start the server next: `rails s` and assemble your team!

## Create New Team Member
A new team member can be created by clicking the "Create New Team Member" link
from the homepage, or it can be done [here](https://signifly-assembler.herokuapp.com/team_members/new)

Make sure to go on to "Create a skill" after entering the name, position, and image of the team member,
as this determines the kind of match the member is given for projects.

Happy assembling!
