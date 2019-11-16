#!/usr/bin/env bash

export LC_ALL=C
TOPDIR=${TOPDIR:-$(git rev-parse --show-toplevel)}
BUILDDIR=${BUILDDIR:-$TOPDIR}

BINDIR=${BINDIR:-$BUILDDIR/src}
MANDIR=${MANDIR:-$TOPDIR/doc/man}

KRATSCOIND=${KRATSCOIND:-$BINDIR/kratscoind}
KRATSCOINCLI=${KRATSCOINCLI:-$BINDIR/kratscoin-cli}
KRATSCOINTX=${KRATSCOINTX:-$BINDIR/kratscoin-tx}
KRATSCOINQT=${KRATSCOINQT:-$BINDIR/qt/kratscoin-qt}

[ ! -x $KRATSCOIND ] && echo "$KRATSCOIND not found or not executable." && exit 1

# The autodetected version git tag can screw up manpage output a little bit
KTCVER=($($KRATSCOINCLI --version | head -n1 | awk -F'[ -]' '{ print $6, $7 }'))

# Create a footer file with copyright content.
# This gets autodetected fine for kratscoind if --version-string is not set,
# but has different outcomes for kratscoin-qt and kratscoin-cli.
echo "[COPYRIGHT]" > footer.h2m
$KRATSCOIND --version | sed -n '1!p' >> footer.h2m

for cmd in $KRATSCOIND $KRATSCOINCLI $KRATSCOINTX $KRATSCOINQT; do
  cmdname="${cmd##*/}"
  help2man -N --version-string=${KTCVER[0]} --include=footer.h2m -o ${MANDIR}/${cmdname}.1 ${cmd}
  sed -i "s/\\\-${KTCVER[1]}//g" ${MANDIR}/${cmdname}.1
done

rm -f footer.h2m
