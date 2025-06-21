# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Jekyll-based academic portfolio website for Karthik V. Sarma MD PhD, using the al-folio theme. The site is deployed to GitHub Pages at https://ksarma.com.

## Key Commands

### Local Development
```bash
# Install dependencies
bundle install

# Run local development server
bundle exec jekyll serve

# Build the site
bundle exec jekyll build
```

### Deployment
- **Automatic**: The site automatically deploys via GitHub Actions when changes are pushed to the `master` branch
- **Manual**: Run `./bin/deploy` (but automatic deployment is preferred)

## Architecture

### Core Technologies
- **Jekyll** - Static site generator
- **Ruby 3.0.2** - Required runtime
- **Bootstrap 4.6.1** - CSS framework
- **GitHub Pages** - Hosting platform
- **GitHub Actions** - CI/CD pipeline

### Directory Structure
```
_bibliography/    # Academic publications (BibTeX format)
_data/           # Data files (coauthors.yml for co-author links)
_includes/       # Reusable HTML components
_layouts/        # Page templates (about, post, distill, etc.)
_pages/          # Main site pages (about, projects, publications, teaching)
_projects/       # Individual project pages
_sass/           # SCSS stylesheets
assets/          # Static assets (CSS, JS, images, PDFs)
```

### Key Configuration Files
- `_config.yml` - Main Jekyll configuration
- `Gemfile` - Ruby dependencies
- `.github/workflows/deploy.yml` - GitHub Actions deployment workflow

## Common Development Tasks

### Adding Publications

Edit `_bibliography/papers.bib` with BibTeX entries. The site automatically generates the publications page from this file. 

**Important**: When adding publications:
1. It is OK for all but the last name to be initials for authors. Initials should be followed by periods.
2. Update the last edited comment at the top of `papers.bib`
3. Ensure the publication year is included in the `years` list in `_pages/publications.md` (line 6), otherwise the publication won't appear on the page

#### Author Name Highlighting
The system automatically underlines/italicizes your name in publications. This is configured in `_config.yml`:
```yaml
scholar:
  last_name: Sarma
  first_name: [Karthik, "Karthik*", Karthik V, "Karthik V*", "Karthik V.", "Karthik V.*", "K V", "K. V.", "K V*"]
```
- Add all variations of your first name that appear in citations
- The system matches both last_name AND one of the first_name variations
- Matching authors are wrapped in `<em>` tags for emphasis

#### Adding Links to Publications
**Important**: The `doi` and `url` BibTeX fields are NOT used by this theme and won't generate any output.

To add links, use these BibTeX fields which create buttons:
- `website` - General purpose link (shows as "Link" button) - use this for DOI links
- `pdf` - Link to PDF (external URL or local file in `/assets/pdf/`)
- `arxiv` - ArXiv ID (e.g., `arxiv={2023.12345}`)
- `html` - Link to HTML version
- `code` - Link to code repository
- `blog` - Blog post about the work
- `poster` - Conference poster
- `slides` - Presentation slides
- `supp` - Supplementary materials
- `abstract` - Include abstract text (creates expandable "Abs" button)
- `bibtex_show={true}` - Show BibTeX citation button
- `abbr` - Conference/venue abbreviation badge (e.g., `abbr={ICML}`)
- `award` - Award text (displays with star icon)

Example:
```bibtex
@inproceedings{sarma2024example,
  title={Example Paper},
  author={Sarma, Karthik V and Doe, Jane},
  booktitle={Example Conference},
  year={2024},
  pdf={https://example.com/paper.pdf},
  code={https://github.com/user/repo},
  abstract={This is the abstract text...},
  bibtex_show={true},
  selected={true}
}
```

#### Selected Publications
To feature publications on the main page, add `selected={true}` to the BibTeX entry. These will appear in the "selected publications" section on the about page.

### Adding Projects
(Currently disabled). Create new markdown files in `_projects/` directory. Projects are displayed in a responsive grid layout.

### Updating Personal Information
- Edit `_config.yml` for site metadata and social links
- Edit `_pages/about.md` for the main about page content

### Styling Changes
- Theme colors: Edit `_sass/_themes.scss`
- General styles: Edit files in `_sass/` directory
- Layout changes: Edit files in `_layouts/` directory

## Important Notes

- The blog functionality is currently disabled (commented out in `_config.yml`)
- The news and projects sections are also disabled (commented out in `_config.yml`)
- The site uses Jekyll Scholar for bibliography management with author highlighting
- Images are automatically optimized using ImageMagick
- Math rendering is enabled via MathJax
- The deployment branch is `gh-pages`, source branch is `master`
- All commits to `master` branch trigger automatic deployment