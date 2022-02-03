xsec = 300 # fb

import argparse
import shlex
import subprocess

def genDataCard(rootFile):
    dataCardText = [
        'imax 1  number of channels\n',
        'jmax 1  number of backgrounds\n',
        'kmax *  number of nuisance parameters\n',
        '-------\n',
        f'shapes sig bin1 ~/nobackup/workarea/higgs/sixb_analysis/CMSSW_10_2_18/src/sixb/jupyter/6_background_estimation/mass_info/{rootFile}.root h_sig\n',
        f'shapes bkg bin1 ~/nobackup/workarea/higgs/sixb_analysis/CMSSW_10_2_18/src/sixb/jupyter/6_background_estimation/mass_info/{rootFile}.root h_dat\n',
        f'shapes data_obs bin1 ~/nobackup/workarea/higgs/sixb_analysis/CMSSW_10_2_18/src/sixb/jupyter/6_background_estimation/mass_info/{rootFile}.root h_dat\n',
        '_______\n',
        'bin bin1\n',
        'observation -1\n',
        '-------\n',
        'bin          bin1     bin1\n',
        'process      sig      bkg\n',
        'process      0        1 \n',
        'rate         -1       -1\n',
        '-------\n',
        '\n',
        'lumi   lnN   1.0      -\n',
        'other  lnN   -         1.\n',
    ]
    return dataCardText

parser = argparse.ArgumentParser(description='Build and run data cards for HiggsCombine.')
parser.add_argument('rootFile', 
                    help='which ROOT file to use to build data card')
args = parser.parse_args()

rootFile = args.rootFile

dataCardText = genDataCard(rootFile)

with open(f"sixb/{rootFile}.txt", "w") as f:
    f.writelines(dataCardText)

subprocess.call(["text2workspace.py",f"sixb/{rootFile}.txt"])

# I found this command_list solution for passing a command with multiple arguments and values to the command line via Python
command_list = shlex.split('combine -M AsymptoticLimits --run blind ' + f"sixb/{rootFile}.txt")

output = subprocess.check_output(command_list)
output = output.decode("utf-8").split('\n')

# # Determine which line contains expected 50%
# for i,line in enumerate(output):
#     print(i,line)
# # Turns out to be line 16

mu = float(output[16].split(' ')[-1])
limit = int(mu * xsec)

print(f"Limit for {rootFile} is {limit} fb")