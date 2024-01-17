#!/bin/bash

go install gitlab.com/n3ph0s/onionscan@latest
cd gopath
cp -r `find ~+ -type d -name "templates"` $HOME
cd -
