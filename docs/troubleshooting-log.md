# ComfyUI Troubleshooting Log

## 2026-08-17

### Objective

Establish a ComfyUI runtime compatible with the NVIDIA GeForce RTX 3070 Ti.

### Verified

- CUDA available: `True`
- GPU detected: `NVIDIA GeForce RTX 3070 Ti`

### Runtime tested

- `torch 2.4.1+cu121`
- `torchvision 0.19.1+cu121`
- `torchaudio 2.4.1+cu121`
- `comfy-kitchen 0.2.20`

### Result

ComfyUI startup progressed farther than previous attempts but stopped before the browser UI became available.

### Failure

`AttributeError: module 'comfy_kitchen' has no attribute 'int8_attention_is_available'`

### Interpretation

The GPU/CUDA layer appears healthy. The remaining blocker is a dependency API mismatch between the installed `comfy-kitchen` package and the current ComfyUI source tree.

### Next investigation

Determine which of the following must be aligned:

1. ComfyUI source revision
2. `comfy-kitchen` version
3. Other ComfyUI dependency versions

Do not treat the current package set as a complete production baseline until the browser UI successfully launches.

### Checkpoint discovery issue

The Load Checkpoint node initially displayed v1-5-pruned-emaonly.ckpt.

After attempting to queue the workflow and then interacting with the Load Checkpoint node, the checkpoint field changed to undefined.

The portable checkpoint directory was inspected at:

C:\Users\Living Room\workspace\N64-AI-Livestream\comfyui-portable\ComfyUI\models\checkpoints

The directory contained only:

- put_checkpoints_here

No Stable Diffusion checkpoint was physically installed in the portable ComfyUI checkpoint directory.

### Root cause

The workflow referenced v1-5-pruned-emaonly.ckpt, but that model file was not present in the portable installation.

After the checkpoint selector refreshed, ComfyUI had no valid checkpoint available and therefore displayed undefined.

### Next action

Install one compatible Stable Diffusion 1.5 checkpoint in:

C:\Users\Living Room\workspace\N64-AI-Livestream\comfyui-portable\ComfyUI\models\checkpoints

Then refresh or restart ComfyUI and verify that the checkpoint appears in the Load Checkpoint selector before changing any other workflow nodes.
