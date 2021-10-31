# Quickstart

On new machine setup this repository. Submodule clone is needed for the theme.

```
git clone git@github.com:Kazhuu/blog.git
git submodule init
git submodule update
```

Create new post with

```
hugo new posts/<post-name-with-date>.md
```

For example `hugo new posts/2021-10-10-test-post.md`. This will generate a file
under `content/posts/` folder.

To serve file locally with drafts enabled

```
hugo server -D
```
