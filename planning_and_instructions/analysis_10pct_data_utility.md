# Justification: Why Is the Detector Useful If Only ~10% of Truck Data Is Near Saturation?

## The Question

The proposed aging detector relies on saturated-mode samples for parameter estimation and hypothesis testing. In truck data, only ≤10% of samples are close to catalyst saturation, compared to 20–31% in test-cell experiments. Why is the detector still useful?

---

## Draft Paragraph for Paper

The requirement that only saturated-mode data be used for parameter estimation is not a limitation of the detector but a deliberate design choice that enables tractable, convex parameter estimation from real-world data. The saturated-catalyst response is the only operating mode for which the $\nox$ reduction is independent of the unobservable catalyst state $\gamma(k)$ and depends solely on measurable inputs — inlet $\nox$, flow rate, and temperature. This makes the parameter estimation problem linear in parameters and solvable via linear programming, avoiding the non-convex, nonlinear estimation problems that arise when modeling the full switched system. While only a fraction of the truck data falls in this regime, the detector does not discard the remaining data entirely — the bounding condition $\eta_{sat}(k) \geq \eta(k)$ uses all data points to constrain the parameter estimates. The saturated-mode samples serve as the informative subset where the model prediction error is small enough to validate the estimates and perform hypothesis testing. The practical implication is that a truck accumulating data over days or weeks of driving will naturally encounter sufficient high-load, high-dosing conditions to populate this regime, making the approach viable for onboard diagnostics without requiring controlled test conditions.

---

## Detailed Analysis

### 1. Only Saturated Mode Yields a Tractable Estimation Problem

The full system dynamics depend on the unobservable state $\gamma(k)$ (average adsorbed ammonia concentration), which switches between saturation ($\gamma = \Gamma$), normal operation ($0 < \gamma < \Gamma$), and empty ($\gamma = 0$). Estimating parameters from normal-mode data requires knowledge of $\gamma(k)$, leading to:
- A nonlinear, non-convex estimation problem
- Dependence on state observers that themselves require known parameters
- Sensitivity to ammonia sensor availability (not present on commercial trucks)

Under saturation, $\gamma(k) = \Gamma$ is known, and the model reduces to:

$$\eta_{sat}(k+1) = \phi_{sat}^T(k) \, \theta_{sat}$$

This is **linear in parameters** — the only regime where convex estimation is possible without ammonia sensors or state observers.

### 2. All Data Contributes Through the Bounding Condition

The parameter estimation is formulated as a linear program:

$$\min \sum \eta_{sat}(k) \quad \text{s.t.} \quad \eta_{sat}(k) \geq \eta(k) \quad \forall k$$

The constraint $\eta_{sat}(k) \geq \eta(k)$ applies to **every data point**, not just saturated ones. The non-saturated data points act as lower-bound constraints that prevent the parameter estimates from being trivially large. The saturated-mode data points are where $\eta_{sat}(k) \approx \eta(k)$ (the bound is tight), making them the most informative for pinning down the parameter values. Thus, it is incorrect to say only 10% of the data is "used" — all data constrains the estimate, but 10% provides the tightest constraints.

### 3. 10% Is Sufficient for Asymptotic Properties

The Wald test requires $N_{sat}$ to be large enough for the MLE to be approximately normal. With truck drive segments pruned to $N_{sat} \geq 120$–$150$:
- Even at 10% saturation rate, a drive segment of 1200–1500 total samples (20–25 minutes at 1 Hz) yields sufficient saturated-mode data.
- Long-haul trucks routinely operate for hours per segment, providing ample opportunity to accumulate saturated-mode samples during high-load conditions (highway driving, hill climbing, heavy payload).

### 4. Saturation Is a Physically Natural Condition

Catalyst saturation occurs when the urea dosing rate is high relative to the NOₓ load, or when high flow rates reduce residence time to the point where NOₓ reduction is limited by the reaction kinetics rather than ammonia availability. These conditions arise naturally during:
- Highway cruising at steady high load
- Aggressive dosing strategies for NOₓ compliance
- High-temperature operation where adsorption capacity ($\Gamma$) is reduced

The 10% figure reflects typical mixed driving. Targeted data collection during known high-load conditions could increase this fraction significantly.

### 5. Comparison with Alternative Approaches

| Approach | Data Requirement | Sensors Needed | Estimation Problem |
|---|---|---|---|
| Full CSTR observer [Ma, 2017] | All operating modes | NOₓ + NH₃ | Nonlinear, non-convex |
| OBD logic [Matsumoto, 2016] | Specific test conditions | NOₓ + NH₃ | Heuristic |
| **Proposed (saturation-based)** | **~10% near saturation** | **NOₓ only** | **Linear program (convex)** |

The proposed approach trades data volume for tractability and sensor simplicity. It requires only NOₓ sensors (already standard on commercial trucks) and solves a convex optimization problem — a favorable tradeoff for onboard diagnostics.

### 6. What If Saturation Data Is Insufficient?

As noted in the paper's limitations, if the data set does not contain sufficient saturated-mode response, the algorithm estimates parameters using the maximum observed ammonia concentration as a proxy for saturation. This produces biased but still informative estimates. The $N_{sat}^{min}$ threshold ensures this fallback is avoided when making aging detection decisions.

---

## Draft Sentence for Conclusion

Although only a fraction of the truck data corresponds to near-saturation conditions, the proposed approach exploits this regime specifically because it is the only operating mode where the system parameters can be estimated using a convex formulation without requiring ammonia sensors or state observers, making it uniquely suited for onboard diagnostics using commercially available sensor configurations.

---

## References

- **[1]** Ma, Y. et al. (2017). Observer-based catalyst aging detection. *(already in paper's refs)*
- **[2]** Matsumoto, A. et al. (2016). OBD logic for catalyst aging. *(already in paper's refs)*
- **[3]** Devarakonda, M. et al. (2008). Adequacy of single CSTR model. *(already in paper's refs)*
