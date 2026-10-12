# MECC 2026 Best Student Paper Award — Nomination Materials

---

## 1. Paper Title and PaperPlaza (PaperCept) Paper ID

- **Paper Title:** Modelling and Parameter Estimation of Diesel Engine Aftertreatment System under Catalyst Saturation for Aging Diagnostics
- **PaperPlaza (PaperCept) Paper ID:** `MECC26_0026`

---

## 2. Student Author Information

| Field         | Details                                      |
|---------------|----------------------------------------------|
| **Name**      | Sesha Charla                                 |
| **Affiliation** | School of Mechanical Engineering, Purdue University, West Lafayette, Indiana, USA |
| **Email**     | scharla@purdue.edu                           |

---

## 3. Advisor Information

### Advisor 1

| Field         | Details                                      |
|---------------|----------------------------------------------|
| **Name**      | Peter H. Meckl (Fellow ASME)                 |
| **Affiliation** | School of Mechanical Engineering, Purdue University, West Lafayette, Indiana, USA |
| **Email**     | meckl@purdue.edu                             |

### Advisor 2

| Field         | Details                                      |
|---------------|----------------------------------------------|
| **Name**      | Bin Yao (Fellow ASME)                        |
| **Affiliation** | School of Mechanical Engineering, Purdue University, West Lafayette, Indiana, USA |
| **Email**     | byao@purdue.edu                              |

---

## 4. Nomination Letter Content


We are writing to nominate the paper titled *"Modelling and Parameter Estimation of Diesel Engine Aftertreatment System under Catalyst Saturation for Aging Diagnostics,"* authored by Sesha Charla, Peter H. Meckl, and Bin Yao, for the MECC 2026 Best Student Paper Award. Sesha Charla is the student author and the primary contributor to the intellectual and technical content of this work, carried out under our supervision at the School of Mechanical Engineering, Purdue University.

### Originality

This paper introduces a fundamentally new approach to modeling NOx reduction dynamics in diesel engine SCR (Selective Catalytic Reduction) systems and its application to catalyst aging diagnostics. Unlike the prevailing Continuously Stirred Tank Reactor (CSTR) paradigm, which has dominated the literature, this work  models the time evolution of sensor signals as a "plug" or "parcel" of exhaust gas flows through the catalytic chamber in discrete time, explicitly accounting for the interplay between the residence time of the reacting flow and the sensor sampling frequency. This discrete-time, residence-time-aware approach, is the first of its kind in the SCR modeling literature and resolves fundamental issues related to causality and sampling frequency that have limited prior approaches.

### Technical Contributions

The paper makes several significant technical contributions:

1. **Novel Switched Nonlinear Modelling Approach:** A dynamic model for NOx reduction under catalyst saturation is derived from first-principles molar conservation, capturing the system as one mode within a switched nonlinear framework. The model explicitly accounts for the residence time–sampling time interplay, which prior CSTR-based models fail to address.

2. **Convex Parameter Estimation under Partial Observability:** The model parameters are estimated via maximum-likelihood estimation using the bounding relationship between the actual and predicted NOx reduction under saturation. This formulation converts what is traditionally a non-convex, nonlinear parameter estimation problem into a tractable convex optimization problem, a substantial methodological advance.

3. **Handling of NOx Sensor Cross-Sensitivity:** The estimation framework explicitly addresses the cross-sensitivity of commercial NOx sensors to ammonia, a practical challenge that most prior works circumvent by assuming the availability of ammonia sensors, which are absent in commercial vehicles. 

4. **Catalyst Mode Detection:** A statistical method is developed to identify data segments where the catalyst is operating near saturation, providing actionable diagnostic information from routine operating data.

5. **Wald Test–Based Aging Detection:** A hypothesis-testing framework based on the Wald test is developed for detecting catalyst aging from the estimated parameters. This provides a principled statistical foundation for aging diagnostics, moving beyond ad-hoc threshold-based approaches.

### Significance and Potential Impact

The significance of this work is both theoretical and practical. On the theoretical side, the paper bridges modeling, system identification, and statistical detection theory in a unified framework for a class of switched nonlinear systems under partial observability, a challenging problem with broad applicability in reacting flow systems beyond diesel aftertreatment. On the practical side, it directly addresses a pressing regulatory and environmental need: reliable onboard diagnostics for catalyst aging in diesel vehicles. The proposed detector is validated not only on controlled test-cell data at multiple aging levels but also on real-world data from four long-haul trucks, demonstrating its readiness for deployment. The collaboration with Cummins, Inc., who provided test-cell, truck, and simulation data, underscores the industrial relevance and potential for near-term impact on commercial vehicle emissions compliance.

### Student's Intellectual and Technical Contributions

The student independently developed the novel modeling paradigm that departs from the CSTR framework, formulated the convex estimation algorithm, derived the statistical framework for mode detection and aging diagnostics, and implemented and validated the entire pipeline on both test-cell and real-world truck data. The mathematical formulations, spanning molar conservation modeling, maximum-likelihood estimation, convex optimization, and Wald test–based hypothesis testing reflect the readth and depth of technical expertise. His contributions encompass the full arc from first-principles modeling to experimental validation on real-world industrial data. 

We strongly believe this paper exemplifies the caliber of work that the MECC Best Student Paper Award is intended to recognize, and we wholeheartedly recommend it for your consideration.