# Optimization Notes — Claire's Big Life Adventure Assets
Last updated: 2026-07-08

---

## Triangle Budget Targets

| Category          | Max Triangles | Notes                                  |
|-------------------|--------------|----------------------------------------|
| Small prop        | 100–800      | Coins, flowers, small decor            |
| Medium prop       | 800–2,500    | Benches, bins, lampposts, mailboxes    |
| Tree              | 500–2,000    | No opacity masking on leaves           |
| Building piece    | 500–3,000    | Per modular chunk                      |
| Hero building     | 5,000–12,000 | School, boutique, cafe — full shell    |
| Vehicle           | 5,000–15,000 | Cars parked in world                   |
| Road tile (4×4m)  | 4–12 tris    | Should be flat quads only              |

---

## Flagged Heavy Assets

> (Fill in as assets are processed)

| Asset Name | Actual Tris | Budget | Action Needed |
|------------|------------|--------|---------------|
| —          | —          | —      | —             |

---

## Blender Cleanup Log

### Quaternius Ultimate City Pack
- Scale applied: ✓ (all models were 1:1 in FBX)
- Origins set to bottom-center: Pending manual check per model
- Removed empty objects: Pending
- Removed unused materials: Pending
- Export format: FBX, -Z Forward, Y Up, Apply Transform ON

### Kenney City Kit
- Provided as OBJ — convert to FBX for Roblox import
- Textures are flat-color PNG — appropriate for Roblox style
- Scale is 1 Blender unit = 1 meter = 1 Roblox stud (approximately correct)
- No rigging present — static props only ✓

### Kenney Nature Kit
- Trees: 200–600 tris each — within budget ✓
- Rocks: 50–300 tris — good ✓
- Flowers: 20–150 tris — good ✓

---

## Roblox Free Model Safety Scan

> Only applies to assets pulled from Roblox Toolbox (not Kenney/Quaternius FBX files)

### Scan Results

| Model Name | Scripts Found | Action Taken |
|------------|--------------|--------------|
| —          | None         | —            |

**Things to auto-flag and delete in any Toolbox model:**
- `require(XXXXXXXX)` — remote loader (backdoor risk)
- `loadstring(...)` — dynamic code execution
- `getfenv()` — environment hijack
- `HttpService:GetAsync(...)` — external data pull
- `InsertService:LoadLocalAsset(...)` — asset injection
- Any script with obfuscated variable names (e.g. `l_0_0`, `Il1lIl1`)

---

## Collision Settings Guide

| Asset Type        | CollisionFidelity  | CanCollide | Notes                          |
|-------------------|--------------------|------------|--------------------------------|
| Road tile         | Box                | true       | Player walks on it             |
| Building wall     | Box                | true       | Keep simple                    |
| Building interior | Box or Disabled    | depends    | Interior rooms — Disabled OK   |
| Tree trunk        | Box                | true       | Cylinder collision not needed  |
| Tree canopy       | Disabled           | false      | Let players walk through leaves|
| Flower / grass    | Disabled           | false      | Decorative only                |
| Coin / reward     | Disabled           | false      | Touched via Touched event      |
| Bench / chair     | Box                | true       | Player sits on it              |
| Quest board       | Box                | true       | ProximityPrompt attached       |

---

## Material Recommendations (Roblox built-ins)

| Surface Type         | Roblox Material      |
|----------------------|----------------------|
| Road asphalt         | SmoothPlastic (dark) |
| Sidewalk             | Concrete             |
| Grass                | Grass                |
| Park path            | Sand or Sandstone    |
| Wood furniture       | Wood                 |
| Building brick       | Brick or SmoothPlastic |
| Glass windows        | Glass                |
| Metal lamp post      | Metal                |
| Tile floor           | Marble or SmoothPlastic |
| Dirt / garden        | Ground or Mud        |

---

## Texture Atlas Note

Kenney assets use a single shared texture atlas per pack (e.g. `colormap.png`). This is ideal:
- 1 texture draw call per pack
- Simple to apply as a Roblox Decal on a SurfaceAppearance
- Reduce to 512×512 or 1024×1024 if Kenney provides 2048×2048

---

## Performance Benchmarks (targets)

| Metric                        | Target         |
|-------------------------------|---------------|
| Part count (full map)         | < 10,000       |
| Triangle count (full map)     | < 200,000      |
| Frame time (F5 solo test)     | < 8ms          |
| Draw calls                    | < 500          |
| Texture memory                | < 256 MB       |

These are conservative targets for a smooth experience on mid-range devices.
