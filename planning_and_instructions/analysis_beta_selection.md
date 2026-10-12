# Analysis for β Selection and Its Discrepancy Between the Data Sets

## Overview

The Wald test statistic for catalyst aging detection is:

$$T_w = (\hat{\theta}_{sat} - \theta_{sat}^{dg})^T \, I(\hat{\theta}_{sat}) \, (\hat{\theta}_{sat} - \theta_{sat}^{dg}) > \beta$$

The threshold β differs significantly across data sources:
- **Test-cell Hot-FTP**: β = 4.00
- **Test-cell RMC**: β = 10.00
- **Truck data**: β = 250

This document analyzes **why** β must be so different.

---

## Draft Paragraph for Paper

The threshold $\beta_{truck} = 250$ is significantly larger than the test-cell thresholds ($\beta_{RMC} = 10$, $\beta_{hFTP} = 4$) due to the finite-sample departure of $T_w$ from its asymptotic $\chi^2_p$ distribution under $\mathcal{H}_0$. The convergence of the MLE to normality depends on the number of saturated-mode samples \cite{shao2003mathematical}, and truck data has considerably fewer such samples ($N_{sat} \approx 120$–$150$) compared to test-cell experiments ($N_{sat} \approx 200$–$500$), resulting in heavier tails in the null distribution of $T_w$. This effect is compounded by the less reliable estimation of the error variance under road conditions and the unaccounted variance of the reference parameter $\theta_{sat}^{dg}$, which is itself estimated from limited data. Both factors inflate $T_w$ under $\mathcal{H}_0$, necessitating a higher threshold to maintain an acceptable false-alarm rate.

With a larger data set with known degreend paramters, the thresholds can be determined using statistically optimal selection criteria such as Neyman–Pearson \cite{lehmann2005testing, kay1998detection}, minimum cost (Bayes), or maximum $P_D - P_{FA}$ on the receiver operating characteristic (ROC) curve \cite{poor1998introduction}. This would require multiple truck runs under known catalyst conditions to characterize the null distribution, and runs at known aging levels to estimate the non-centrality parameter under $\mathcal{H}_1$ \cite{casella2002statistical}. Nevertheless, the results demonstrate that the proposed saturated-catalyst model enables a statistically grounded aging detection framework that performs reasonably well on both test-cell and truck data.

## Draft Sentence for Conclusion

The detection thresholds are currently selected empirically due to the limited amount of truck data available; with larger data sets, statistically optimal threshold selection criteria can be applied to further improve the detector's performance.

---

## 1. Asymptotic Ideal: β Should Be Universal

Under H₀ (no aging), the true parameter is θ_sat^true = θ_sat^dg. The asymptotic normality of the MLE gives:

$$\hat{\theta}_{sat} - \theta_{sat}^{dg} \sim \mathcal{N}(0, I^{-1}(\theta_{sat})) = \mathcal{N}(0, \sigma^2 (\Phi_{sat}^T \Phi_{sat})^{-1})$$

Defining z = (1/σ) L (θ̂_sat − θ_sat^dg), where Φ_sat^T Φ_sat = L^T L, we get z ~ N(0, I_p) and:

$$T_w = z^T z \sim \chi^2_p$$

**If this held exactly**, β would be determined solely by the desired false-alarm rate α from the χ²_p distribution and would be the **same** for any data source. The fact that it isn't points to a breakdown of the asymptotic assumptions.

---

## 2. Three Sources of Discrepancy

### 2.1 Finite-Sample Departure from Normality of θ̂_sat

The asymptotic normality θ̂_sat ~ N(θ, I⁻¹) is a Central Limit Theorem result. The Berry–Esseen bound [1] gives convergence rate O(1/√N_sat).

| Data Source       | Typical N_sat | % of Total Data |
|-------------------|---------------|-----------------|
| Test-cell RMC     | ~490–515      | ~20–21%         |
| Test-cell Hot-FTP | ~180–198      | ~28–31%         |
| Truck             | ~120–150      | ≤10%            |

