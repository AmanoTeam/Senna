#/bin/bash

kopt="${-}"

set +u
set -e

if [ -z "${SENNA_HOME}" ]; then
	SENNA_HOME="$(realpath "$(( [ -n "${BASH_SOURCE}" ] && dirname "$(realpath "${BASH_SOURCE[0]}")" ) || dirname "$(realpath "${0}")")""/../../../../..")"
fi

set -u

CROSS_COMPILE_SYSTEM='serenity'
CROSS_COMPILE_ARCHITECTURE='aarch64'
CROSS_COMPILE_TRIPLET="${CROSS_COMPILE_ARCHITECTURE}-unknown-${CROSS_COMPILE_SYSTEM}"
CROSS_COMPILE_SYSROOT="${SENNA_HOME}/${CROSS_COMPILE_TRIPLET}"

CC="${SENNA_HOME}/bin/${CROSS_COMPILE_TRIPLET}-gcc"
CXX="${SENNA_HOME}/bin/${CROSS_COMPILE_TRIPLET}-g++"
AR="${SENNA_HOME}/bin/${CROSS_COMPILE_TRIPLET}-ar"
AS="${SENNA_HOME}/bin/${CROSS_COMPILE_TRIPLET}-as"
LD="${SENNA_HOME}/bin/${CROSS_COMPILE_TRIPLET}-ld"
NM="${SENNA_HOME}/bin/${CROSS_COMPILE_TRIPLET}-nm"
RANLIB="${SENNA_HOME}/bin/${CROSS_COMPILE_TRIPLET}-ranlib"
STRIP="${SENNA_HOME}/bin/${CROSS_COMPILE_TRIPLET}-strip"
OBJCOPY="${SENNA_HOME}/bin/${CROSS_COMPILE_TRIPLET}-objcopy"
READELF="${SENNA_HOME}/bin/${CROSS_COMPILE_TRIPLET}-readelf"

export \
	CROSS_COMPILE_TRIPLET \
	CROSS_COMPILE_SYSTEM \
	CROSS_COMPILE_ARCHITECTURE \
	CROSS_COMPILE_SYSROOT \
	CC \
	CXX \
	AR \
	AS \
	LD \
	NM \
	RANLIB \
	STRIP \
	OBJCOPY \
	READELF

[[ "${kopt}" = *e*  ]] || set +e
[[ "${kopt}" = *u*  ]] || set +u
