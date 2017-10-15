# apicurious

This project re-constructs a simplified version of Github's existing UI using their own API. Performance, UI, and overall user experience are emphasized. TDD was used to drive all layers of development.

## Features

  * User can authenticate using Omniauth
  * User can view basic information about his/her account
  * User can view a summary feed of his/her recent activity
  * User can view a list of his/her repositories
  
## Getting Started

1. Install Rails at the command prompt if you haven't yet:
```
$ gem install rails
```
2. At the command prompt, clone this repository:
```
$ git clone https://github.com/mimilettd/apicurious.git
```
3. Change directory to apicurious and start the web server:
```
 $ cd apicurious
 $ rails server
 ```
 4. Using a browser, go to `http://localhost:3000` and you'll be prompted to login using your Github account.
