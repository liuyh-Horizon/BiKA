from setuptools import setup, find_packages
from torch.utils.cpp_extension import BuildExtension, CUDAExtension


setup(
    name="bika",
    version="0.1.6",
    description="BiKA layers: Binarized KAN with CUDA kernels",

    package_dir={"": "src"},
    packages=find_packages(where="src"),

    ext_modules=[
        CUDAExtension(
            name="bika._C",
            sources=[
                "src/bika/csrc/bika_binding.cpp",
                "src/bika/csrc/bika_linear.cu",
                "src/bika/csrc/bika_conv2d.cu",
            ],
            extra_compile_args={
                "cxx": ["-O3"],
                "nvcc": ["-O3", "-lineinfo"],
            },
        )
    ],

    cmdclass={
        "build_ext": BuildExtension
    },

    zip_safe=False,
)