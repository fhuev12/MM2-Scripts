# MM2-Scripts

Murder Mystery 2 automation script, protected build.

## Usage

```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/fhuev12/MM2-Scripts/main/MM2_MurderMystery2_v1.lua"))()
```

Requirements: an executor that provides `game:HttpGet` and `loadstring` (bit32 is standard in Roblox Luau).

## Build

- source: `（推荐！）Murder Mystery 2 Script 破坏者谜团2.lua` (60,909 bytes, SHA-256 `9af49823d370d498f61ca8c53367635d983cfdb97ac311bfb4ee8e9044515392`)
- pipeline: LZSS compress -> 4-byte length header -> XOR (28-char key) -> Base64 -> 3 shards
- compressed: 11,005 bytes (18.1%), base64 payload 14,680 chars, loader 3,365 bytes
- verified: shards pulled from raw.githubusercontent.com decode back to 60,909 bytes with an identical SHA-256

## Layout

```
MM2_MurderMystery2_v1.lua   loader
parts/MM2_MurderMystery2_v1.p1.txt ... p3.txt
```

The loader fetches all shards, strips whitespace, base64-decodes, XOR-decrypts, LZSS-decompresses, verifies the declared length, then runs the payload. Any missing or tampered shard, or a wrong key, aborts before execution.

## Warning

This script acts client-side against a live Roblox game. It violates the Roblox Terms of Service and can get the account banned. Use only for your own private testing.
