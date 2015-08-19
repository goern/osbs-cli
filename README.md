This is a simple command line container, please also add an alias to your profile:

alias osbs-cli="sudo docker run --rm osbs-cli"

To test osbs-cli simply use it to build itself: osbs-cli -g https://github.com/goern/osbs-cli -i `whoami`/osbs-cli

