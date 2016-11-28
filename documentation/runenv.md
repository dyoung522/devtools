# RunEnv v1.0.0
 
Builds and runs a development server environment based upon the options provided on the command line.

## Usage

    runenv [OPTIONS]

## Options

### Specific Options:

    -b, --[no-]build                 [Don't] Run the build job
    -B, --[no-]bundle                [Don't] Run the bundler job
    -r, --[no-]run                   [Don't] Run the server job

### Common Options:

    -h, --help                       Show this message
    -c, --config FILE                Specify an alternate configuration file
        --dry-run                    Don't actually run commands
        --quiet                      Run quietly
    -v, --verbose                    Run verbosely (may be specified more than once)
        --version                    Show version
        
## Configuration

Like all DevTools commands, *RunEnv* will look for any of the following configuration files:

- ~/.runenv
- ./.runenv
- ./runenv.conf
- ./runenv.rc
  
This is a YAML file and must, at least, contain the commands your project needs for bundle, build, and run in the following format:

    commands:
      bundle: shell command here
      build: shell command here
      run: shell command here
      
***Note: These commands are run without any validation, so the onus is on the author to ensure they are correct!***
