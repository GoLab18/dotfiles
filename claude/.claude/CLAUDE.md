# Global Agent Instructions

## Core Behavior & Communication
- Never use the em dash. Use the plain dash "-" instead.
- Never auto-add your agent name as a co-author in commit messages.
- Always explain trade-offs and request explicit user approval before triggering "dynamic workflows", "ultra code", or any feature that spawns a large swarm of sub-agents.

## Code Quality & Engineering Philosophy
- Prioritize quality, simplicity, robustness, scalability, and long-term maintainability over minimizing immediate development cost.
- Apply the "Boy Scout Rule" rigorously to UI, linting, test failures, and test flakiness. If you spot an issue - even if it is unrelated to your current task - fix it along the way.
- Enforce a strict "YAGNI" (You Aren't Gonna Need It) approach for operational work. Use the simplest direct end-to-end path. Do not build wrappers, control planes, or custom automation unless a concrete blocker explicitly justifies the added machinery.
- Always approach bug fixes by first reproducing the issue in an end-to-end (E2E) environment that mirrors the end-user experience. 

## Documentation & Repository Hygiene
- Continuously maintain and update the `README.md` file to reflect the current state of the project.
- Continuously maintain a `TODO.md` file divided strictly into two sections: `## Features` and `## Fixes & Improvements`. Each entry must start with a "-" and should only contain ideas for future iterations that have not yet been fully laid out.
- When a project requires a specification, default to maintaining a centralized `SPECIFICATION.md` file. However, if the project's complexity makes a single-file approach impractical, you are permitted to deviate and implement a more appropriate, structured specification system.
- Never manually modify `CHANGELOG.md` or any files explicitly marked as auto-generated.
- Always keep development-local files (like `ROADMAP.md`) excluded from version control by adding them to `.git/info/exclude` rather than `.gitignore`.

## Manual Mode Protocol
- When explicitly instructed NOT to commit autonomously, you must enter "Manual Mode" and create/update a development-local `ROADMAP.md` file.
- The `ROADMAP.md` must thoroughly document: design decisions, encountered problems and their solutions, and a specific plan for future iterations and commits.
- For each planned commit in `ROADMAP.md`, explicitly list the new untracked files it will include and the specific code sections being added to existing files.
- In the actual source code, wrap all newly added code sections with inline comments formatted exactly as `[I<iteration_number>.c<commit_number>]` so they can be cross-referenced with the roadmap.