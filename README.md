#NAME 

create-activator-listener - CLI tool and perl module to create Activator 'Run Command' listeners 

#SYNOPSIS

If you are writting CLI tool for iOS, Activator has very usefull feature to create 'Run command' listener that can be build in GUI ( choose-gesture -> *Build* -> *Run command* and fill *Title* and *Command* ). Assigning created listener to event will execute specified command in shell. Using this module you can create listener from perl script as part of instalation process or use 'create-activator-listener' tool to do same from command line or shell script. Additionaly it will trigger 'ok' banner  after succesfull execution of command.

To create Activator listener during package instalation, include it in a package and put into debian 'postinst' file `create-activator-listener -c 'command -param -param'`
As not everyone is fan of command line, this way user can install your tool and Activator gesture is created automaticaly so user can just assign it.

#GIF

<center>![ios-activator-listener-create.gif](https://raw.githubusercontent.com/z448/pgcheck/master/ios-activator-listener-create.gif)</center>


#USAGE

```
# from command line or shell script

# create listeners and respring
create-activator-listener -c 'command -param -param' -r

# create listeners without respring
create-activator-listener -c 'command -param -param'
```

```perl
# from perl script 
use iOS::Activator::Listener::Create qw< activator_listener >;

# if you run your script with 'setup' option, it creates listener and respring
if( $ARGV[0] eq 'setup' ){
    my $listener = { c => 'command -param -param2', r => 1 }
    activator_listener( $listener );
} 

```

#INSTALLATION

- add http://load.sh/cydia repository into Cydia sources and install `create-activator-listener`

**or**

- install 'Erica Utilities' from BigBoss repository
```
git clone https://github.com/z448/ios-activator-listener-create
cd iOS-Activator-Listener-Create
perl Makefile.PL
make
sudo make install
```

#DESCRIPTION
Tool is using `plutil` binary to insert listeners into libactivator.plist which is loaded by Activator after respring. 
