set -x

#added all scripts here to run appletv locally from one script
sh scripts/_switch_web.sh extension

flutter build web --web-renderer html --csp

sh scripts/_switch_web.sh web