# Powershell-scripts

PowerShell Network Adapter Configuration Script
This PowerShell script allows you to interactively configure network adapter parameters, including IP address, subnet mask, default gateway, and DNS server addresses, on Windows systems. The script will prompt for input for each network adapter that is currently 'Up'. If you want to skip any of the parameters, just press Enter when prompted.

Prerequisites
Windows PowerShell (v5.0 or later recommended)
Administrative privileges
Usage
Save the script as NetworkAdapterConfig.ps1.

Right-click on the PowerShell icon and select 'Run as administrator' to open a PowerShell session with administrative privileges.

Navigate to the directory containing the NetworkAdapterConfig.ps1 script.

Run the script by typing .\NetworkAdapterConfig.ps1 and pressing Enter.

Follow the on-screen prompts to configure the network adapter parameters.

After the configuration is complete, the script will display the updated network configuration using ipconfig.

Important Notes
Be sure to back up your current network configuration before running the script, as it could potentially cause network issues.

The script may require modification if your environment has specific requirements or restrictions.

If you encounter issues or need further assistance, please consult your system administrator or network support team.

Contributing
Please submit any issues, suggestions, or improvements through the project's GitHub repository. We appreciate your feedback and contributions.

License
This project is licensed under the MIT License. See the LICENSE file for more information.

Acknowledgements
Thank you to the community members and contributors who have helped improve and maintain this script.
