# uv run python mamba/benchmarks/benchmark_generation_mamba_simple.py
source .venv/bin/activate

# test mamba 1:  model download of 2.8b ~5min
if false; then
    python mamba/benchmarks/benchmark_generation_mamba_simple.py --model-name "state-spaces/mamba-2.8b" --prompt "My locally recognized deity wrote all this CUDA code for a new language model and" --topp 0.9 --temperature 0.7 --repetition-penalty 1.2
fi
# initially failing during generation:
    #  /tmp/tmpscgnwecz/cuda_utils.c:5:10: fatal error: Python.h: No such file or directory
    #   resolved with `sudo apt-get install python3-dev`
# succeeded


# test mamba 2:
python mamba/benchmarks/benchmark_generation_mamba_simple.py --model-name "state-spaces/mamba-130m" --prompt "My locally recognized deity wrote all this CUDA code for a new language model and" --topp 0.9 --temperature 0.7 --repetition-penalty 1.2
# succeeds


# test mamba 2 via hf:  
if false; then
    python mamba/benchmarks/benchmark_generation_mamba_simple.py --model-name "state-spaces/mamba-130m-hf" --prompt "My cat wrote all this CUDA code for a new language model and" --topp 0.9 --temperature 0.7 --repetition-penalty 1.2
fi
#  fails, looks like configuration issues in the hf repository maybe (https://github.com/state-spaces/mamba/issues/752)


