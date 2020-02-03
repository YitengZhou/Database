
University of Bristol School of Computing: COMSM0016 Databases

Database Virtual Machine Setup Script
=====================================
This script utility will build the MariaDB DBMS VM and initial datasets required
for the labs and assessments on this unit.

The script and VM is intended mainly for the MVB computer labs, but can also be
used on the following personal computer systems that support Virtual Box
virtualisation software: Linux, Mac OSX, Windows 10 (ideally with Linux subsystem).

Pre-requirement: You must have at least 1.4GB of available diskspace on your system.


Setup: Lab Computers
====================

Run the following command to display available space in your UoB account,
replacing myusername with your UoB lab username:

df -h | grep myusername

Ensure that you have less than 40% usage in your account, then perform the
following steps:

- Download the DB VM zip file from the COMSM0016 Unit information page.
- Unzip the dbvm directory in your home directory or preferred location.
- In the Terminal, navigate to this location and run setup.sh, e.g.:

cd ~/dbvm
./setup.sh

- Confirm that you want to run the script by typing: y
- The script will take a few minutes (longer if others are also running it).
- On successful completion, a message starting "DB Install Complete" is displayed.
- Follow the instructions and type:

mysql

- This starts the MySQL/MariaDB client, which logs you in to the MariaDB database
  server running in the new Virtual Machine in your UoB account.
- Type the following example SQL commands (make sure you include the semi-colon!):

show databases;
  (lists all dbs available to this user)

use census;
  (selects the census db as the current database)

show tables;
  (lists all tables in the current database)

select * from Occupation;
  (displays all records from the Occupation table in the current database)

- When you have finished your SQL session, to exit the MySQL client, type:
exit

IMPORTANT NOTE: The setup script deletes any VMs and all data when it runs.
Use it only once, or when your VM installation crashes.
The following section explains how to manage your VM.


VM Operations
=============
Your CentOS Linux Virtual Machine is running on the Virtual Box virtualisation
software in your account or on your PC.
For best results, the VM should be stopped (halted) at the end of each lab/SQL
session, then started again for the next session (do NOT use setup.sh again!)

The following vagrant commands can be used (in your dbvm directory):

vagrant halt
  (shuts down your VM, but saves all data)

vagrant up
  (starts up your VM)

vagrant status
  (shows the running / halted status of your VM)

vagrant ssh
  (optional - starts an SSH session in your VM)


Setup: Personal Computers
=========================

Compatible with: Linux, Mac OSX and Windows 10 systems supporting Virtual Box
See note on Windows 10 below.

Prereqs: All personal computers require recent versions of the following free
software installed:
- Oracle VirtualBox (https://www.virtualbox.org/)
- HashiCorp Vagrant (https://www.vagrantup.com/)
  (NOTE: ensure that version 2.x is installed)

Setup:
- Ensure you have at least 1.4GB available disk space on your system.
- Download the zip file and unzip the dbvm folder in a suitable location.
- Open a Terminal window to this location and follow the earlier instructions for
  Lab accounts.

NOTE ON WINDOWS 10 SETUP:
Windows 10 should have the Linux subsystem installed, to enable the setup.sh
script to be run without modification.
If a Linux command prompt is not available:
1) Unzip the dbvm folder as normal, then open a DOS prompt at that folder.
2) Revew setup.sh in a text editor and manually copy/paste the vagrant commands
   one by one from setup.sh into the DOS window.
3) Create a simple text file '.my.cnf' in a text editor (NOT NOTEPAD!), saved in
   your PC user's home folder, i.e. C:\Users\<yourname>\.my.cnf, then copy/paste
   the following lines into it:

[client]
port=3306
host=127.0.0.1
user=student


Root DB Access
==============
The default MySQL user is 'student'. You should use this for all normal SQL
operations. It is restricted to read-only access on the census and elections*
tables to avoid accidental deletion of the sample data.

However, you can also log in as 'root' administrator if required using:
mysql -u root -ppassword

This can be used to create / delete databases and change permissions, but should
not be used for standard data operations, following best practices.


Removing the VM
===============
If you wish to remove all DB VM assets from your lab account or personal computer,
to reclaim disk space after completion of the Unit, run the following commands
at a command prompt in your dbvm directory:

vagrant destroy
vagrant box remove --all bento/centos-7


Support
=======
For all VM / DB support out of Unit lab hours, please post on the Course Forum,
linked in the left menu of the COMSM0016 course site on BlackBoard.


DBVM script v1.1 Alan Forsyth & David Bernhard
