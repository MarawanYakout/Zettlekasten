# Competitive Programming: Roadmap to the Top Tier

A practical, staged framework for going from casual solver to Candidate Master / Grandmaster-level (and olympiad / ICPC-level) competitor.

---

## 1. Platforms and Archives

| Platform | Link | What it's best for |
|---|---|---|
| **Codeforces** | [codeforces.com](https://codeforces.com/) | Regular rated rounds (Div. 1/2/3/4, Educational, Global), huge problem archive, editorials, virtual contests |
| **AtCoder** | [atcoder.jp](https://atcoder.jp/) | High-quality, clean problems (ABC/ARC/AGC); excellent for building fundamentals and math insight |
| **CSES Problem Set** | [cses.fi/problemset](https://cses.fi/problemset/) | The best curated "first 300" list: sorting, DP, graphs, trees, range queries, math |
| **USACO Guide** | [usaco.guide](https://usaco.guide/) | Structured curriculum from Bronze to Platinum with problem sets per topic |
| **CP-Algorithms** | [cp-algorithms.com](https://cp-algorithms.com/) | Reference for algorithms, proofs, and implementations |
| **CodeChef** | [codechef.com](https://www.codechef.com/) | Long and short contests, extra problem variety |
| **IOI** | [ioinformatics.org](https://ioinformatics.org/) | Official archive of IOI tasks, results, and syllabus (competition itself is for secondary-school students) |
| **Google Code Jam archive** | [codingcompetitions.withgoogle.com](https://codingcompetitions.withgoogle.com/) / community mirror [zibada.guru/gcj](https://zibada.guru/gcj/) | Complete historical problem sets and analyses (the contest was discontinued) |
| **Meta Hacker Cup** | [facebook.com/codingcompetitions/hacker-cup](https://www.facebook.com/codingcompetitions/hacker-cup) | Annual contest with long-format, high-quality problems |
| **ICPC** | [icpc.global](https://icpc.global/) | Team contest for university students; regional → world finals |
| **Kattis / Open Kattis** | [open.kattis.com](https://open.kattis.com/) | ICPC-style problem archive |

> **Note on eligibility:** the IOI is restricted to secondary-school students. If you're at university, use its task archive purely as training material and aim competitions like **ICPC**, **Codeforces**, **AtCoder**, and **Hacker Cup**.

---

## 2. Know Your Target (Codeforces Rating Tiers)

| Rating | Title | Typical level of problem you should solve reliably |
|---|---|---|
| < 1200 | Newbie | Div. 2 A |
| 1200-1399 | Pupil | Div. 2 A-B |
| 1400-1599 | Specialist | Div. 2 B-C |
| 1600-1899 | Expert | Div. 2 C-D |
| 1900-2099 | Candidate Master | Div. 2 D-E |
| 2100-2399 | Master / International Master | Div. 1 A-C |
| 2400-2599 | Grandmaster | Div. 1 C-E |
| 2600+ | International Grandmaster | Div. 1 D-F |

Set a concrete target (e.g. "reach 1600 in 4 months") and train for the next tier, not the final one.

---

## 3. Stage-by-Stage Roadmap

### Stage 0: Tooling (Week 1)
- Pick **one** language and master it: **C++** is the standard (STL, fast I/O); Python is fine for the early stages but too slow for high ratings.
- Prepare a **template**: fast I/O, common macros/typedefs, debug printing.
- Set up local compile/run, stress-testing scripts (brute force vs. solution with random generator), and a personal **algorithm library** (your own tested code for DSU, segment tree, modular arithmetic, etc.).

### Stage 1: Fundamentals (0 → ~1400)
- Implementation, brute force, simulation, constructive basics.
- Sorting, two pointers, prefix sums, binary search (including on the answer).
- Greedy fundamentals and basic math (GCD, primes/sieve, parity).
- Complete the CSES introductory, sorting-and-searching, and basic DP sections.

### Stage 2: Core Toolkit (~1400 → ~1900)
- **Data structures:** stacks/queues/monotonic stack, priority queue, DSU, Fenwick tree, segment tree (point and range updates), sparse table, ordered sets/maps.
- **Graphs:** BFS, DFS, topological sort, Dijkstra, 0-1 BFS, MST (Kruskal/Prim), bridges/articulation points, SCC.
- **Trees:** rerooting, LCA (binary lifting), Euler tour, subtree queries.
- **DP:** knapsack variants, LIS, interval DP, bitmask DP, DP on trees, digit DP.
- **Math:** modular arithmetic, modular inverse, binomials mod p, fast exponentiation, sieve variants.
- **Strings:** hashing, prefix function/KMP, Z-function.

### Stage 3: Advanced Techniques (~1900 → ~2400)
- **Data structures:** lazy segment tree, persistent structures, sqrt decomposition, Mo's algorithm, HLD, centroid decomposition, treaps, segment tree beats, Li Chao tree.
- **Graphs and flow:** max-flow (Dinic), min-cost flow, bipartite matching, 2-SAT.
- **DP optimizations:** Divide & Conquer, Knuth, convex hull trick, SOS DP, DP with bitsets.
- **Math:** CRT, Euler's totient, Möbius inversion, Lucas, FFT/NTT, matrix exponentiation, linear algebra over GF(2), game theory (Sprague-Grundy).
- **Strings:** suffix array/automaton, Aho-Corasick, Manacher.
- **Geometry:** convex hull, cross products, line sweep.
- **Techniques:** meet-in-the-middle, offline queries, small-to-large merging, randomization, interactive problems.

### Stage 4: Elite (2400+)
- Solve problems that require **combining** multiple ideas, or proving a non-obvious structural claim.
- Read editorials of Div. 1 E/F and AtCoder AGC problems; study how the setters think.
- Participate in or analyze ICPC World Finals, IOI, and Hacker Cup problems.

---

## 4. Training System

### Weekly Structure (example, ~15-20 hrs/week)

| Activity | Share | Notes |
|---|---|---|
| Rated contests / virtual contests | 20% | 1-2 per week |
| **Upsolving** | 30% | Solve every problem you could not solve in-contest |
| Topic-focused practice | 35% | One topic per week or two |
| Learning new algorithms | 15% | Read, implement from scratch, then solve 3-5 problems with it |

### Problem Selection
- Solve problems rated **100-300 points above** your current rating; they should take you 30-60 min and teach you something.
- Use the Codeforces problemset filters (tags + rating range) or a tool like **Codeforces Problem Recommender** / **CF Predictor** extensions.
- Keep a **mistake log**: for every failed problem, record the key idea you missed, the bug that cost you, and the pattern category.

### The Upsolving Protocol
1. Try again for 20-30 minutes **without** the editorial.
2. Read only the **hint** or first paragraph, then retry.
3. Read the full editorial; **close it** and implement from memory.
4. Add the trick/idea to your notes (and the code to your library if reusable).
5. Revisit the problem **2-4 weeks later** and re-solve it without help (spaced repetition).

---

## 5. Thinking Skills

- **Read constraints first:** they tell you the intended complexity.

  | N | Likely complexity |
  |---|---|
  | ≤ 10 | O(N!) / O(2^N · N) |
  | ≤ 20-25 | O(2^N) / meet-in-the-middle |
  | ≤ 500 | O(N^3) |
  | ≤ 5,000 | O(N^2) |
  | ≤ 10^5 - 5·10^5 | O(N log N), O(N √N) with small constants |
  | ≤ 10^7 | O(N) |
  | ≤ 10^18 | O(log N) / math |

  Roughly 10^8 simple operations fit in 1-2 seconds in C++.

- **Common problem-solving moves:** solve small cases by hand, find invariants, reverse the process, binary search the answer, fix one variable and optimize the other, think in terms of contribution of each element, convert to a graph, reduce to a known problem.
- **Prove before coding** for greedy solutions: try to find a counterexample or an exchange argument.
- **Stress test** whenever you're unsure: write a brute force and compare on thousands of random small inputs.

---

## 6. Contest Strategy

- **Before:** Sleep well, water, template ready, IDE configured.
- **Read all problems** (or at least A-D) in the first few minutes; solve in order of **difficulty as you perceive it**, not letter order.
- **Pivot rule:** stuck for 30-45 minutes with no new idea → switch problems; come back with fresh eyes.
- **Avoid penalties:** check edge cases (N = 1, all equal, max values, overflow: use `long long`), re-read the statement before submitting.
- **Don't hack or chase scores blindly:** a clean accepted solution beats a rushed risky one; know the scoring format (Codeforces penalties, ICPC time penalty, IOI partial scores).
- **After:** Always upsolve and review the editorial the same day.

---

## 7. Implementation Speed and Quality

- Keep a **personal, tested library**; typing standard structures from scratch costs minutes.
- Write short, readable code with meaningful variable names; bugs hide in clever code.
- Practice **typing speed** and common patterns (e.g. fast DFS, modular exponentiation) until automatic.
- Use `assert`s and local debug macros; remove them or guard with `#ifdef LOCAL`.
- Learn to read **compiler warnings** and use sanitizers (`-fsanitize=address,undefined`) locally.

---

## 8. Mindset and Sustainability

- **Rating fluctuates**; judge progress over 10-20 contests, not one.
- Train consistently (5-6 days/week) rather than in bursts.
- Learn from stronger peers: join a team/community, discuss solutions, and **explain** your solutions aloud.
- Take rest days; burnout kills more progress than anything else.
- Compete in **team contests (ICPC)** to practice communication and splitting the problem set.

---

## 9. Recommended Resources

**Books**
- *Competitive Programmer's Handbook* (Antti Laaksonen), free, great intro
- *Competitive Programming 4* (Steven & Felix Halim)
- *Introduction to Algorithms* (CLRS), for depth and proofs
- *Algorithms* (Jeff Erickson), free, strong on proofs and DP

**Websites / Channels**
- [CP-Algorithms](https://cp-algorithms.com/), [USACO Guide](https://usaco.guide/), [CSES](https://cses.fi/problemset/)
- Codeforces **EDU** section (step-by-step courses with problems)
- Codeforces blogs: "Catalog of problems by topic", "Algorithm Gym"
- YouTube: William Lin, Errichto, Second Thread, Colin Galen (Codeforces educational walkthroughs)

---

## 10. Sample 12-Week Plan (Rating ~1200 → ~1600)

| Weeks | Focus | Output |
|---|---|---|
| 1-2 | Template, STL, sorting, binary search, two pointers | Finish CSES Intro + Sorting & Searching |
| 3-4 | Greedy, constructive, number theory basics | 40+ CF problems rated 1200-1500 |
| 5-6 | DP basics (knapsack, LIS, grid, bitmask) | CSES DP section |
| 7-8 | Graphs (BFS/DFS/Dijkstra/DSU) | CSES Graph section |
| 9-10 | Trees, Fenwick, segment tree | CSES Range Queries + Tree Algorithms |
| 11-12 | Mixed virtual contests + heavy upsolving | 6+ virtual rounds, fully upsolved |

Repeat, shifting the problem difficulty up by ~200 rating each cycle.

---

## Key Takeaways

1. **Upsolving and deliberate practice** matter more than raw problem count.
2. Build and maintain a **tested personal library** and a **mistake log**.
3. Train at the **edge of your ability**, then consolidate with spaced repetition.
4. Learn algorithms by **implementing and applying them**, not just reading.
5. **Consistency** over intensity: a steady, long-term habit is what reaches the top tier.
