# PHM Edits — Corrections Tracker

**Source PDF:** `SCR_SatSys_Feb26 phm edits.pdf`
**Compared against:** Current LaTeX source (repo `SCR_SatSysID_JDSMC`)

> **Status Legend:**
> - ✅ Fixed
> - ❌ Not Fixed
> - ⚠️ Needs Verification / Unclear mapping

---

## Category A — Quick Mechanical Fixes

Single-character or single-word changes that can be applied directly with no ambiguity.

| # | Correction | LaTeX File | Line(s) | Status |
|---|-----------|-----------|---------|--------|
| 8 | **Remove comma** after "where" → `where` not `where,` | `secs/2-subs/2-0-sat_NOx_deriv.tex` | 113 | ✅ |
| 20 | **Remove comma** after "where" → `where` not `where,` | `secs/5-catalyst_aging.tex` | 20 | ✅ |
| 25 | **Remove comma** after "where" → `where` not `where,` | `secs/3-subs/3-0-Apx-MLE_derivation.tex` | 23 | ✅ |
| 9 | "reduction**.**" → **"reduction:"** (period → colon before equation) | `secs/2-subs/2-4-NOx_crosssensitivity.tex` | 7 | ✅ |
| 10 | "measurements**.**" → **"measurements:"** (period → colon before equation) | `secs/2-subs/2-4-NOx_crosssensitivity.tex` | 11 | ✅ |
| 12 | "system**.**" → **"system:"** (period → colon before equation) | `secs/3-MLE_estimation.tex` | 8 | ✅ |
| 17 | **"cross- sensitivity"** → **"cross-sensitivity"** (remove space from line break) | `secs/3-subs/3-4-NOx_sensor_results.tex` | 4–5 | ✅ |
| 24 | **"test- cell"** → **"test-cell"** (remove space from line break) | `secs/7-conclusion.tex` | 8–9 | ✅ |
| 22 | "value" → **"values"** (plural) | `secs/5-catalyst_aging.tex` | 55 | ✅ |
| 23 | "is" → **"are"** (subject-verb agreement with "values") | `secs/5-catalyst_aging.tex` | 55 | ✅ |
| 26 | **`N` → `$N$`** (put in math-mode / italic) | `secs/3-subs/3-0-Apx-MLE_derivation.tex` | 23 | ✅ |
| 13–14 | **Remove `(\ref{eqn::eta_bound})`** — redundant equation ref after "bounding condition" | `secs/2-subs/2-1-relative_response.tex` | 8 | ✅ |

---

## Category B — Grammar / Rewording

Small sentence-level changes requiring a phrase edit.

| # | Correction | LaTeX File | Line(s) | Status |
|---|-----------|-----------|---------|--------|
| 4 | "Let" → **"Letting"** (participial phrase: "Letting...we get,") | `secs/2-subs/2-0-sat_NOx_deriv.tex` | 48 | ✅ |
| 5 | "a similar approach to derive" → **"a similar approach to that used to derive"** | `secs/2-subs/2-0-sat_NOx_deriv.tex` | 67–68 | ✅ |
| 6–7 | Reword: "The above approximate models for temperature introduce dependence of the parameter estimates based on temperature ranges" → **"The above approximate models for temperature dependence introduce parameter estimates that depend on temperature ranges"** | `secs/2-subs/2-0-sat_NOx_deriv.tex` | 102–103 | ✅ |
| 27 | **Remove "within the duration"** — reads: "not saturated within the duration for a significant length of time" → "not saturated for a significant length of time" | `secs/3-subs/3-1-Apx-necessary_condition.tex` | 3 | ✅ |
| 29 | "for each truck" → **"for Trucks A, B, C, and D, respectively"** | `secs/6-subs/6-0-Apx_Truck.tex` | 4 | ✅ |

---

## Category C — Content / Definition Additions

Require adding new text, definitions, figures, or explanatory paragraphs.

| # | Correction | LaTeX File | Line(s) | Status |
|---|-----------|-----------|---------|--------|
| 18 | **Define "DG"** (add to abbreviation list) and **explain "degreened"** in text on first use | `secs/0-symb_list.tex` (~line 43) and `secs/4-catalyst_mode_detection.tex` (lines 17, 26) | — | ✅ |
| 19 | **Sticky Note:** "Where is the degreened plot?" — clarify that the existing figure IS the degreened plot, or add a separate aged-catalyst figure | `secs/4-catalyst_mode_detection.tex` | 17 | ✅ |
| 28 | **Sticky Note:** "Clearly spell out the difference between these two figures" — add text distinguishing `eta_sim.png` vs `eta_sat.png` | `secs/3-subs/3-1-Apx-necessary_condition.tex` | 21 | ✅ |
| 30 | **Sticky Note:** "Explain what distinguishes the two sets of entries in each table" — add sentence explaining earlier-year vs. latter-year drive segments in appendix tables | `secs/6-subs/6-0-Apx_Truck.tex` | 6 | ✅ |

---

## Category D — Needs Verification

Annotation text was ambiguous; requires visual inspection of the annotated PDF to confirm exact location or intent.

| # | Correction | LaTeX File | Line(s) | Notes |
|---|-----------|-----------|---------|-------|
| 1 | Add comma: "time**,**" — "in discrete time, considering the" | `secs/1-intro.tex` | 49 | ✅ Fixed |
| 2 | "Reference [4]" — add "Reference~" before bare `\cite{nova2014urea}` | `secs/2-SatSys_model.tex` | 8 | ✅ Fixed |
| 3 | "catalyst" → **"catalysts"** (plural) — "both the SCR and the ASC catalysts" | `secs/2-SatSys_model.tex` | 10 | ✅ Fixed |
| 11 | Notation: **"$\eta_{sat}$ and $\eta$"** — add "and" between `$\eta_{sat}, \eta$` | `secs/3-MLE_estimation.tex` | 14 | ✅ Fixed |
| 15 | **Replace period with comma** in/near LP formulation | `secs/3-MLE_estimation.tex` | ~24 | ✅ Fixed by user |
| 16 | **Should this be $\hat\theta$?** — bare $\theta$ vs $\hat\theta_{sat}$ | `secs/3-subs/3-1-theta_dist.tex` | ~10 | ✅ Intentionally correct (Fisher info at true value) |
| 21 | **"Have you defined this?"** — MLE used | `secs/3-subs/3-1-theta_dist.tex` | 3 | ✅ No action — MLE defined in Sec 3 title and `0-symb_list.tex` |

---

## Summary by Category

| Category | Description | Count | Status |
|----------|------------|-------|--------|
| **A** | Quick Mechanical Fixes | 12 | All ✅ Fixed |
| **B** | Grammar / Rewording | 5 | All ✅ Fixed |
| **C** | Content / Definition Additions | 4 | All ✅ Fixed |
| **D** | Needs Verification | 7 | All ✅ Resolved |
| | **Total** | **28** (30 annotations, 2 merged) | |

---

## Quick-Reference: All "where," Locations

The reviewer flagged "where," (remove comma) three times. All three annotated occurrences are now fixed:

| File | Line |
|------|------|
| `secs/2-subs/2-0-sat_NOx_deriv.tex` | 113 |
| `secs/5-catalyst_aging.tex` | 20 |
| `secs/3-subs/3-1-theta_dist.tex` | 10 |
| `secs/3-subs/3-0-Apx-MLE_derivation.tex` | 23 |

> **Note:** The reviewer only annotated 3 of these 4 (pages 3, 6, 8). The one in `3-1-theta_dist.tex` was not annotated but has the same pattern.
