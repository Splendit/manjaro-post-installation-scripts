# Manjaro Post-Installation Scripts

These scripts set up a fully functional developer PC.

## Usage

### Configuring the Installation

- Clone the master branch
- Change the configuration in ```install.conf``` according to your needs:
  - ```ECLIPSE_INSTALL_DIR```: the directory, where eclipse should be installed
  - ```ECLIPSE_MIRROR```: the mirror, from which eclipse will be downloaded
  - ```ECLIPSE_VERSIONS```: this variable can be specified multiple times. Each entry specifies an eclipse version, which should be downloaded. The version name can be found in a download URL of eclipse.
- In ```optional.conf``` you can specify which of the optional installs should be done. It contains a list of file names from the ```optional/``` directory.

### Running the Install Script

- To execute the install script run the following command in your terminal:
```
$ ./install.sh
```
This will first update your system and make initial settings.
- Restart the PC
- After the reboot run the above command again.
- Restart the PC again
- You're done ;)
