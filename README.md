
<h1 id="title">
  Happy Metrics Papers
</h1>

[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](https://makeapullrequest.com)

> This is a curated list of papers on Econometrics that are sorted by topic and year. On top of that, they are sorted by where I read it, such as a reading group, a seminar or a topic course.
---

## Prelude
All papers listed in this repo have been discussed at the following occasions, except papers in Super Happy section. Papers are listed with their publication year, title, author(s), topic, key words, venue, and links to the paper and/or code. Sections without :ballot_box_with_check: will be updated regularly, while those with :ballot_box_with_check: will not have updates any more.

- [ ] Reading group, BGSE
- [ ] Topic Course in Metrics, 2022/23 WiSe, BGSE
- [x] Topic Course in Metrics, 2022 SoSe, BGSE
- [ ] Seminars, BGSE
- [ ] Super Happy Papers

## Lists of Papers
Click :arrow_forward: to expand a section and :arrow_down_small: to hide. Search keywords over webpage to locate papers quickly.

<details><summary>Reading Group, BGSE</summary>
<p>

> This reading group is an informal event organized by professors and PhD students at BGSE, and focuses on theoretical Econometrics. It is led by [Prof. Freyberger](https://www.econ.uni-bonn.de/en/department/team/professors/joachim-freyberger) and runs every week during semester.
  
|Year|Title|Author(s)|Topic|Keywords|Venue|Paper|Code|Note|
|---|---|---|---|---|---|---|---|---|
|2022|**Linear regression with centrality measures**|Yong Cai|Network, Centrality|Networks, diffusion centrality, eigenvector centrality|JMP|[Link](https://arxiv.org/abs/2210.10024)||Symmetry of metrix $A$ is not necessary; In sparse network, $a$ is a friend of $b$, who is a friend of $c$. But, $a$ is not a friend of $c$. So, an IV can be constructed; With $n \rightarrow \infty$, $C^{(d)} \rightarrow \infty$ but then $Y_i \rightarrow \infty$ as $\beta^{(d)} \rightarrow \beta$ which is a constant; Non-linearity of this problem|
|2022|**Nonlinear and nonseparable structural functions in fuzzy regression discontinuity designs**|Haitian Xie|Continuous Treatment, Fuzzy RD||JMP|[Link](https://arxiv.org/abs/2204.08168)|||
|2022|**Bounding treatment effects in experimental studies with non-compliance: the value of follow up surveys**|Orville Mondal|Non-compliance||JMP|[Link](https://omondal.github.io/docs/jmp.pdf)||Never start with non-testable assumptions; Population -> *assigned treatment* and *assigned control*; Assigned treatment -> *comply* and *not comply*; Not comply can be further divided; Assigned control -> *accept* and *not accept*|
|2008|**Regression discontinuity designs: A guide to practice**|Imbens and Lemieux|RD||J Metrics|[Link](https://www.sciencedirect.com/science/article/abs/pii/S0304407607001091)||For occasions where SRD on left and FRD on right, assumption 2.3 is not needed|

  
</p>
</details>

<details><summary>Topic Course in Metrics, 2022/23 WiSe, BGSE</summary>
<p>

> This topic course in Econometrics and Statistics is given by [Prof. Janys](https://sites.google.com/site/janyslena/research) during 2022/23 WiSe at BGSE.

|Year|Title|Author(s)|Topic|Keywords|Venue|Paper|Code|Note|
|---|---|---|---|---|---|---|---|---|
|2022|**A More Credible Approach to Parallel Trends**|Ashesh Rambachan, Jonathan Roth|DiD, Violation of parallel trend||Review of Economic Studies|[Link](https://jonathandroth.github.io/assets/files/HonestParallelTrends_Main.pdf)|[Code](https://github.com/asheshrambachan/HonestDiD)||
|2022|**Pretest with Caution: Event-Study Estimates after Testing for Parallel Trends**|Jonathan Roth|Pretrend testing, Parallel trend||AER: Insights|[Link](https://www.aeaweb.org/articles?id=10.1257/aeri.20210236)|[Code](https://github.com/jonathandroth/pretrends#pretrends)|Even if pretrend test passes, the insignificant pretrend may lead to significant posttrend
|2022|**Selection and parallel trends**|Dalia Ghanem, Pedro H.C. Danta'Anna, Kaspar Wüthrich|DiD, Parallel trends, Selection Mechanism||WP|[link](https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4215029)|||
|2021|**Synthetic Difference-in-Differences**|Arkhangelsky et al.|DiD, Synthetic Control||AER|[Link](https://www.aeaweb.org/articles?id=10.1257/aer.20190159)|||
|2021|**Difference-in-differences with variation in treatment timing**|Goodman-Bacon|DID|DiD, Variation in treatment timing, TWFE, Treatment effect heterogeneity| J Metrics|[Link](https://www.sciencedirect.com/science/article/abs/pii/S0304407621001445)||Errors come when using earlier treated group as control group; Weight of forbidden pairs reaches peak when the final treatment is right in the middle from first treatment to the end|
|2021|**Estimating dynamic treatment effects in event studies with heterogeneous treatment effects**|Sun and Abraham|Event Study, DiD|DiD, TWFE, Pretrend test|J Metrics|[Link](https://www.sciencedirect.com/science/article/abs/pii/S030440762030378X)||
|2021|**Difference-in-Differences with Spatial Spillovers**|Butts|DiD, Spatial Spillover||arXiv|[Link](https://arxiv.org/abs/2105.03737)||DID=Direct Effect+Spillover on Treated+Spillover on Control

  
</p>
</details>

<details><summary>Topic Course in Metrics, 2022 SoSe, BGSE</summary>
<p>

> This topic course in Econometrics and Statistics is given by [Prof. Freyberger]([https://sites.google.com/site/janyslena/research](https://www.econ.uni-bonn.de/en/department/team/professors/joachim-freyberger)) during 2022/23 WiSe at BGSE.

|Year|Title|Author(s)|Topic|Keywords|Venue|Paper|Code|Note|
|---|---|---|---|---|---|---|---|---|
|2019|**On Deep Learning as a Remedy for the Curse of Dimensionality in Nonparametric Regression**|Bauer and Kohler|Nonparametric Regression, Curse of Dimensionality, Multilayer feedforward neural network||Annals Stats|[Link](https://projecteuclid.org/journals/annals-of-statistics/volume-47/issue-4/On-deep-learning-as-a-remedy-for-the-curse-of/10.1214/18-AOS1747.full)||[Link](https://github.com/ccfang2/TopicsMetricsStats2022)|

  
</p>
</details>

<details><summary>Seminars, BGSE</summary>
<p>

> Seminars are official events organized by BGSE, where researchers present their working or published papers.

|Year|Date|Speaker|Affiliation|Title|Keywords|Paper|Code|Note|
|---|---|---|---|---|---|---|---|---|
|2022|Oct 20|Florian Gunsilius|University of Michigan|**Matching for causal effects via multimarginal unbalanced optimal transport**||[Link](https://arxiv.org/abs/2112.04398)||Equation (5): In coupling, instead of requiring its marginal dists to be exactly as $\mu$ s, they allow some variations. From classical matching to unbalanced matching and then only a few good matches, variation increases but bias decreases.
|2022|
  
</p>
</details>

<details><summary>Super Happy Papers</summary>
<p>

> This section lists papers I read at occasions other than those above.

|Year|Title|Author(s)|Topic|Keywords|Venue|Paper|Code|Note|
|---|---|---|---|---|---|---|---|---|
  
</p>
</details>

## How to Collaborate[^1]

Follow steps below to collaborate on this repository
1. `Fork` this repository to your own GitHub.
2. Open you terminal, and in your shell[^2]:
    ```shell
    git clone [your HTTPS] # save repo to your local machine
    git checkout -b [your new branch title] # create a new branch
    emacs -nw readme.md # open readme.md
    ```
3. Revise `readme.md` file.
4. Open terminal again, and in your shell:
    ```shell
    git status # check status
    git diff # check revision you just made
    git add readme.md # add revision to your branch
    git commit -m [your comment] # commit your revision
    git push origin [your branch title defined above] # push
5. Open your GitHub, and you may find the new branch you just push.
6. Click "Compare & pull request", and create a pull request.
7. Your pull request will then be accepted or rejected on my side.


## Contact

Chencheng Fang, Email: [ccfang[at]uni-bonn.de](mailto:ccfang@uni-bonn.de),
Bonn Graduate School of Economics, University of Bonn, Germany

## [[Back to Top]](#title)

[^1]: Please refer to this [video](https://www.youtube.com/watch?v=rgbCcBNZcdQ) for details.
[^2]: You are required to enter your GitHub account name and password to copy this repo to your local directory. If your password doesn't work, please create a personal access token and use the token instead of your password. To create a token, go to your account setting, and then developer settings.