With truck data having N_sat ≈ 120–150 vs test-cell having N_sat ≈ 200–500, the finite-sample distribution of θ̂_sat for trucks departs more from Gaussian, producing **heavier tails** in T_w than χ²_p predicts.

### 2.2 Plug-In Estimation of σ² in the Fisher Information

In practice, the Fisher information is computed with an estimated variance:

$$I(\hat{\theta}_{sat}) = \frac{1}{\hat{\sigma}^2} \Phi_{sat}^T \Phi_{sat}$$

So the actual statistic computed is:

$$T_w = \frac{1}{\hat{\sigma}^2} (\hat{\theta}_{sat} - \theta_{sat}^{dg})^T (\Phi_{sat}^T \Phi_{sat}) (\hat{\theta}_{sat} - \theta_{sat}^{dg})$$

This is analogous to using a **z-test when a t-test is appropriate**: dividing by σ̂² instead of the true σ² inflates the tails. The effect is worse when:

- **σ̂² is estimated from fewer samples** (truck data has fewer saturated-mode points)
- **Model misspecification biases σ̂²** — the half-normal error assumption is more accurate for controlled test-cell data than for truck data with unmodeled transients, sensor noise, and varying operating conditions. When σ̂² *underestimates* σ², T_w is systematically inflated under both hypotheses.

### 2.3 Reference θ_sat^dg Is Itself an Estimate

The Wald test treats θ_sat^dg as a known constant. In reality, it is estimated from data. The true variance of the difference is:

$$\text{Cov}(\hat{\theta}_{sat} - \theta_{sat}^{dg}) = I_{\text{test}}^{-1} + I_{\text{ref}}^{-1}$$

but the test uses only I_test, ignoring I_ref⁻¹.

- **Test-cell**: θ_sat^dg is averaged over 3 repeatable degreened runs (DG RMC 1, 2, 3) with N_sat ≈ 490 each, so I_ref⁻¹ is small relative to I_test⁻¹. The error is negligible.
- **Truck**: The reference comes from a single day's data with limited saturated samples, making I_ref⁻¹ non-negligible. This unaccounted variance **inflates the effective distribution of T_w under H₀** beyond χ²_p.

---

## 3. Additional Factor: Different Input Excitation

Even within test-cell data, the non-central χ² distribution under H₁ (aging) differs between RMC and Hot-FTP due to different input ranges (temperature, flow rate, urea dosing). The non-centrality parameter is:

$$\lambda = \frac{1}{\sigma^2} \delta\theta^T (\Phi_{sat}^T \Phi_{sat}) \delta\theta$$

where δθ = θ_sat^aged − θ_sat^dg. The eigenstructure of Φ_sat^T Φ_sat determines how sensitive T_w is to parameter changes in different directions. Truck data, with uncontrolled and varied driving conditions, produces a fundamentally different Φ_sat matrix from repeatable test-cell cycles — changing both the shape and scale of the T_w distribution under H₁.

This explains why even β_RMC ≠ β_hFTP (10 vs 4), not just β_truck ≠ β_test-cell.

---

## 4. Net Effect

All three effects in Section 2 inflate the tails of the *actual* finite-sample distribution of T_w under H₀ relative to the asymptotic χ²_p. All three are substantially worse for truck data. To maintain the same false-alarm probability:

$$P(T_w > \beta \mid H_0) = \alpha$$

β must be set much higher for truck data — hence β_truck = 250 vs β_RMC = 10 and β_hFTP = 4.

---

## 5. Potential Approaches to Reduce the Discrepancy

### 5.1 Bartlett Correction

Scale T_w by a correction factor (1 − c/N_sat) to improve the χ² approximation in finite samples [2]. The corrected statistic would be closer to χ²_p, allowing a more universal threshold.

### 5.2 Bootstrap the Null Distribution

