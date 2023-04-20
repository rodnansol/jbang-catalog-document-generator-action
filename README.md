# JBang Catalog Document Generator GitHub Action

With the help of this action, you can use the [JBang Catalog Document Generator](https://github.com/rodnansol/jbang-catalog-document-generator) in your actions.

Example usage:

```yaml
name: update-catalog
on:
  push:
    branches:
      - main
  workflow_dispatch:

jobs:
  update-catalog-documentation:
    runs-on: ubuntu-latest
    name: Update catalog documentation
    if: startsWith(github.event.head_commit.message, 'Updating jbang-catalog documentation') != true
    steps:
      - uses: actions/checkout@v3
      - uses: rodnansol/jbang-catalog-document-generator-action@v0.1.0
        name: Generate catalog document
        with:
          version: early-access
          arguments: generate jbang-catalog.json -o README.adoc --custom-header=header.adoc --include-generation-date=true
      - name: Commit document changes
        shell: bash
        run: |
          git add README.adoc
          git config --global user.email "${{ secrets.COMMITTER_EMAIL }}"
          git config --global user.name "${{ secrets.COMMITTER_NAME }}"
          git commit -m "Updating jbang-catalog documentation"
          git push origin main


```

- It will download the specified version of the tool, in this case the **early-access** and it will run it with the configured **arguments**.
- The next step will commit the generated files.

## Extra tips

### Setup .gitignore

Make sure the *jbang-catalog-document-generator-cli.jar* is in the `.gitignore` file, that nobody accidentally commits.

## Documentation

Please check the documentation here [rodnansol.github.io](https://rodnansol.github.io/jbang-catalog-document-generator/latest/index.html)
