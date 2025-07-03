#!/bin/bash

set -eu

declare -r SENNA_HOME='/tmp/senna-toolchain'

if [ -d "${SENNA_HOME}" ]; then
	PATH+=":${SENNA_HOME}/bin"
	export SENNA_HOME \
		PATH
	return 0
fi

declare -r SENNA_CROSS_TAG="$(jq --raw-output '.tag_name' <<< "$(curl --retry 10 --retry-delay 3 --silent --url 'https://api.github.com/repos/AmanoTeam/Senna/releases/latest')")"
declare -r SENNA_CROSS_TARBALL='/tmp/senna.tar.xz'
declare -r SENNA_CROSS_URL="https://github.com/AmanoTeam/Senna/releases/download/${SENNA_CROSS_TAG}/x86_64-linux-gnu.tar.xz"

curl --retry 10 --retry-delay 3 --silent --location --url "${SENNA_CROSS_URL}" --output "${SENNA_CROSS_TARBALL}"
tar --directory="$(dirname "${SENNA_CROSS_TARBALL}")" --extract --file="${SENNA_CROSS_TARBALL}"

rm "${SENNA_CROSS_TARBALL}"

mv '/tmp/senna' "${SENNA_HOME}"

PATH+=":${SENNA_HOME}/bin"

export SENNA_HOME \
	PATH
