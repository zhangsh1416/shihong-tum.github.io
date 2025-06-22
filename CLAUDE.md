# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a Jekyll-based personal blog focusing on AI, technology, and software development content. The blog is deployed on GitHub Pages and features content analysis including video summaries, research paper analyses, and technical insights.

**Owner:** Shihong (sh.zhang@tum.de)
**GitHub:** zhangsh1416/shihong-tum.github.io
**Live Site:** https://zhangsh1416.github.io/shihong-tum.github.io/

## Development Commands

### Local Development
```bash
# Start development server (recommended)
./blog-serve.sh serve

# Alternative method with manual PATH setting
export PATH="$PATH:/home/shihong/snap/code/194/.local/share/gem/ruby/3.0.0/bin"
bundle exec jekyll serve --host=0.0.0.0 --port=4000

# Build site only
./blog-serve.sh build
# OR: bundle exec jekyll build

# Stop development server
./blog-serve.sh stop
```

### Dependency Management
```bash
# Install dependencies
bundle install

# Update GitHub Pages compatible gems
bundle update github-pages
```

### Content Creation
```bash
# Blog posts must be in _posts/ with format: YYYY-MM-DD-title.markdown
# Include required front matter:
---
layout: post
title: "Post Title"
date: YYYY-MM-DD HH:MM:SS +0200
categories: [category1, category2]
tags: [tag1, tag2, tag3]
---
```

## Architecture & Content Strategy

### Content Types & Patterns
The blog follows specific content categorization:

1. **Video Analysis** (`video-analysis` category)
   - YouTube video summaries and insights
   - Include source, duration, speaker info
   - Structured analysis with key takeaways

2. **Paper Summaries** (`paper-summary` category)  
   - Research paper analysis and insights
   - Include arXiv/paper links, authors, methodology
   - Technical findings and implications

3. **Research Summaries** (`research-summary` category)
   - Industry research and findings analysis
   - AI safety, alignment, and technical developments

### Content Creation Workflow
The repository includes infrastructure for content creation from external sources:

- **Audio Transcription**: Fast-Whisper MCP server setup in `temp/Fast-Whisper-MCP-Server/`
- **Video Processing**: yt-dlp integration for YouTube content extraction
- **Content Analysis**: Web scraping and analysis tools for research papers/articles

### GitHub Pages Configuration

**Critical Configuration Details:**
- Uses `github-pages` gem (not individual Jekyll gems)
- Theme: minima 2.5
- Plugins: jekyll-feed, jekyll-sitemap, jekyll-seo-tag
- **Important:** Site uses custom baseurl `/shihong-tum.github.io` 

**Configuration Restart Required:**
When modifying `_config.yml`, the development server must be restarted due to Jekyll's behavior.

### Content Guidelines

**Front Matter Standards:**
- Date format: `YYYY-MM-DD HH:MM:SS +0200`
- Categories: Use kebab-case, reflect content type
- Tags: Specific topics, technologies, names
- Layout: Always use `post` for blog content

**Content Style:**
- **No emojis** in blog content (established preference)
- Include source links and metadata for external content
- Structure with clear headings and sections
- Add personal analysis and insights sections

### MCP Server Integration

The blog includes MCP (Model Context Protocol) servers for content generation:

**YouTube Transcript Server:**
- Installed: `@kimtaeyoon83/mcp-server-youtube-transcript`
- Purpose: Extract video transcripts for analysis

**Fast-Whisper Transcription:**
- Local server in `temp/Fast-Whisper-MCP-Server/`
- Handles audio-to-text conversion for videos without captions
- Dependencies: faster-whisper, torch, mcp[cli]

**Content Fetch Server:**
- Web content analysis and extraction
- Research paper and article processing

### File Structure Understanding

```
├── _posts/                 # Blog content (date-prefixed .markdown files)
├── _config.yml            # Jekyll configuration (restart required on changes)
├── Gemfile                # GitHub Pages compatible dependencies  
├── about.markdown         # About page content
├── archive.markdown       # Posts archive page
├── blog-serve.sh         # Development helper script
├── temp/                 # Temporary files for content creation (gitignored)
│   ├── audio files       # Downloaded for transcription
│   └── MCP servers       # Content analysis tools
└── _site/                # Generated site (gitignored)
```

### Deployment & GitHub Integration

**Automatic Deployment:**
- Pushes to `main` branch trigger GitHub Pages rebuild
- Uses GitHub Pages environment with restricted plugin set
- Build time: ~5-10 minutes after push

**GitHub Settings:**
- Repository: Public (required for GitHub Pages)
- Pages source: Deploy from branch `main` / root
- Custom domain: Not configured (uses github.io subdomain)

### PATH Configuration

Local development requires specific PATH configuration for Jekyll/Ruby gems:
```bash
export PATH="$PATH:/home/shihong/snap/code/194/.local/share/gem/ruby/3.0.0/bin"
```
This is handled automatically by `blog-serve.sh` script.

### Content Creation from External Sources

When creating content from videos/papers/articles:
1. Use MCP servers to extract/transcribe content
2. Follow established content templates and structure
3. Include proper attribution and source links
4. Add personal analysis and insights
5. Ensure front matter follows established patterns
6. No emojis in final content

## Mandatory Workflow Rules

### 1. Git Repository Updates
**ALWAYS** update the git remote repository when blog content is updated:
```bash
# After any blog changes, always run:
git add .
git commit -m "Descriptive commit message

🤖 Generated with Claude Code"
git push origin main
```
This ensures GitHub Pages deployment and maintains version control integrity.

### 2. Recommendation Index Requirement
**EVERY blog post** must include a "Recommendation Index" section evaluating whether readers should access the original source. The index should assess:

**Evaluation Criteria:**
- **Source Influence** (1-5): How impactful/authoritative is the original source?
- **Summary Completeness** (1-5): Does the summary capture the essential content comprehensively?
- **Unique Value** (1-5): Does the original provide significant additional value beyond the summary?
- **Accessibility** (1-5): How easy/worthwhile is it for readers to access the original?

**Template:**
```markdown
## Recommendation Index

**Should you read the original source?**

| Criteria | Score (1-5) | Notes |
|----------|-------------|-------|
| Source Influence | X/5 | Brief explanation |
| Summary Completeness | X/5 | What's covered vs. missing |
| Unique Value | X/5 | Additional value in original |
| Accessibility | X/5 | Ease of access/time investment |

**Overall Recommendation:** READ/SKIM/SUMMARY SUFFICIENT (X.X/5)

*Recommendation: [Brief explanation of when to read original vs. when summary suffices]*
```

**Scoring Guidelines:**
- 4.0-5.0: Strongly recommend reading original
- 3.0-3.9: Original worth reading for deep interest
- 2.0-2.9: Summary covers most value, original optional
- 1.0-1.9: Summary sufficient for most readers