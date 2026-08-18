# ComfyUI Compatibility Matrix

| Test | Torch | Torchvision | Torchaudio | CUDA | comfy-kitchen | GPU Detected | ComfyUI UI | Result |
|---|---|---|---|---|---|---|---|---|
| Current baseline | 2.4.1+cu121 | 0.19.1+cu121 | 2.4.1+cu121 | 12.1 | 0.2.20 | Yes | No | Fails on missing `int8_attention_is_available` |

## Current Best Partial Baseline

The current best-known runtime combination is:

- `torch==2.4.1+cu121`
- `torchvision==0.19.1+cu121`
- `torchaudio==2.4.1+cu121`
- `comfy-kitchen==0.2.20`

This combination successfully verifies CUDA and detects the NVIDIA GeForce RTX 3070 Ti, but it is not yet a complete working ComfyUI environment.
