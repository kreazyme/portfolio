# Deploy Flutter Web to GitHub Pages

This repository is configured to automatically deploy to GitHub Pages on every push to the main branch.

## Setup Instructions

1. **Enable GitHub Pages in your repository:**
   - Go to Settings → Pages
   - Under "Build and deployment", select "GitHub Actions" as the source

2. **Update base-href if needed:**
   - If your repository name is NOT "portfolio", update the `--base-href` value in `.github/workflows/deploy.yml` (line 33)
   - Change `/portfolio/` to `/<your-repo-name>/`

3. **Push to main branch:**
   - The workflow will automatically build and deploy your site

4. **Access your site:**
   - Your site will be available at: `https://<username>.github.io/portfolio/`

## Manual Deployment

You can also trigger a manual deployment from the Actions tab by clicking "Run workflow".

## Local Testing

To test the production build locally:

```bash
flutter build web --release --base-href "/portfolio/"
cd build/web
python3 -m http.server 8000
```

Then visit `http://localhost:8000/portfolio/`
