# Invoke-Obfuscation-Desobfuscation

This repository provides information and scripts for deobfuscating commands or scripts obfuscated with Invoke-Obfuscation.

## Overview

- **Invoke-Obfuscation**: This submodule contains the original Invoke-Obfuscation tool, which is used to obfuscate the code that you want to deobfuscate.

- **Revoke-Obfuscation**: This submodule is another tool designed to help determine if a command is obfuscated with the Invoke-Obfuscation tool.

## Deobfuscation Scripts

There are two PowerShell scripts provided in this repository for deobfuscating commands:

1. **DecodeSpecialChar.ps1**: Use this script if the command you want to deobfuscate is obfuscated with special characters.

2. **Decompress.ps1**: Use this script if the command you want to deobfuscate is obfuscated with compressed characters.

To deobfuscate a command, save the obfuscated command in a file and pass the filename as a parameter to the respective deobfuscation script.

