# Police MDT System

Comprehensive MDT system for FiveM police departments

## Features

- Wanted List Management
- Criminal Records Management
- Vehicle Search

## Requirements

- FiveM server
- ESX Framework
- MySQL database

## Installation

1. Download the script
2. Place the script in your FiveM resources folder
3. Add `start police-mdt-system` to your server.cfg
4. Import the database.sql file into your MySQL database

## Usage

- Police officers can access the MDT system by typing `/mdt` in the chat
- The MDT system provides a menu with options for managing wanted lists, criminal records, and vehicle searches

## Configuration

The script can be configured by editing the `config.lua` file. The following options are available:

- `PoliceJobName`: The name of the police job
- `PoliceBlipColor`: The color of the police blip
- `PoliceBlipSprite`: The sprite of the police blip
- `PoliceBlipScale`: The scale of the police blip
- `MDTCommand`: The command to open the MDT menu
- `MDTMenuTitle`: The title of the MDT menu
- `MDTMenuSubtitle`: The subtitle of the MDT menu
- `DatabaseName`: The name of the database
- `DatabaseTable`: The name of the database table

---

## Generated with EnderDevelopment

This plugin was generated in minutes with [EnderDevelopment](https://enderdevelopment.com) — the AI platform that turns your ideas into working Minecraft plugins, Discord bots and FiveM scripts.

**Want your own?** [Generate this project on EnderDevelopment](https://dash.enderdevelopment.com?utm_source=github&utm_medium=readme&utm_campaign=police-mdt-system&utm_content=bottom) — describe it in one sentence and get the full source code.