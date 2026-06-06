import torch

try:
    from . import _C
except ImportError as e:
    raise ImportError(
        "BiKA CUDA extension cannot be loaded.\n\n"
        "This usually means one of the following:\n"
        "1. PyTorch was not imported before loading the CUDA extension.\n"
        "2. The extension was compiled in a different Python/conda environment.\n"
        "3. PyTorch dynamic libraries, such as libc10.so, cannot be found.\n\n"
        "Please try:\n"
        "    python -c \"import torch; import bika; print(bika.__version__)\"\n\n"
        "If it still fails, reinstall from the project root with:\n"
        "    pip install -e . --no-build-isolation\n"
    ) from e


from .functional import bika_linear, bika_conv2d
from .BiKA_Linear import BiKA_Linear
from .BiKA_Conv2d import BiKA_Conv2d


__version__ = "0.1.6"


__all__ = [
    "bika_linear",
    "bika_conv2d",
    "BiKA_Linear",
    "BiKA_Conv2d",
]
