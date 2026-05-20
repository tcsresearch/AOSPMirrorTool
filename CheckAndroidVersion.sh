#!/bin/env bash

function CheckAndroidSourceVersion() {
	echo "Checking Android Source Version..."
	cd AOSP_Source || return
	git --git-dir .repo/manifests.git log -1
	cd - || return
}

### Run Our Function ###
CheckAndroidSourceVersion

