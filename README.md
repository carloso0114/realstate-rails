# README
**Description**
 - In this repo we use an api from easybroker, also using a gem called easy_broker making easier to get api information. 
 Populating a list of published properties, giving information about them and providing a form to get information about the interested customer to the owner of the easybroker account.

**How to run the project:**
- Open your favorite console and write
- git clone https://github.com/carloso0114/realstate-rails.git
- cd realstate-rails
- bundle i
- rails s
- Open any browser and navigate to the url http://127.0.0.1:3000
- Enjoy

*Ruby version*
3.1.2
*Rails version*
7.0.3.1

**Notes**

- What was the hardest thing you had to solve while building the website?
  answer: It was the first time i worked with an api without an access control allow origin (blocked by CORS policy), im used to consume apis from frontend frameworks like react or angular.

- Are there any areas of your code that you think isn't that "clean"?
  answer: Well i think it's short, simple, functional and easy to understand. I've been told that logic should not be used in views.

- If you weren't able to finish: what were you able to complete and were you happy with your progress given the time constraints?
  answer: Im missing the testing, i was able to consume the api, create the routes for as many pages based on id, and then populate the information based on the public ID of the property, i was able to create the post request and give alerts if the form worked or not, im not happy with my progress because i strugled with testing part but the time constraint was more than enough for a more advanced person than me, i guess.