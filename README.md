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

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## Authors

Jacques Plante - Initial work

## License
[MIT](https://choosealicense.com/licenses/mit/)
