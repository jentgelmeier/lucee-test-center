# Lucee Test Center

This is a simple project made using Coldfusion and MySQL where a user can register an account, login, and sign up for or cancel a test. 

## Requirements
You will need the following installed on your PC:
- Lucee 
	- I recommend using CommandBox. The setup instructions assume the use of CommandBox.
- MySQL
	- I recommend adding mysql to the path so that you can use the mysql command from the terminal.

## Installation and Setup
1. Clone this repository.
```
git clone https://github.com/jentgelmeier/lucee-test-center.git
cd lucee-test-center
```
2. Initialize the database.
```
cd data
mysql -u USERNAME --password < dump.sql
```
- Replace USERNAME with your MySQL username. Enter your MySQL password when prompted.

3. Run the app
- Return to the root folder: ``cd ..``
- Start the server using CommandBox  by entering ``box server start``. The app should open in your browser using localhost.
4. Configure the Lucee Web Admin password
- Type ``box`` to start CommandBox in the terminal. Then enter the following commands, replacing PASSWORD with your chosen password. When the installations finish, type ``quit`` to exit CommandBox.
```
propertyFile set ~/.box.env cfconfig_adminPassword PASSWORD
install commandbox-cfconfig
install commandbox-dotenv
```
5. Connect the database 
- Add "/lucee/admin/web.cfm" at the end of your URL to navigate to the Lucee Web Admin. 
- Be sure you're on the Web tab, then enter your password from the step 4 to log in.
- Click "datasource" on the left sidebar. Then enter "testschedulingDB" as the name and "MySQL" as type. Click "Create".
- Enter your MySQL username and password in the username and password fields

## Some Notes
You must login in order to access the site. Information for users, test types, locations, and dates are stored in a MySQL database. I added just enough data to make the site functional; more could certainly be added. 

If you make changes or additions to any of the files in the components folder, you will need to restart the server for changes to take effect; you can restart the server by running ``box server restart`` in the root folder of the project.

Some ideas about how this project could be expanded:
- a profile page for users to manage their account details
- a feature to email users a confirmation of their test registration
- an admin section to manage users and test registrations
