# Harch (Hackerz Arch) - A Quick, simplistic Arch box

Updates 10/23/2020:

Fixed BIOS/UEFI bug, it now properly identifies system

Added HarchPOST

Still to do:

Add tools

~~Add GUI~~

Harch = A 'really' basic script install for Arch Linux BIOS/UEFI systems
  To install, boot into Arch live ISO and:
  
  
    1. curl -O https://raw.githubusercontent.com/ChaoticHackingNetwork/Harch/main/Harch
    2. chmod +x Harch
    3. ./Harch
    * Some systems show a bad meterpreter if so run: sed -i -e 's/\r$//' Harch 
    4. After Harch install, it will download HarchPOST
    5. arch-chroot /mnt
    6. chmod +x HarchPOST
    7. ./HarchPOST

Tools:

    1. Tools will be broken down into categories for a more user preferred system, not every tool is needed
    2. WebApp_Wireless.txt = Web App and Wireless Tools, i.e. Metasploit, Dirbuster etc...
    3. 