Resample from degreened drive segments to empirically construct the null distribution of T_w for each truck [3]. Set β from the empirical quantile of this bootstrapped distribution. This removes reliance on the χ² approximation entirely.

### 5.3 F-Statistic Formulation

Divide T_w/p by an independent variance estimate with ν degrees of freedom to obtain an F_{p,ν} distribution [4]. This naturally accounts for the uncertainty in σ̂² and has heavier tails when ν is small — analogous to the z-test → t-test correction.

### 5.4 Neyman–Pearson with More Data

As noted in the paper, a larger truck data set would enable threshold selection via Neyman–Pearson criteria, directly targeting a desired false-alarm rate from the empirical distribution rather than relying on asymptotic theory.

---

## 6. Summary Table

| Factor                          | Test-Cell             | Truck                  | Effect on β          |
|---------------------------------|-----------------------|------------------------|----------------------|
| N_sat                           | 180–515               | 120–150                | ↑ β for truck        |
| % data in saturation            | 20–31%                | ≤10%                   | ↑ β for truck        |
| σ² estimation quality           | Good (controlled)     | Poor (road noise)      | ↑ β for truck        |
| Half-normal model fit           | Accurate              | Approximate            | ↑ β for truck        |
| θ_sat^dg reference quality      | 3 repeatable runs     | 1 day, limited data    | ↑ β for truck        |
| Input condition repeatability   | Identical cycles      | Varied driving         | ↑ β for truck        |

---

## References

- **[1]** Shao, J. (2003). *Mathematical Statistics*. 2nd ed., Springer. (Berry–Esseen bound, MLE asymptotics, and finite-sample convergence rates; Ch. 4.)
- **[2]** Davison, A.C. and Hinkley, D.V. (1997). *Bootstrap Methods and Their Application*. Cambridge University Press. (Bootstrap hypothesis testing and Bartlett-type corrections.)
- **[3]** Kay, S.M. (1998). *Fundamentals of Statistical Signal Processing, Volume II: Detection Theory*. Prentice Hall. (Neyman–Pearson threshold selection and Wald test.)
- **[4]** Lehmann, E.L. and Romano, J.P. (2005). *Testing Statistical Hypotheses*. 3rd ed., Springer. (Classical hypothesis testing framework, null distribution characterization, and F-test formulation.)
- **[5]** Casella, G. and Berger, R.L. (2002). *Statistical Inference*. 2nd ed., Duxbury/Thomson. (Non-central χ² distribution, non-centrality parameter, likelihood ratio and Wald tests; Ch. 10.)
- **[6]** Poor, H.V. (1998). *An Introduction to Signal Detection and Estimation*. 2nd ed., Springer. (ROC analysis and optimal threshold selection for detection problems.)

### Original/Classical References

- **[7]** Berry, A.C. (1941). "The accuracy of the Gaussian approximation to the sum of independent variates." *Transactions of the American Mathematical Society*, 49(1), 122–136.
- **[8]** Esseen, C.G. (1942). "On the Liapunoff limit of error in the theory of probability." *Arkiv för Matematik, Astronomi och Fysik*, 28A(9), 1–19.
- **[9]** Bartlett, M.S. (1937). "Properties of sufficiency and statistical tests." *Proceedings of the Royal Society of London. Series A*, 160(901), 268–282.
- **[10]** Efron, B. (1979). "Bootstrap methods: Another look at the jackknife." *The Annals of Statistics*, 7(1), 1–26.
- **[11]** Fisher, R.A. (1925). *Statistical Methods for Research Workers*. Oliver and Boyd, Edinburgh.
- **[12]** Johnson, N.L., Kotz, S., and Balakrishnan, N. (1995). *Continuous Univariate Distributions, Volume 2*. 2nd ed., Wiley.
- **[13]** Van Trees, H.L. (2001). *Detection, Estimation, and Modulation Theory, Part I*. Wiley.
