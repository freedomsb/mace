#!/usr/bin/env bash

set -e -u -o pipefail

pushd ../../../
python tools/converter.py build --config=docs/getting_started/models/demo_app_models.yaml

cp -r build/mobilenet/include/ mace/examples/android/macelibrary/src/main/cpp/
cp -r build/mobilenet/lib/ mace/examples/android/macelibrary/src/main/cpp/

popd

./gradlew installAppRelease
