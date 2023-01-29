# downward-hffpi

## Installation

1. Clone recursively
```console
git clone --recursively <link_to_repo>
```
2. Create python3 virtual environment
```console
python3 -m venv --prompt hffpi .venv
```
3. Activate virtual environment
```console
source .venv/bin/activate
```
4. Install python packages (needed for experimental code)
```console
pip install -r requirements.txt
```
5. Install planner
```console
./planner/downward/build.py
```

## How to run the planner

See `experiments/experiment-hffpi.py` on example callstrings.

## How to run the experiments

```console
cd experiments
./experiment-hffpi.py --all
```
