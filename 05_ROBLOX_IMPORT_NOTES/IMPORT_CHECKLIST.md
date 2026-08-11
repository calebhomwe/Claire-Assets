# Roblox Studio Import Checklist — Claire's Big Life Adventure
Last updated: 2026-07-08

---

## Pre-Import Checklist

- [ ] Roblox Studio is open with the Claire project loaded
- [ ] `build/claire.rbxlx` has been rebuilt via `rojo build -o build/claire.rbxlx`
- [ ] All assets in `03_ROBLOX_READY/` have been Blender-cleaned (scale applied, origin set, FBX exported)
- [ ] License log reviewed — no unclear-license assets in ROBLOX_READY folder

---

## Phase 1 — Import Flow (per asset batch)

1. Open Roblox Studio → `File > Open` → load `claire.rbxlx`
2. Open **Asset Manager** panel (`View > Asset Manager`)
3. Click **Bulk Import** button in Asset Manager
4. Navigate to `03_ROBLOX_READY/` and select the relevant subfolder
5. Select all `.fbx` or `.glb` files in that subfolder
6. Click **Open** — Roblox will upload and process each mesh
7. Wait for all uploads to complete (green checkmarks)
8. Assets now appear in Asset Manager under **Meshes**

---

## Phase 2 — Organize in Explorer

After import, drag meshes from Asset Manager into the hierarchy:

```
ReplicatedStorage
  Assets
    Buildings     ← hero buildings, house shells
    Nature        ← trees, bushes, rocks, flowers
    Roads         ← road tiles, sidewalk tiles, paths
    Props         ← all prop sub-categories
      Bedroom
      School
      Boutique
      Cafe
      Tycoon
      Rewards
      Quest
    Pets          ← pet companion props
    UI            ← decals, icon images
    Materials     ← SurfaceAppearance textures

ServerStorage
  RawImportedAssets_Backup   ← keep originals before editing

Workspace
  World
    Ground        ← baseplate, terrain tiles
    Roads         ← placed road mesh instances
    Buildings     ← placed building instances
    Nature        ← trees, foliage instances
    Props         ← interactive and decorative props
    Interactables ← ProximityPrompts, doors, pickups
    NPCs          ← NPC models
```

---

## Phase 3 — Per-Asset Checks

For **every imported mesh**:

- [ ] Scale correct (player character is ~5 studs tall — use as reference)
- [ ] Collision set correctly (Box for buildings, Precise only for hero props)
- [ ] Material applied (prefer Roblox built-in materials over blank SmoothPlastic)
- [ ] SurfaceAppearance only where textures are needed (not every prop)
- [ ] No scripts attached (right-click → Explore tree → verify no Script/LocalScript/ModuleScript)
- [ ] Origin at bottom-center for buildings; center for small props
- [ ] Named clearly (e.g. `Tree_Round_01`, `Road_Straight_01`, `House_Perth_01`)

---

## Phase 4 — Safety Script Scan

After importing **any** free model from Roblox Toolbox (not needed for Kenney/Quaternius FBX):

1. Select the model in Explorer
2. Right-click → **Expand All**
3. Look for any:
   - `Script`
   - `LocalScript`
   - `ModuleScript`
   - `RemoteFunction` / `RemoteEvent`
4. Open any script found — read it
5. If it contains `require()`, `loadstring()`, `getfenv()`, `HttpService`, or obfuscated code → **DELETE IT**
6. Document in `OPTIMIZATION_NOTES.md` under "Safety Scan"

---

## Phase 5 — Performance Test

1. Press **F5** to Play
2. Open **Micro Profiler** (`Ctrl+F6`)
3. Target: < 5ms frame time with all world props placed
4. Check triangle count per model: `right-click → Properties → TriangleCount`
5. Flag anything over budget in `OPTIMIZATION_NOTES.md`

---

## Import Priority Order

### First batch (biggest visual impact):
```
03_ROBLOX_READY/Roads_Paths/Roads/
03_ROBLOX_READY/Roads_Paths/Sidewalks/
03_ROBLOX_READY/Nature/Trees/
03_ROBLOX_READY/Nature/Bushes/
03_ROBLOX_READY/Nature/Flowers/
03_ROBLOX_READY/Props/Quest/      ← quest board, signs
03_ROBLOX_READY/Props/Rewards/    ← coins, gift boxes
```

### Second batch (world identity):
```
03_ROBLOX_READY/Buildings/Houses/
03_ROBLOX_READY/Buildings/School/
03_ROBLOX_READY/Buildings/Boutique/
03_ROBLOX_READY/Buildings/Cafe/
03_ROBLOX_READY/Props/Bedroom/
03_ROBLOX_READY/Props/Cafe/
03_ROBLOX_READY/Pets/
```

### Third batch (big world):
```
03_ROBLOX_READY/Buildings/Modular/
03_ROBLOX_READY/Roads_Paths/Paths/
03_ROBLOX_READY/Roads_Paths/Tiles/
03_ROBLOX_READY/UI/Icons/
03_ROBLOX_READY/UI/Badges/
```

---

## After Everything Is Imported

- [ ] Rebuild via `rojo build -o build/claire.rbxlx` and verify it still compiles
- [ ] Add asset IDs to `src/shared/AssetRegistry.luau` (create this file if not present)
- [ ] Test on a live Roblox server (publish to Roblox → test in client)
- [ ] Screenshot each zone for progress log
