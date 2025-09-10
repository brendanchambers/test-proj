
# sudo snap install --classic astral-uv
# uv init

git clone https://github.com/brendanchambers/test-proj.git
cd test-proj

uv venv test-env
source .venv/bin/activate

uv pip install torch

git clone https://github.com/state-spaces/mamba.git
uv pip install mamba/.



