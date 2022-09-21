This shows how to run a Jupyter Notebook in noninteractive with a SLURM
script.

This assumes that you have a conda environment called `myenv` and that
you have installed the `ipykernel` module. Those are the steps to
install `ipykernal` in your environmnent. You should repace `myenv` by
your actual environment name.

``` {.example}
conda activate myenv
conda install ipykernel
python -m ipykernel install --user --name myenv  --display-name "myenv"
```

In this example, we use
[nbconvert](https://nbconvert.readthedocs.io/en/latest/usage.html#convert-notebook)
to run in a noninteractive way. This command:

``` {.example}
jupyter nbconvert --to notebook --execute my-notebook.ipynb
```

will run `my-notebook.ipynb` and create a new notebook called
`my-notebook.nbconvert.ipynb` that will contain the output cells.
Specifying `--inplace` will overwrite the input file instead of writing
a new file.

To submit your job through the slurm scheduler, you need to create a
submission script. This repo contains an example called `submit.sh`. You
will need to modify it to suit your needs. I recommend that the first
time you try this workflow, you keep the run time low (like the 10 min
in the example) so that you don\'t spend too much time waiting in the
queue while you are debugging the process. There is more documentation
on slurm on the Research Computing web site:
<https://researchcomputing.princeton.edu/support/knowledge-base/slurm>

Once you have tailored your slurm script to your needs, you submit it to
the queue with:

``` {.example}
sbatch submit.sh
```
