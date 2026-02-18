2. Get super user and create SSH keys
sudo su   -> Gets super user
 
3. ssh-keygen -t ed25519 -C "<EMAIL>"  -> Creates SSH keys with ed25519 algorithm for your email
ed25519 is an encryption algorithm. You can also use rsa. E.g.
ssh-keygen -t rsa -b 4096 -C “your_email@example.com”
4. When you're prompted "Enter a file in which to save the key", you can press Enter to accept the default file location. In my case, the default location is /root/.ssh/id_ed25519 
This will create the "/root/.ssh" directory and save your keys to the file "id_ed25519"

5. Enter a passphrase of your choosing and don’t forget. Please note that GitHub will not accept an empty passphrase.
 
6. Ensure SSH agent is running:
eval "$(ssh-agent -s)"  -> checks if SSH agent is running
 
7.  Add your SSH private key to the ssh-agent. If you created your key with a different name, or if you are adding an existing key that has a different name, replace id_ed25519 in the command with the name of your private key file.
Ssh-add /root/.ssh/id_ed25519
 
8. To print your key on the screen:
cat /root/.ssh/id_ed25519.pub

9. Copy the output to your clipboard (including the email address)

 
10. In your web browser, navigate to GitHub. Go to settings from the right top corner. Go to SSH and GPG keys in
the left menu:
 
 
11. Click on new SSH key. Choose your title. Choose the ”Authentication key” option.
12. Click add
 
 
13. Test your SSH connection to GitHub:
ssh -T git@github.com
 
14. Install Git on your local system
apt-get install git  (might need apt-get update first)
 
15. Try to clone your repository:
git clone <Your Repository's SSH Link>
 
16. Your GitHub repository should have a folder now:
list directory with the command ls
 
17. Create a file to transfer in the Git directory:
cd SYS320-01  -> to change working directory to the new directory
echo "Hello" > firstfile.txt  -> to create a file called firstfile.txt with the text "Hello"
 
18. First commit (it will ask for you to identify yourself first)
git commit -m "Upload test file"  -> to attempt a commit with the note "Upload test file"
 
19. Identify yourself the way Git tells you to
 
20. Add the file you created to the commit
git add .    -> to add every new file and changed file to commit
 
21. Attempt a commit again
 
22. Push the changes
git push

