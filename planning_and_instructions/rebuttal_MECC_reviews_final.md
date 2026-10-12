# Consolidated Rebuttal to MECC 2026 / JDSMC Peer Reviews

This document presents the detailed, formal responses to the comments raised by the Associate Editor (AE) and Reviewers 12, 14, and 18.

---

## Part 1: Response to the Associate Editor (AE)

### AE Comment 1:
> *Some technical details (e.g., justify the necessary condition of the proposed method based on sufficient data under vehicle working conditions) need to be clarified...*

#### Response:
We thank the Associate Editor for highlighting the need to clarify these technical details. We have addressed this in two ways within the revised manuscript:

1. **Role of Non-Saturated Data**: We clarify that although only a fraction of the operating data is close to saturation (approximately 10% in real-world truck data), the convex parameter estimation framework utilizes the **entire** dataset. The non-saturated data points establish the lower boundary constraints ($\eta(k) \le \eta_{sat}(k)$), which restrict the parameter space and prevent the estimates from collapsing.
2. **OBD Feasibility & False-Alarm Prevention**: In real-world vehicle operations, catalyst saturation occurs naturally during highway cruising, moderate-to-high load acceleration, or uphill driving. If a vehicle undergoes prolonged light-load or downhill driving where saturation is never triggered, the mode detection block will identify the lack of saturated samples. To prevent false alarms, the diagnostic system **defers its execution** (status "insufficient data") rather than running a hypothesis test on insufficient data. The system accumulates the required number of saturated samples ($120$–$150$ points) across driving cycles before executing the Wald-test detector.

#### Revisions in Manuscript:
We have added a detailed discussion justifying these necessary conditions and describing the practical OBD strategy in **Section 6** (page 7).

---

### AE Comment 2:
> *some writing issues (e.g., Appendix-?? on page 5) need to be revised.*

#### Response:
We apologize for this compilation error. The broken cross-reference `(Appendix-??)` was caused by a mismatched LaTeX label in the Appendix file. We have corrected the label mismatch, and it now compiles correctly.

#### Revisions in Manuscript:
The cross-reference has been updated to compile as `(Appendix A)` in **Section 3** (page 5).

---

## Part 2: Response to Reviewer 12

### R12 Comment 1:
> *The significance of this paper should be stated clearly.*

#### Response:
We thank the reviewer for this recommendation. We have added a dedicated paragraph in the Introduction to explicitly outline the three-fold significance of our work:
1. **Dynamic Modeling**: We propose a first-principles discrete-time input-output model derived from molar conservation that explicitly captures the interplay between gas parcel residence time and sensor sampling intervals.
2. **Convex Estimation without $\text{NH}_3$ Sensors**: We introduce a convex parameter estimation framework that bypasses the need for costly and fragile on-board ammonia ($\text{NH}_3$) sensors, while remaining robust to the unidirectional bias of commercial $\text{NO}_x$ sensors.
3. **Real-World Validation**: We develop and validate a Wald-test-based catalyst aging detector using both test-cell and real-world truck driving datasets.

#### Revisions in Manuscript:
The significance paragraph has been added to the end of **Section 1 (Introduction)** (page 2).

---

### R12 Comment 2:
> *There are some writing mistakes in this paper. Such as: In page 5, the expression of "(Appendix-??)" is wrong.*

#### Response:
We apologize for this LaTeX cross-referencing error. We have resolved the label mismatch in the source files.

#### Revisions in Manuscript:
The broken link is corrected to `(Appendix A)` in **Section 3** (page 5).

---

### R12 Comment 3:
> *The readers may want to see the clear comparison of experimental data and model results. It is better to present the figures but the numbers.*

#### Response:
We appreciate the reviewer's suggestion. To provide a clear visual comparison, we have added plots showing the measured $\text{NO}_x$ reduction $\eta(k)$ alongside the estimated boundary $\eta_{sat}(k)$ over time. These figures illustrate that the estimated model forms a tight, physically consistent upper bound on the experimental data under saturated conditions.

