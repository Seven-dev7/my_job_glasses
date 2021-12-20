Welcome to my JSON PARSER 🙂

# SETUP
Stack: ruby, rspec

- Install project dependencies: bundle install
- Run specs: rspec
- Run Ruby main.rb 

# rObjects

  - Main is the main object which computes FindFile and CsvWriter objects
    - Load CommunicationDisplay to share with user in console.
    - Load FindFile object to find your json file.
    - Load CsvWriter finally to write the new csv file

  - CommunicationDisplay Object
    - share with user in console

  - FindFile Object
    - Load the dir wich is contain the json-file to choose it

  - CsvWriter Object
    - need a parsed_json from a json_file already read as arg to init
    - Format and Write to Csv Format

# Sources
 - https://github.com/MyJobGlasses/Backend-TechTest