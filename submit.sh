#! /bin/bash
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -t 00:10:00              # this is for 10 min
#SBATCH --mail-type=begin        # send email when job begins
#SBATCH --mail-type=end          # send email when job ends
#SBATCH --mail-user=<YourNetID>@princeton.edu
#SBATCH --gres=gpu:1             # number of gpus per node - DELETE THIS IF YOU DON'T NEED GPUs.

module purge
module load anaconda3
conda activate myenv

jupyter nbconvert --to notebook --execute my-notebook.ipynb
