# Configuration Files

## Overview
The `configs/` folder contains all the configuration files for the multi-stack project. Each stack (Flask, Node.js, and Flutter) has its own configuration file to manage environment-specific settings.

### Files
1. `.env`
   - Shared environment variables for all stacks.

2. `flask-config.yaml`
   - Configuration specific to the Flask backend.

3. `nodejs-config.json`
   - Configuration specific to the Node.js backend.

4. `flutter-config.json`
   - Configuration for the Flutter frontend.

### Usage

#### Flask
- Install `pyyaml` to parse YAML configurations.
- Load the configuration in your Flask app:
  ```python
  import yaml

  with open('configs/flask-config.yaml', 'r') as file:
      config = yaml.safe_load(file)
