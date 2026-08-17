# Project roadmap

This document tracks the implementation plan for the N64 AI livestream project.

## Phase 0 — Repository and environment baseline

- [ ] Create public GitHub repository
- [ ] Add README
- [ ] Add .gitignore
- [ ] Record hardware/software environment
- [ ] Protect ROMs, credentials, model weights and recordings
- [ ] Establish clean initial commit

## Phase 1 — AI stylizer proof of concept

- [ ] Install/update NVIDIA driver
- [ ] Install ComfyUI Portable
- [ ] Verify CUDA/GPU operation
- [ ] Verify ComfyUI web interface
- [ ] Configure ComfyUI Manager
- [ ] Evaluate StreamDiffusion-compatible workflow
- [ ] Install ControlNet/Canny dependencies
- [ ] Install fast diffusion model
- [ ] Build image-to-image gameplay workflow
- [ ] Benchmark FPS, latency and visual stability

## Phase 2 — Live video pipeline

- [ ] Capture N64 source
- [ ] Feed capture into AI pipeline
- [ ] Establish real-time output
- [ ] Preserve original audio path
- [ ] Measure end-to-end latency
- [ ] Tune temporal stability
- [ ] Establish raw-video fallback

## Phase 3 — OBS integration

- [ ] Raw capture scene
- [ ] AI stylized scene
- [ ] Emergency scene-switch hotkey
- [ ] Raw audio routing
- [ ] AI video routing
- [ ] Synchronization testing

## Phase 4 — Facebook Live validation

- [ ] Configure RTMPS output
- [ ] Begin at 1280×720 / 30 FPS
- [ ] Stress-test continuously
- [ ] Monitor dropped frames
- [ ] Monitor GPU utilization
- [ ] Monitor AI latency
- [ ] Evaluate 1920×1080 after stability is proven

## Notes

- Keep the raw capture path available as a fail-safe during testing.
- Record latency, FPS, and GPU metrics at each phase boundary.
- Prefer a deterministic, reproducible environment over ad hoc setup.
