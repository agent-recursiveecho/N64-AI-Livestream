# Environment baseline

Record the exact machine and software configuration used to build the live AI stylization pipeline.

## Hardware

- CPU:
- GPU:
- GPU driver version:
- VRAM:
- Motherboard / chipset:
- RAM:
- Storage:
- Capture device:
- Audio interface / output:
- Streaming encoder / hardware notes:

## Operating system

- OS:
- Version:
- Build:
- Windows install type:

## Software stack

- NVIDIA driver:
- CUDA version:
- Python version:
- ComfyUI version:
- OBS Studio version:
- FFmpeg version:
- StreamDiffusion or related plugin versions:
- ControlNet / Canny dependencies:
- Diffusion model name and version:

## Security and sensitivity checklist

- [ ] ROMs are stored outside the repository
- [ ] Credentials are stored outside the repository
- [ ] Model weights are stored outside the repository
- [ ] Recordings are stored outside the repository
- [ ] No live secrets are committed to the repo

## Baseline notes

Use this space to record the first successful GPU verification and pipeline milestones.

- Initial GPU verification:
- ComfyUI web check:
- First stable workflow FPS:
- First end-to-end latency measurement:
- First recorded OBS switch test:

## Verified ComfyUI GPU Runtime - 2026-08-17

### GPU / CUDA verification

- GPU: NVIDIA GeForce RTX 3070 Ti
- `torch.cuda.is_available()`: `True`
- CUDA device detected: `NVIDIA GeForce RTX 3070 Ti`
- Driver: `610.88`
- PyTorch CUDA build: `2.4.1+cu121`

### Working setup path

The following setup path was verified successfully and is now the project baseline:

- ComfyUI Portable installed in the project workspace
- Portable runtime launched from:
  `C:\Users\Living Room\workspace\N64-AI-Livestream\comfyui-portable`
- Launch command:
  `.
  \python_embeded\python.exe -s ComfyUI\main.py --windows-standalone-build`
- Browser UI status: reachable at `http://127.0.0.1:8188`

### Verified working

- NVIDIA GPU detection
- CUDA availability
- PyTorch CUDA runtime
- RTX 3070 Ti recognized by PyTorch
- ComfyUI Portable startup
- ComfyUI browser interface loads

### Current project status

This is the working baseline for Phase 1 progression.

Next priority items:

- Configure ComfyUI Manager
- Install a small, fast model
- Validate a lightweight image-to-image workflow
- Benchmark FPS and latency
- Move toward a gameplay capture pipeline

### Not yet verified

- Full model inference under a project workflow
- StreamDiffusion workflow
- ControlNet / Canny gameplay workflow
- Live video pipeline
- OBS integration
- Facebook Live validation