#### Revisions in Manuscript:
New figures showing time-series comparisons of experimental data and estimated boundaries have been inserted into **Section 3** (test-cell validation) and **Section 6** (truck data validation).

---

### R12 Comment 4:
> *The literature review is not sufficient. The limitations of the existing works are not clear.*

#### Response:
We have expanded the literature review to clearly define the limitations of existing SCR diagnostics:
- **Sensor Constraints**: State-of-the-art diagnostic methods often rely on ammonia ($\text{NH}_3$) sensors, which are not deployed in production commercial vehicles due to high cost and durability issues.
- **Complexity**: High-fidelity 1D distributed-parameter catalyst models are computationally prohibitive for real-time on-board diagnostics (OBD) processors.
- **Cross-Sensitivity**: Standard diagnostics are highly sensitive to the cross-sensitivity of commercial $\text{NO}_x$ sensors to $\text{NH}_3$, leading to false diagnostic alarms.

We have highlighted how our bounding-based parameter estimation addresses these three limitations.

#### Revisions in Manuscript:
The literature review and limitations section has been expanded in **Section 1 (Introduction)**.

---

## Part 3: Response to Reviewer 14

### R14 Comment 1:
> *Formatting of Chemical Compounds: $\text{NO}_x$, $\text{NH}_3$, $\text{O}_2$, and $\text{N}_2$ must be strictly rendered in roman font.*

#### Response:
We thank the reviewer for noting this formatting issue. We have updated all chemical symbols to ensure they are strictly rendered in roman font.

#### Revisions in Manuscript:
All occurrences of chemical symbols have been updated to `\text{NO}_x`, `\text{NH}_3`, `\text{O}_2`, and `\text{N}_2` throughout the text.

---

### R14 Comment 2:
> *Engineering Feasibility and Necessary Conditions: The authors state that a necessary condition... is that the data must contain a "sufficiently long" or "sufficiently many" samples close to catalyst saturation. However, during real-world heavy-duty truck operations, the vehicle may encounter prolonged light-load cruising, extended downhill driving, or specific conservative driving habits, which might result in entire driving segments failing to trigger catalyst saturation at all. Under such scenarios, will the system generate false alarms for catalyst aging? In a practical onboard OBD strategy, how long is the system expected to wait, or under what specific operating conditions can it ensure this necessary condition is satisfied? It is recommended that a supplementary description or discussion regarding this be added to the main text.*

#### Response:
We appreciate this practical engineering question.
1. **False Alarm Avoidance**: The diagnostic framework **will not generate false alarms** under non-saturating conditions (such as downhill driving or light-load cruising). The detector checks the size of the saturated sample set, $N_{sat}$, before executing. If $N_{sat}$ is below the statistical threshold required for estimator accuracy (e.g., $100$ samples), the detector defers the test and outputs an "insufficient data" status.
2. **OBD Waiting Strategy & Conditions**: Saturated conditions occur regularly during normal highway driving, moderate-to-high load acceleration, or uphill climbing. Under typical heavy-duty truck drive cycles, the minimum required $120$–$150$ saturated samples are accumulated within $1$–$2$ hours of operation. The OBD system is designed to accumulate these samples cumulatively across multiple drive cycles, ensuring robust diagnosis without false triggers.

#### Revisions in Manuscript:
A dedicated subsection discussing these engineering feasibility aspects, false-alarm mitigation, and OBD accumulation strategies has been added to **Section 6** (page 7).

---

### R14 Comment 3:
> *Interpretation of Threshold $\beta$: In the test-cell validation, the decision thresholds are set to $\beta_{\text{hFTP}} = 4.00$ and $\beta_{\text{RMC}} = 10.00$, respectively. Why is the threshold abruptly scaled up directly to $\beta_{\text{truck}} = 250$ in the real-world truck driving segment analysis?*

#### Response:
We thank the reviewer for the opportunity to clarify this threshold adjustment.
Under ideal, noise-controlled test-cell conditions, the Wald test statistic $T_w$ closely follows the asymptotic central $\chi^2_p$ distribution under the null hypothesis (no aging). Hence, the thresholds remain near theoretical critical values ($\beta = 4.00$ and $10.00$).

