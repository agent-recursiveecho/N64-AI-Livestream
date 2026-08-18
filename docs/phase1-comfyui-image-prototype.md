# Phase 1 - ComfyUI Image Prototype

Branch: phase1-comfyui-prototype
Date: 2026-08-17

## Objective

Prove that ComfyUI can take a still Nintendo 64 gameplay frame, preserve important scene structure through edge guidance, and generate a stylized image before moving to live video processing.

## Recommended Workflow

1. Open the ComfyUI UI at http://127.0.0.1:8188
2. Open ComfyUI Manager
3. Install only the essential components:
   - ComfyUI Manager
   - ControlNet support
   - Canny / edge preprocessors
4. Download one lightweight checkpoint:
   - SD 1.5 is the initial baseline choice
   - Keep the model small and fast for testing
5. Build the smallest practical test graph.

## Initial Graph Concept

- Load Image
- Canny / Edge Detection
- ControlNet guidance
- KSampler
- VAE Decode
- Save Image

Additional model-loading, conditioning, latent encoding, or VAE nodes may be required by the final functional workflow.

## Starting Settings

- Resolution: 512x512
- Steps: 10-20
- CFG: 4-8
- Sampler: euler or dpm_2
- Batch size: 1
- Seed: fixed for comparison testing

## Test Sequence

### Test 1 - Basic Inference

Goal: Confirm that the checkpoint loads and ComfyUI can generate and save an image.

### Test 2 - Canny Preprocessing

Goal: Confirm that important gameplay geometry, characters, HUD elements, and scene boundaries remain recognizable in the edge representation.

### Test 3 - Edge-Guided Stylization

Goal: Generate the first structure-preserving stylized N64 gameplay frame using Canny / ControlNet guidance.

### Test 4 - Repeatability

Run the same input image repeatedly using the same:

- Seed
- Prompt
- Checkpoint
- Sampler
- Steps
- CFG
- Denoise

Goal: Verify deterministic or sufficiently repeatable behavior.

### Test 5 - Controlled Variation

Change only one parameter at a time.

Goal: Determine which settings materially affect appearance, performance, and structural fidelity.

## Test Record Template

- Input image:
- Resolution: 512x512
- Checkpoint:
- ControlNet model:
- Preprocessor:
- Positive prompt:
- Negative prompt:
- Sampler:
- Steps:
- CFG:
- Seed:
- Denoise:
- Generation time:
- VRAM usage:
- Output file:
- Result:
- Notes:

## Phase 1 Acceptance Criteria

- [ ] ComfyUI launches reliably
- [ ] SD checkpoint loads successfully
- [ ] Test screenshot loads
- [ ] Canny preprocessing works
- [ ] ControlNet influences generation
- [ ] Stylized image successfully saves
- [ ] RTX 3070 Ti completes inference without VRAM failure
- [ ] Generation time is recorded
- [ ] Fixed-seed generation is repeatable
- [ ] HUD and gameplay geometry remain sufficiently recognizable

## Next Milestone

After the first successful image-generation test, preserve the exact ComfyUI workflow JSON, model names, generation settings, performance measurements, and representative test results in the repository.

## Checkpoint Safety and Validation Process

### Step 1 - Candidate selection

Selected candidate:

- Model file: v1-5-pruned-emaonly-fp16.safetensors
- Architecture: Stable Diffusion 1.5
- Precision: FP16
- Format: safetensors
- Intended use: Phase 1 still-image generation prototype

Selection criteria:

- Safetensors format is preferred over pickle-based checkpoint formats.
- The model must be compatible with the current Stable Diffusion 1.5 workflow.
- The model should be small enough for practical testing on the RTX 3070 Ti.
- The source must be verified before download.
- SHA-256 will be recorded after download.

Status: Candidate selected. Source verification pending.

### Step 2 - Source and file verification

Selected checkpoint:

- Model file: v1-5-pruned-emaonly-fp16.safetensors
- Size in bytes: 2132696762
- SHA-256: E9476A13728CD75D8279F6EC8BAD753A66A1957CA375A1464DC63B37DB6E3916
- Status: Downloaded and verified

Checkpoint location:

C:\Users\Living Room\workspace\N64-AI-Livestream\comfyui-portable\ComfyUI\models\checkpoints

Result:

The checkpoint file is present in the expected directory and the computed SHA-256 matches the expected value.

Next action:

Refresh or restart ComfyUI, select v1-5-pruned-emaonly-fp16.safetensors in the Load Checkpoint node, and rerun the initial 512 x 512 text-to-image test.

## Future Model Verification Enhancements

The current model verification script successfully checks a downloaded file against a user-supplied SHA-256 value.

Future revisions should expand the script into a broader model intake and validation tool.

Planned enhancements:

- Validate allowed model file extensions, with safetensors preferred where available
- Verify SHA-256
- Verify expected file size when a trusted size is available
- Detect duplicate model files
- Record the original source URL
- Record the model filename
- Record the model type, such as checkpoint, LoRA, VAE, or ControlNet
- Validate that the selected destination matches the intended ComfyUI model category
- Record verification timestamps
- Create a persistent verification log
- Optionally export verification records in JSON or CSV format
- Inspect safetensors metadata where useful
- Detect suspicious executable, archive, or unsupported file types
- Prevent or warn against use of a model when integrity verification fails

Development priority:

Do not expand this script during the current Phase 1 image-generation proof of concept unless a new model requires additional validation. Return to these enhancements after the basic ComfyUI image pipeline is proven.
