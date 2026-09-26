#!/bin/bash

PROJECT_ROOT=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
JDK_JAVA="$JAVA_HOME/bin/java"
JNI_RELEASE="$PROJECT_ROOT/build/jni/release"

echo "Building robot code and capturing classpath..."

./gradlew simulateJava

CLASSPATH=$(./gradlew printClasspath -q)

if [[ "$1" == "--no-gui" ]]; then
  echo "Starting headless WPILib simulation..."
  export HALSIM_EXTENSIONS="" # Blank to explicitly prevent the GUI popup
else
  export HALSIM_EXTENSIONS="$PROJECT_ROOT/build/jni/release/libhalsim_gui.so"
fi
export LD_LIBRARY_PATH="$JNI_RELEASE"
export DYLD_LIBRARY_PATH="$JNI_RELEASE"

# 5. Execute the Java process inline (no debug suspends, runs immediately)
$JDK_JAVA -cp "$CLASSPATH" first.Main
