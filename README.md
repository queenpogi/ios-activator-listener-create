#NAME 

setup-activator-listener - iOS tool and (eventually) perl module to programmatically create activator listeners for CLI tools

#SYNOPSIS

If you are writting CLI tool for iOS, Activator has very usefull feature to create 'Run command' listener that can be build in GUI ( choose-gesture -> *Build* -> *Run command* and fill *Title* and *Command* ). Assigning created listener to event will execute specified command in shell. Using this module you can create listener from code as part of instalation process. Additionaly it will create'Show alert' listener that is trigerred after succesfull execution of command.

#USAGE

```
setup-activator-command 'command -param -param'
```

#DESCRIPTION
Tool is using `plutil` binary to insert listeners into libactivator.plist which is loaded by Activator after respring. 