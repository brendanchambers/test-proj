
# sudo snap install --classic astral-uv
# uv init

git clone https://github.com/brendanchambers/test-proj.git  # I don't love this auth step, is there a better way?
cd test-proj

uv venv
source .venv/bin/activate

# uv pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu124
# uv add torch torchvision torchaudio
uv pip install torch --index-url https://download.pytorch.org/whl/cu124
uv add torch
# more info and potentially clean approach:
    # https://docs.astral.sh/uv/guides/integration/pytorch/#installing-pytorch


git clone https://github.com/state-spaces/mamba.git
uv pip install mamba/.

# scripts/test_mamba_installation.sh


git clone https://github.com/goombalab/hnet
uv pip install -e hnet/.  # initially failed
#  Failed to build `flash-attn==2.8.0.post2`
# to resolve I tried to add
#   [tool.uv.extra-build-dependencies]
#   causal-conv1d = ["torch"]
#   flash-attn = ["psutil"]
# to pyproject.toml
uv pip install -e hnet/. --no-build-isolation
uv add omegaconf