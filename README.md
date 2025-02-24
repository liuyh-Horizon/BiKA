# BiKA: A Prototype of *Bi*narized *K*olmogorov-*A*rnold Networks [![DOI](https://zenodo.org/badge/833847910.svg)](https://doi.org/10.5281/zenodo.14915114)


**Yuhao Liu$<sup>1,3</sup>, Salim Ullah<sup>2</sup>, Akash Kumar<sup>2,3</sup>**

<sup>1</sup>Dresden University of Technology, Germany; <sup>2</sup>Ruhr University Bochum, Germany; <sip>3</sup>Center for Scalable Data Analytics and Artificial Intelligence (ScaDS.AI Dresden/Leipzig), Germany

Email: yuhao.liu1@tu-dresden.de, salim.ullah@rub.de, akash.kumar@rub.de


***This repository is prepared for artifact evaluation of FCCM 2025. We trained the four BiKA modes based on Pytorch from scratch and the corresponding BNN, QNN, and KAN models for comparison. Our current code for BiKA training has a shortcoming of low speed and huge GPU memory consumption. In our future works, we will rebuild this repository based on CUDA and C++ to speed up the training and improve the inference accuracy.***

## Abstract
Lightweight neural network accelerator for edge devices is an emerging topic in recent research.  Previous works widely explored different schemes, such as quantization and approximation, to reduce hardware resource consumption in accelerator designs. *Kolmogorov-Arnold Network* (KAN) is a recently proposed neural network that can potentially transform the paradigm of neural network design by replacing the multiplication and activation functions with learnable nonlinear functions. However, for hardware accelerator designs, learnable non-linear functions are costly in hardware, such as FPGA. Inspired by KAN and *Binarized Neural Networks* (BNN), we propose a novel neural network, BiKA, with learnable thresholds, which highly simplifies the design of accelerator designs as a series of comparators and accumulators. We present this network on *Ultra96* FPGA, and the results show that our accelerator has reduced hardware resource consumption by more than **27.73%-51.54%** compared to binarized and quantized neural network accelerators with **8.14%-19.77%** and **8.64%-23.20%** accuracy loss.

## Experiment Environment
| Library | Version |
| :--- | :---: |
| ***Python*** | 3.9.18 |
| ***PyTorch*** | 2.1.0 |
| ***pykan*** | 0.2.8 |
| ***Brevitas*** | 0.11.0 |
| ***JupyterLab*** | 4.3.5 |

