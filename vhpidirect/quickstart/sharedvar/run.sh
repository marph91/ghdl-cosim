#!/usr/bin/env sh

set -e

cd $(dirname "$0")


echo "VHDL 93: Analyze pkg_93.vhd ent.vhd tb.vhd"
ghdl -a --std=93 pkg_93.vhd ent.vhd tb.vhd

echo "Build tb_93 with main.c"
ghdl -e --std=93 -Wl,main.c -o tb_93 tb

echo "Execute tb_93"
./tb_93

echo "Clean tb_93"
rm work-obj*.cf tb_93 *.o
echo ""


echo "VHDL 08 -frelaxed: Analyze pkg_93.vhd ent.vhd tb.vhd"
ghdl -a --std=08 -frelaxed pkg_93.vhd ent.vhd tb.vhd

echo "Build tb_08relaxed with main.c"
ghdl -e --std=08 -frelaxed -Wl,main.c -o tb_08relaxed tb

echo "Execute tb_08relaxed"
./tb_08relaxed

echo "Clean tb_08relaxed"
rm work-obj*.cf tb_08relaxed *.o
echo ""


echo "VHDL 08: Analyze pkg_08.vhd ent.vhd tb.vhd"
ghdl -a --std=08 pkg_08.vhd ent.vhd tb.vhd

echo "Build tb_08 with main.c"
ghdl -e --std=08 -Wl,main.c -o tb_08 tb

echo "Execute tb_08"
./tb_08

echo "Clean tb_08"
rm work-obj*.cf tb_08 *.o
echo ""


echo "VHDL 93: Analyze shint/pkg.vhd shint/ent.vhd tb.vhd"
ghdl -a shint/pkg.vhd shint/ent.vhd tb.vhd

echo "Build tb_93shint with main.c"
ghdl -e -Wl,shint/main.c -o tb_93shint tb

echo "Execute tb_93shint"
./tb_93shint

echo "Clean tb_93shint"
rm work-obj*.cf tb_93shint *.o
echo ""


echo "VHDL 08: Analyze shint/pkg.vhd shint/ent.vhd tb.vhd"
ghdl -a --std=08 shint/pkg.vhd shint/ent.vhd tb.vhd

echo "Build tb_08shint with main.c"
ghdl -e --std=08 -Wl,shint/main.c -o tb_08shint tb

echo "Execute tb_08shint"
./tb_08shint

echo "Clean tb_08shint"
rm work-obj*.cf tb_08shint *.o
