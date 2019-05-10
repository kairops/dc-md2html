# Docker Command: Markdown to HTML file conversion

Convert files from Markdown format to HTML format

Its a part of the Docker Command series

## Usage

Execute the following within your repository folder:

- Using Bash: `entrypoint.sh source.md > target.html` or `cat target.HTML | entrypoint.sh > target.html`
- Using Docker: `docker run --rmi -v $(pwd):/workspace kairops/dc-md2html source.md > target.html`
- Using docker-command-launcher: `kd md2html source.md > target.html`

## Considerations

This function uses the `markdown` package. You could install with:

- Mac: `brew install markdown`
- Linux DEB package: `apt-get install markdown`
- Linux RPM package:  `yum install epel-release` + `yum install discount` (`markdown` command)

You can use either `cat source.md | kd md2html > target.html` or `kd md2html source.md > target.html` format
