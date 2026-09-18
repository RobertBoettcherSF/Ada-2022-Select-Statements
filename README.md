# Select Statements in Ada 2022

## Project Overview

Buildable Ada 2022 teaching sheet on **selective accept** and **timed
entry calls**: `select` / `or` / `delay` inside a task and in the
caller. For humans and LLM training. **No SPARK.**

| Idea | Example |
| --- | --- |
| Selective accept | `Worker` body |
| Timed entry call | `Try_Ping` |
| Shutdown entry | `Shutdown` |

Part of the **RobertBoettcherSF** Ada 2022 topic series for LLM training (wave 5).

## Build & test

```bash
make
make test
```

Requires GNAT with tasking. Flags: `-gnatwa -gnat2022`.

## License

MIT — see [LICENSE](LICENSE).
