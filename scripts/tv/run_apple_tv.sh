set -x

#added all scripts here to run appletv locally from one script
sh scripts/_switch_target.sh ios

# set your own path to custom engine here
export FLUTTER_LOCAL_ENGINE=/Users/g721945/work/engine/src

# Clean old mess
flutter clean

#build for ios
flutter pub get
flutter build ios --dart-define TV_MODE=ON

#move ios tvos folders
sh scripts/_switch_target.sh tvos

cd ios

#choose the necessary type of the engine
#  'debug_sim' - engine for apple tv simulator
#  'debug' - engine for real apple tv device, debug mode
#  'release' - engine for real apple tv device, release mode
sh ../scripts/copy_framework.sh debug_sim FLUTTER_LOCAL_ENGINE

flutter pub get

pod install

#add local engine in xcode project
sed -i '' "s#FLUTTER_LOCAL_ENGINE[[:space:]]=[[:space:]].*;#FLUTTER_LOCAL_ENGINE = \"${FLUTTER_LOCAL_ENGINE}\";#g" Runner.xcodeproj/project.pbxproj

open Runner.xcworkspace

sh scripts/_switch_target.sh ios

