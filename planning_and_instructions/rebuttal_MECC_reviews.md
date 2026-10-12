# Rebuttal to MECC26 Reviews

## Comment–Response Table

| # | Reviewer | Comment | Response | Revision | Status |
| --- | --- | --- | --- | --- | --- |
| 1 | AE | Justify necessary condition under real vehicle conditions | Parameter estimation uses 100% of the data; detection uses the 10% | Sec. 6, conclusion | 🔵 Writing |
| 2 | AE | Fix writing issues (Appendix-??) | LaTeX cross-reference error corrected | Throughout | 🟢 Done |
| 3 | R12 | Significance not clearly stated | Separte paragrapph. Quatify the significance? Explicit: (1) dynamic model with residence/sampling time interplay, (2) convex estimation without NH₃ sensors, (3) Wald-test aging detector validated on truck data | Sec. 1 | 🔵 Writing |
| 4 | R12 | Writing mistakes (Appendix-??) | LaTeX cross-reference error corrected | Sec. 3 | 🟢 Done |
| 5 | R12 | Want figures, not just numbers | TBD | Sec. 3, 6 | 🟠 Still Figuring Out How |
| 6 | R12 | Literature review insufficient | Covered most of the literature relevant to the problem | Sec. 1 | 🟢 Done |
| 7 | R14 | Chemical compounds in roman font | Fixed | Throughout | 🟢 Done |
| 8 | R14 | Engineering feasibility: light-load/downhill → no saturation → false alarms? How long to wait? | No false alarms if the reference DG system is properly identified. Detector defers when data insufficient. Saturation occurs naturally under highway/high-load driving. Samples accumulate across drive cycles, consistent with OBD regulatory frameworks | Sec. 6 | 🔵 Writing |
| 9 | R14 | Why does β jump from 4/10 to 250? | Finite-sample departure of $T_w$ from $\chi^2_p$: fewer saturated samples, less reliable $\hat{\sigma}^2$, and unaccounted variance of $\theta_{sat}^{dg}$ inflate the null distribution. With more data, optimal criteria (Neyman–Pearson, Bayes, ROC) can be applied | Sec. 6 | 🔵 Writing |
| 10 | R18 | Saturation requirement is a severe bottleneck (~10%) | All data constrains estimates via $\eta_{sat} \geq \eta$; 10% are the tightest constraints. Saturation enables convex estimation without NH₃ sensors. 10% yields $N_{sat} \geq 120$–$150$, sufficient for MLE asymptotics | Sec. 6 | 🟢 Done |
| 11 | R18 | Dynamics irrelevant (memoryless model) → doesn't fit MECC scope | Model derived from molar conservation dynamics; memorylessness is one mode of a switched dynamical system. Mode detection, bounding condition, and residence-time modeling are all dynamic. Paper is squarely within dynamic systems scope | Rebuttal | 🟢 Done |

---

## New References to Add

- Shao, J. (2003). *Mathematical Statistics*. 2nd ed., Springer.
- Lehmann, E.L. and Romano, J.P. (2005). *Testing Statistical Hypotheses*. 3rd ed., Springer.
- Casella, G. and Berger, R.L. (2002). *Statistical Inference*. 2nd ed., Duxbury/Thomson.
- Poor, H.V. (1998). *An Introduction to Signal Detection and Estimation*. 2nd ed., Springer.
