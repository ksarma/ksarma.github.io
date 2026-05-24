# When the Notes section is disabled (site.enable_notes is falsy), keep the
# notes collection pages and the notes index out of sitemap.xml so search
# engines don't discover/index the placeholder content. (The pages are also
# marked noindex in head.html; this removes them from the sitemap entirely.)
#
# Runs at build time before jekyll-sitemap's generator, so setting the
# `sitemap` data flag is honored. Custom plugins run in this repo's build
# (bin/deploy / jekyll build), so this works on the GitHub Actions deploy.
Jekyll::Hooks.register :site, :post_read do |site|
  next if site.config['enable_notes']

  notes = site.collections['notes']
  notes.docs.each { |doc| doc.data['sitemap'] = false } if notes

  site.pages.each do |page|
    page.data['sitemap'] = false if page.data['layout'] == 'notes_index'
  end
end
