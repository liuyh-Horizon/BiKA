# BiKA: Kolmogorov-Arnold-Network-inspired Ultra Lightweight Neural Network Hardware Accelerator

**Yuhao Liu<sup>1,2,3</sup>, Salim Ullah<sup>1</sup>, Akash Kumar<sup>1</sup>**

<sup>1</sup>Ruhr University Bochum, Germany  
<sup>2</sup>Dresden University of Technology, Germany  
<sup>3</sup>Center for Scalable Data Analytics and Artificial Intelligence (ScaDS.AI Dresden/Leipzig), Germany  

Email: yuhao.liu@rub.de, salim.ullah@rub.de, akash.kumar@rub.de

---

## Overview

**BiKA** is a Kolmogorov-Arnold-Network-inspired ultra-lightweight neural network architecture for hardware-efficient acceleration.

Different from conventional ANN layers that rely on multiplication-and-accumulation operations, BiKA replaces multiplication-based computation with learnable threshold operations. This design enables a multiply-free computation pattern that can be implemented using comparators and accumulators, making BiKA suitable for resource-constrained FPGA and edge devices.

This repository provides a CUDA-based PyTorch training library for BiKA layers, including:

- `BiKA_Linear`
- `BiKA_Conv2d`

The repository also includes clean experiment examples for MNIST, FashionMNIST, and CIFAR-10.

---

## News

- BiKA has been accepted by **ISQED 2026**.
- The paper is currently available on [arXiv](https://arxiv.org/abs/2602.23455) and [IEEE Xplore](https://ieeexplore.ieee.org/document/11534780).
- This repository is under active development. APIs, experiment scripts, and CUDA kernels may still be updated.

---

## Project Status

This project is actively maintained and still evolving.

Current focus:

- Improving the CUDA training efficiency of `BiKA_Conv2d`
- Cleaning and simplifying experiment scripts
- Providing reproducible examples for BiKA MLP-like and CNN-like models
- Preparing a stable release version of the BiKA PyTorch/CUDA library

Please note that the current implementation is mainly intended as a research prototype for evaluating the BiKA computation principle and its hardware-oriented potential.

---

## Repository Structure

```text
BiKA/
├── src/
│   └── bika/
│       ├── __init__.py
│       ├── functional.py
│       ├── BiKA_Linear.py
│       ├── BiKA_Conv2d.py
│       └── csrc/
│           ├── bika_binding.cpp
│           ├── bika_linear.cu
│           └── bika_conv2d.cu
│
├── experiment/
│   └── CNN-like/
│           ├── CIFAR10/
│           └── MNIST/
│   └── MLP-like/
│           ├── MNIST/
│           └── FashionMNIST/
│
├── test/
│   └── ...
│
├── LICENSE
├── README.md
├── pyproject.toml
└── setup.py
```

### Folder Description

| Folder | Description |
| :--- | :--- |
| `src/` | Main source code of the BiKA PyTorch/CUDA library |
| `src/bika/` | Python package for BiKA layers |
| `src/bika/csrc/` | C++/CUDA source files for custom BiKA kernels |
| `experiment/` | Training and evaluation scripts for MNIST, FashionMNIST, and CIFAR-10 |
| `test/` | Minimal tests and usage examples for checking installation and layer behavior |

---

## Installation

### 1. Create a Conda Environment

The recommended environment is:

| Library | Version |
| :--- | :---: |
| Python | 3.9.18 |
| PyTorch | 2.1.0 |

Example:

```bash
conda create -n bika python=3.9 -y
conda activate bika
```

Install PyTorch according to your CUDA version. For example, for CUDA 12.1:

```bash
python -m pip install torch==2.1.0 torchvision==0.16.0 torchaudio==2.1.0 --index-url https://download.pytorch.org/whl/cu121
```

You may also install additional build dependencies:

```bash
python -m pip install numpy tqdm matplotlib packaging
```

### 2. Install BiKA

From the root directory of this repository:

```bash
python -m pip install -e . --no-build-isolation
```

The option `--no-build-isolation` is recommended because the CUDA extension uses PyTorch during compilation.

---

## Quick Test

After installation, test whether the package can be imported:

```bash
python -c "import torch; import bika; print(bika.__version__)"
```

Test `BiKA_Linear` and `BiKA_Conv2d`:

```bash
python - <<'PY'
import torch
from bika import BiKA_Linear, BiKA_Conv2d

print("torch:", torch.__version__)
print("cuda available:", torch.cuda.is_available())

linear = BiKA_Linear(16, 8).cuda()
x = torch.randn(4, 16, device="cuda")
y = linear(x)
print("Linear output:", y.shape)

conv = BiKA_Conv2d(3, 8, kernel_size=3, padding=1).cuda()
x = torch.randn(4, 3, 32, 32, device="cuda")
y = conv(x)
print("Conv output:", y.shape)
PY
```

Expected output shape:

```text
Linear output: torch.Size([4, 8])
Conv output: torch.Size([4, 8, 32, 32])
```

---

## Available BiKA Layers

### `BiKA_Linear`

```python
from bika import BiKA_Linear

layer = BiKA_Linear(
    in_features=784,
    out_features=256
)
```

### `BiKA_Conv2d`

```python
from bika import BiKA_Conv2d

layer = BiKA_Conv2d(
    in_channels=3,
    out_channels=64,
    kernel_size=3,
    stride=1,
    padding=1
)
```

---

## Experiments

### CNN-like Experiments

| Dataset | Model | Description |
| :--- | :--- | :--- |
| CIFAR-10 | CNV | A 9-layer VGG-like small CNN |
| MNIST | TCV | A tiny CNN with 2 convolutional layers and 2 linear layers |

### MLP-like Experiments

| Dataset | Model | Description |
| :--- | :--- | :--- |
| MNIST | SFC | Small fully connected BiKA network |
| MNIST | LFC | Large fully connected BiKA network |
| FashionMNIST | SFC | Small fully connected BiKA network |
| FashionMNIST | LFC | Large fully connected BiKA network |

The experiment scripts are located in:

```text
experiment/
├── CNN-like/
│   ├── CIFAR10/
│   └── MNIST/
└── MLP-like/
│   ├── MNIST/
│   └── FashionMNIST/
```

Please check the corresponding subfolder for dataset-specific training scripts and configuration files.

---

## Notes on Datasets

The repository does not include the raw datasets.

MNIST, FashionMNIST, and CIFAR-10 can be downloaded automatically through `torchvision.datasets` if the corresponding experiment script enables automatic downloading.

If automatic download is disabled, please manually place the datasets according to the path expected by the experiment script.

---

## Citation

If you find this repository useful, please cite our paper:

```bibtex
@INPROCEEDINGS{11534780,
  author={Liu, Yuhao and Ullah, Salim and Kumar, Akash},
  booktitle={2026 27th International Symposium on Quality Electronic Design (ISQED)}, 
  title={BiKA: Kolmogorov-Arnold-Network-inspired Ultra Lightweight Neural Network Hardware Accelerator}, 
  year={2026},
  volume={},
  number={},
  pages={1-9},
  keywords={Modeling;Design methodology;Hardware;Training;Accuracy;Printing;Arrays;Equations;Field programmable gate arrays;Quantization (signal)},
  doi={10.1109/ISQED69900.2026.11534780}}
```

---

## License

This project is released under the license included in this repository.

Please see `LICENSE` for details.
