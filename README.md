# N64 AI Livestream

A project to build a real-time AI stylized livestream pipeline for Nintendo 64 gameplay, combining live capture, diffusion-based image processing, and OBS/RTMPS streaming.

## Project goal

This repository tracks the build from proof-of-concept AI stylization through live N64 capture, OBS integration, and Facebook Live validation. The implementation is intentionally scoped around latency, visual stability, and stream reliability.

## Repository status

This repository is the working baseline for the project. The roadmap is organized into the following phases:

- Phase 0: Repository and environment baseline
- Phase 1: AI stylizer proof of concept
- Phase 2: Live video pipeline
- Phase 3: OBS integration
- Phase 4: Facebook Live validation

## Security and asset protection

The project must not commit or publish the following without explicit approval and secure storage controls:

- N64 ROMs
- Console/game save files
- Streaming credentials and tokens
- Model weights and checkpoints
- Recorded footage and raw captures
- API keys or secrets

Any sensitive assets should be kept outside the repository, ideally on encrypted local storage or a private artifact store.

## Repository structure

```text
.
├── README.md
├── .gitignore
├── docs/
│   ├── roadmap.md
│   └── environment-baseline.md
├── scripts/
│   └── .gitkeep
└── src/
    └── .gitkeep
```

## Phase roadmap

### Phase 0 — Repository and environment baseline

- Create public GitHub repository
- Add README
- Add .gitignore
- Record hardware/software environment
- Protect ROMs, credentials, model weights and recordings
- Establish clean initial commit

### Phase 1 — AI stylizer proof of concept

- Install/update NVIDIA driver
- Install ComfyUI Portable
- Verify CUDA/GPU operation
- Verify ComfyUI web interface
- Configure ComfyUI Manager
- Evaluate StreamDiffusion-compatible workflow
- Install ControlNet/Canny dependencies
- Install fast diffusion model
- Build image-to-image gameplay workflow
- Benchmark FPS, latency and visual stability

### Phase 2 — Live video pipeline

- Capture N64 source
- Feed capture into AI pipeline
- Establish real-time output
- Preserve original audio path
- Measure end-to-end latency
- Tune temporal stability
- Establish raw-video fallback

### Phase 3 — OBS integration

- Raw capture scene
- AI stylized scene
- Emergency scene-switch hotkey
- Raw audio routing
- AI video routing
- Synchronization testing

### Phase 4 — Facebook Live validation

- Configure RTMPS output
- Begin at 1280×720 / 30 FPS
- Stress-test continuously
- Monitor dropped frames
- Monitor GPU utilization
- Monitor AI latency
- Evaluate 1920×1080 after stability is proven

## Environment baseline checklist

The project should maintain a record of values such as:

- Operating system and version
- GPU model and driver version
- CUDA version
- Python version
- OBS version
- ComfyUI version
- Capture device details
- Streaming encoder settings

Use the environment baseline notes in the docs directory to record the current machine setup.

## Development principles

- Prefer low-latency processing and clear failure fallback modes.
- Keep the raw source pipeline intact for emergency handoff.
- Protect credentials and media assets from accidental publication.
- Benchmark before and after each major performance change.
- Keep the project reproducible by documenting the software stack.

## Next step

Begin with the environment and repository baseline in the docs directory, then proceed to the GPU and ComfyUI validation work from Phase 1.
