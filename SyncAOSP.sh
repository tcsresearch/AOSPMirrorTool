#!/bin/env bash

function SyncAOSP() {
	cd AOSP_Source || return
	repo sync -j4 --fail-fast
	cd - || return
	date > LAST_UPDATED
}

### Run Our Function ###
SyncAOSP

