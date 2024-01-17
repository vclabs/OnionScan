#!/bin/bash

go install https://github.com/vclabs/OnionScan
cd gopath
cp -r `find ~+ -type d -name "templates"` $HOME
cd -