For real-world truck driving, the null distribution of $T_w$ is significantly inflated due to:
1. **Model Mismatch & Unaccounted Variance**: The reference "degraded" parameter set $\theta_{sat}^{dg}$ is estimated from historic data and possesses its own covariance, which is not fully accounted for in the simplified test statistic.
2. **High Transient Behavior**: Real-world operations feature heavy transients that violate the steady-state model assumptions, inflating the residual variance estimate $\hat{\sigma}^2$.
3. **Sample Size Variation**: Fewer saturated samples in short truck segments increase the variance of $\hat{\sigma}^2$.

Consequently, to maintain the desired low false-alarm rate (Type I error) under real vehicle conditions, the decision threshold is calibrated and scaled up to $\beta_{\text{truck}} = 250$.

#### Revisions in Manuscript:
We have added a section in **Section 6** providing the theoretical and practical justifications for the threshold calibration.

---

## Part 4: Response to Reviewer 18

### R18 Comment 1:
> *The proposed works suffers from the limitation that the parameter estimation algorithm fundamentally requires the data to contain segments where the catalyst is fully saturated... As the authors acknowledge, if the catalyst does not reach saturation, the algorithm incorrectly fits the maximum observed surface coverage as the absolute capacity, which would entirely skew the aging diagnostics. This is a severe bottleneck for real-world deployment, evidenced by the fact that the actual truck drive segments evaluated in the study featured very few samples (often under 10%) near saturation.*

#### Response:
We appreciate this constructive critique regarding the saturation requirement.
1. **Statistical Sufficiency**: While samples near saturation represent only about 10% of a drive segment, this is statistically sufficient. In a standard drive segment containing tens of thousands of data points, 10% translates to $N_{sat} \geq 120$–$150$ samples, which is ample for maximum likelihood estimators to reach asymptotic convergence.
2. **Estimation via the Entire Dataset**: The parameter estimation algorithm does not discard the remaining 90% of the data. Rather, non-saturated points serve as lower-bound inequality constraints ($\eta(k) \le \eta_{sat}(k)$). These constraints are critical because they prevent the upper-bounding function from collapsing and over-fitting.
3. **Engineering Trade-off**: The requirement of saturation is a deliberate design choice that enables the core novelty of this work. Saturated operation simplifies the highly nonlinear, unobservable ammonia coverage dynamics ($\theta$) into a static limit. This simplification allows us to formulate a convex parameter estimation framework **without requiring an on-board ammonia ($\text{NH}_3$) sensor**. Bypassing the need for an $\text{NH}_3$ sensor is a significant practical advantage that outweighs the bottleneck of waiting for saturating conditions.

#### Revisions in Manuscript:
We have clarified the statistical sufficiency of the 10% saturation rate and the role of non-saturated samples in **Section 6**.

---

### R18 Comment 2:
> *Furthermore, the authors note: "The saturated catalyst model’s response does not depend on the previous state but only on the inputs, making the response independent of the initial conditions." This effectively means (at least to my understanding) that the dynamics are irrelevant, and that is the reason a simple MLE point estimator suffices. In that sense, this paper does not fit the scope of MECC, because the system dynamics don't really matter.*

#### Response:
We respectfully disagree with the assertion that the system dynamics are irrelevant. The paper fits the MECC scope for three primary reasons:
1. **Hybrid/Switched System Dynamics**: The static saturated model describes only one operating mode of the catalyst. The overall SCR-ASC system is highly dynamic. The transition of the catalyst into and out of the saturated mode, and the identification of this mode using bound conditions, are dynamic system behaviors.
2. **Residence Time & Transport Dynamics**: The model is derived from the molar conservation partial differential equations (PDEs) of the gas phase. It incorporates the time-varying residence time $\tau(k)$, which captures the transport dynamics of the gas parcel and accounts for the dynamic interaction between gas flow speed and sensor sampling intervals.
3. **Time-Series Diagnostic Signal**: The Wald-test detector processes the time-series parameter trajectory, which is a dynamic signal evaluated over cycles.
