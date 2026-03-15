1. **L0->1**

  

Connect to the game using SSH with the command

```

ssh -p 2220 bandit0@bandit.labs.overthewire.org

```

To find the password to move to l1, just print the content of the readme file using cat

Password 1:

```

ZjLjTmM6FvvyRnrb2rfNWOZOTa6ip5If

```

  

2. **L1->2**

  

There is a file named - with the password, it is not possible to cat using cat - so you need to give path using

```

cat ./-

```

Password 2:

```

263JGJPfgU6LtdEvgfWU1XP5yac29mFx

```

  

3. L2->3

  

You can not directly run commands on a file with spaces you can either wrap the filename in a string or you can add a backslash before every space

  

Password 3:

```

MNk8KNH3Usiio41PRUEoDFPqfxLPlSmx

```

  

4. L3->4

  

ls -a to show all files then just cat print the file via cat

  

password 4: 2WmrDFRmJIq3IPxneAaMGhap0pFhF3NJ

  

5. L4->5

  

There is a single human readable text file, to see the types of all files

use the command

```

file ./*

```

then print the flag using cat

  

password 5:

```

4oQYVPkxZOOEOO5pTW81FB8j8lxXGUQw

```

  

6. L5->6

  

use this command to find the file with exactly 1033 bytes size then print the contents

```

find ./ -type f -size 1033c

```

password 6

```

HWasnPhtq9AVKe0dmk45nxy20cvUa6EG

```

  

7. L6->7

  

Ok, so i first go to the root directory and search for 33 byte files using

```

find / -type f -size 33c -user bandit7 -group bandit6

```

  

i ran this command after which there were a lot of files with permission denied and only one file with accesible permissions located at /var/lib/dpkg/info/bandit7.password

  

password 7:

```

morbNTDkSW6jIlUc0ymOdMaLnOlFVAaj

```

  

8. L7->8

  

I just grepped for millionth in the file and got the flag dfwvzFQi4mU0wfNbFOe9RoWskMLg7eEc

  

```

grep millionth data.txt

  

```

  

password 8:

```

4CKMh1JI91bUIZZPXDqGanal4xvAg0JM

```

  

9. L8->9

  

first sort the file then pipe the output of sorted file to uniq

  

```

sort filename.txt | uniq -u

```

  

this outputs the flag

  

Password 9:

```

4CKMh1JI91bUIZZPXDqGanal4xvAg0JM

```

  

10. L9->10

  

run the command

```

strings data.txt

```

  
  

this will output a few strings, only one string with a lot of ==

  

password 10 :

```

FGUW5ilLVJrxX9kMYMmlN4MgbpfMiqey

```

  

11. L10->11

  

since the data is in base64 we would need to decode it with this command

  

```

base64 --decode data.txt

```

  

this gives the password

  

password 11:

```

dtR173fZKb0RRsDFSGsg2RWnpNVj3qRr

```

  

12. L11-12

  

In this every letter has been replaced by the letter 13 places in front of it , so A maps to N, N maps to Z, M maps to Z and Z maps to M so on for all letters

  

tr command trnasforms the input string according to the mapping you give it

  

command

```

cat data.txt | tr ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz NOPQRSTUVWXYZABCDEFGHIJKLMnopqrstuvwxyzabcdefghijklm

```

  

this will print the flag

  

password 12:

```

7x16WNeHIi5YkIhWsfFIqoognUTyj9Q4

```

  

13. L12-13

  

i had to read a writeup for this

  

password 13:

```

FO5dwFsc0cbaIiH0h8J2eUks2vdTDwAn

```

  

14. L13-14:

  

this level has no password we just have to ssh with private key instead

  

but password which we find on 14 password 14:

```

MU4VWeTyJk8ROof1qqmcBPaLh7lDCPvS

```

  

15. L14-15:

  

use telnet to send the password to localhost 30000, using this command

```

telnet localhost 30000

```

  

after that enter the password you just found in prev when asked

  

the password we find is

password 15:

```

8xCjnmgoKbGLhHFAZlGE5Tmu4M2tKJQo

```

  

16. L15->16

  

This time we will connect using openssl with this command

  

```

openssl s_client -connect localhost:30001

```

  

password 16:

```

kSkvUpMQ7lBYyCM4GBPvCvT1BfWRy0Dx

```

  

17. L16->17

  

first i scanned all ports and found that these ports were listening

```

nmap -p 31000-32000 localhost

```

these ports were listening

  

```

bandit16@bandit:~$ nmap -p 31000-32000 localhost

Starting Nmap 7.94SVN ( https://nmap.org ) at 2026-03-14 16:46 UTC

Nmap scan report for localhost (127.0.0.1)

Host is up (0.00018s latency).

Not shown: 996 closed tcp ports (conn-refused)

PORT STATE SERVICE

31046/tcp open unknown

31518/tcp open unknown

31691/tcp open unknown

31790/tcp open unknown

31960/tcp open unknown

  

```

  

after that i manually tried to connect to these ports using openssl and only 31518 and 31790 supported ssl, after that i used this command to connect

  

```

openssl s_client -connect localhost:31518 -ign_eof

```

i was getting KEYUPDATA without -ign_eof and after some searching i found that there were end of file issues, after this i ran the command on port 31790 to get the RSA key for next level

  

18. L17->18

  

use this command to see the diff between these two files

  

```

diff passwords.new passwords.old

```

  

password 18:

```

x2gLTTjFwMOhQ8oWNbMN362QKxfRqGlO

```

  

19. L18->19

  

pipe the command with ssh

  

```

ssh -p 2220 bandit18@bandit.labs.overthewire.org "cat readme"

```

  

password 19:

```

cGWpMaKXVwDUNgPAVJbWYuGHVn9zl3j8

```

  
  

20. L19->20

  

had to read a writeup for this

  

```

./bandit20-do cat /etc/bandit_pass/bandit20

```

  

this prints the password

  

password 20:

```

0qXahG8ZjOVMN9Ghs7iOWsCfZyXOUbYO

```
