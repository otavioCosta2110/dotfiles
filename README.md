# my dots
 <div align="center">
  <img src="https://github.com/user-attachments/assets/be662c56-4974-4241-8789-b55806f7c7a2" width="49%">
  <img src="https://github.com/user-attachments/assets/85a2e438-fe35-40d2-aaa6-940015fccbc1" width="49%">
  <img src="https://github.com/user-attachments/assets/f0b46ca2-f81d-485b-a944-ac5136152cf3" width="49%">
  <img src="https://github.com/user-attachments/assets/9effbad8-2e95-4481-9c13-3b1843e3dfd1" width="49%">
</div>



## to install all the necessary packages in arch (there may be some missing) run 
```
sudo chmod +x install_apps.sh

# if you wish to use i3
./install_apps.sh i3

# if you wish to use hyprland
./install_apps.sh hyprland
```
if you don't use either i3 or hyprland, it will just install some basic packages

## to copy the dotfiles to you pc, run 
#### ⚠️ **ATTENTION: THIS DOES NOT CREATE A BACKUP FOR YOU FILES**, be careful
```
sudo chmod +x push.sh
./push.sh
```
this will copy the contents all dirs listed in [dir_list](https://github.com/otavioCosta2110/dotfiles/blob/main/dir_list) to your local machine
