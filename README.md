# Forum_Project

This Forum_Project is a baseline for forum creation. It includes Users, Categories, Boards, Threads, Posts, and Static Pages. The base forum is largely empty, but the admin controller allows for a lot of customization for boards and categories that your forum will hold.

## Getting Started

Start by cloning the repository to your machine. Once you navigate to the proper files, do the following:

Start setup for the forum by using 'bundle' to make use of all the necessary gems.
```bash
bundle install
```

After, run the migrations and make sure to seed the database. This step is incredibly important!
```bash
rails db:migrate
rails db:seed
```
NOTE: if you do NOT seed the database, you will be without an admin.

Finally, start your server!
```bash
rails s
```

## Setting Up Admin

The seed that was run will create a single user 'primary_admin' with a password '1!Admin!1'. It is recommended to change your password immediately so as no users can
find this README and log in as an administrator.

To do so, click on 'Sign in' on the top navigation, and log in to the account. Then, click on profile on the navigation bar and click on edit profile on the new page. Change your password, making sure it follows the requirements shown on hover, and click on update. Viola! You have successfully secured your admin account!

If you are looking to promote another user to administrator, you can navigate to their profile through the 'members' tab, and edit their profile. There will be a checkbox for 'Administrator?'. Checking and updating the profile will give them administrative positions. Do this with only trusted members to keep your forum safe.

## User-Side Use

Users will have an easy time signing up and using the forum. There is both the option to sign up with GitHub accounts or creating completely new ones. Users will be able to create threads and posts, but will not be able to create boards or categories, nor will they be able to delete anything that is not theirs to begin with. If you find users with malicious intent, you can ban their account on their profile page by clicking the 'Ban User' button.

Users can change their avatar or username on their profile page, and are protected against empty fields with default values and error prompts.

## DEMO

Below is a video demonstrating the use of the application

https://www.youtube.com/watch?v=Iev0SH2fgQs&t

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## Authors

Jacques Plante - Initial work

## License
[MIT](https://choosealicense.com/licenses/mit/)
