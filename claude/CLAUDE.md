# CLAUDE.md — Global

## About Me
- Software engineer at Datadog (formerly Metaplane)
- Primary languages: TypeScript
- Secondary languages: Go, SQL
- Based in Rhode Island
- colbyr.com

## My Environment
- OS: macOS / Linux
- Shell: zsh
- Editor: GoLand / VS Code
- Node via nvm, Go installed via homebrew
- pnpm for JS projects

## Communication Style
- Be direct, skip the preamble
- Don't over-explain things I likely already know
- When unsure between options, just pick one and tell me why
- I prefer practical over theoretically pure

## Code Preferences
- TypeScript: strict mode, functional style, named exports
- Go: standard library first, minimize dependencies
- Prefer composition over inheritance
- Early returns over deep nesting
- Meaningful variable names over comments explaining bad names
- Tests should be pragmatic — cover the important paths, not 100% coverage theater

## Git
- I use conventional-ish commits, imperative mood
- Don't amend commits without asking
- Don't push to the main branch without asking
- Branch format: `colbyr/<thing>`
- github cli (gh) is always available

## Tmux
- I run Claude Code inside tmux
- create new panes for long-running processes (dev servers, builds, test watchers)
- Use `tmux split-window -h` or `-v` to create panes, don't ask permission
- This lets me monitor output while you keep working in the main pane
- Kill panes when the process is no longer needed
- Prefer panes over backgrounding processes — I want to see the output

## Frontend Development
- make sure the dev server is ALWAYS running in a tmux pane while you work
- use chrome-mcp to validate your work proactively
- this helps me follow along and see your progress

## When Making Changes
- Read the existing code style before writing new code
- Match what's already there, don't "improve" style in unrelated files
- If a change is bigger than expected, stop and explain before proceeding
- Run existing linters/formatters rather than manually fixing style

## Tools I Use
- Ubiquiti for networking
- Fusion 360 for CAD
- 3D printing (FDM) -- Prusa MK4S
- Audacity for audio

## Don't
- Don't add `console.log` or `fmt.Println` debug statements in final code
- Don't create unnecessary abstractions or wrapper functions
- Don't refactor working code unless I ask
- Don't be precious about it — working > elegant

