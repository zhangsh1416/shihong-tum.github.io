# Image Verification Checklist

## MANDATORY Steps for Every Blog Post with Images

### 1. Find Images in Source
- Look for diagrams, charts, screenshots in the original content
- Note image filenames and paths mentioned in the source

### 2. CRITICAL: Verify URLs Before Use
**ALWAYS test image URLs using WebFetch tool:**
```
WebFetch(url="full-image-url", prompt="Check if this image is accessible")
```

### 3. Common URL Issues to Watch For
- **Relative paths**: `./images/diagram.png` needs full domain: `https://site.com/images/diagram.png`
- **Wrong static paths**: `/static/images/` vs `/files/` vs `/assets/`
- **Moved or corrupted files**: Some images may not exist anymore

### 4. Verification Process
1. Use WebFetch to test each image URL
2. If image fails: Look for alternative images in the same source
3. If no images work: Proceed with text-only format
4. NEVER include unverified image URLs

### 5. Recent Fixes Made
- **ReAct post**: Fixed `/static/images/react_main.png` → `/files/diagram.png`
- **Why We Think post**: Replaced corrupted `parallel-vs-sequential.png` → `cot-wei22.png`

### 6. Testing Examples
✅ **Good**: `https://react-lm.github.io/files/diagram.png` (verified working)
❌ **Bad**: `https://react-lm.github.io/static/images/react_main.png` (wrong path)
❌ **Bad**: `https://lilianweng.github.io/posts/2025-05-01-thinking/parallel-vs-sequential.png` (corrupted)

## Result: No More Broken Images! 🎯