# filename=$1
# size=${#1}

# text2workspace.py "$filename"

# filename="${filename:0:size-4}.root"
# combine -M AsymptoticLimits --run blind $filename

# files=("mX_450_mY_300_mX" "mX_500_mY_300_mX" "mX_600_mY_300_mX" "mX_600_mY_400_mX" "mX_700_mY_300_mX" "mX_700_mY_400_mX" "mX_700_mY_500_mX")

# files=("no_NN6j_mX_450_mY_300_mX" "no_NN6j_mX_500_mY_300_mX" "no_NN6j_mX_600_mY_300_mX" "no_NN6j_mX_600_mY_400_mX" "no_NN6j_mX_700_mY_300_mX" "no_NN6j_mX_700_mY_400_mX" "no_NN6j_mX_700_mY_500_mX")

# files=("bigSR_mX_450_mY_300_mX" "bigSR_mX_500_mY_300_mX" "bigSR_mX_600_mY_300_mX" "bigSR_mX_600_mY_400_mX" "bigSR_mX_700_mY_300_mX" "bigSR_mX_700_mY_400_mX" "bigSR_mX_700_mY_500_mX")

# files=("bigSR_no6j_mX_450_mY_300_mX" "bigSR_no6j_mX_500_mY_300_mX" "bigSR_no6j_mX_600_mY_300_mX" "bigSR_no6j_mX_600_mY_400_mX" "bigSR_no6j_mX_700_mY_300_mX" "bigSR_no6j_mX_700_mY_400_mX" "bigSR_no6j_mX_700_mY_500_mX")

# files=("no6j_pT30_mX_450_mY_300_mX" "no6j_pT30_mX_500_mY_300_mX" "no6j_pT30_mX_600_mY_300_mX" "no6j_pT30_mX_600_mY_400_mX" "no6j_pT30_mX_700_mY_300_mX" "no6j_pT30_mX_700_mY_400_mX" "no6j_pT30_mX_700_mY_500_mX")

files=("pT30_mX_450_mY_300_mX" "pT30_mX_500_mY_300_mX" "pT30_mX_600_mY_300_mX" "pT30_mX_600_mY_400_mX" "pT30_mX_700_mY_300_mX" "pT30_mX_700_mY_400_mX" "pT30_mX_700_mY_500_mX")

for file in ${files[@]}; do
    # echo "$file"
    python3 generateDataCards.py $file
done