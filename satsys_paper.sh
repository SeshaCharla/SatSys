#!/bin/bash
# Script to compress only the files required to build the LaTeX project into a zip archive.
# Output: satsys_paper.zip

PROJ_DIR="$(cd "$(dirname "$0")" && pwd)"
OUTPUT="satsys_paper.zip"

cd "$PROJ_DIR" || exit 1

# Remove old archive if it exists
rm -f "$OUTPUT"

cp SCR_SatSys.tex root.tex

zip -r "$OUTPUT" \
    root.tex \
    SCR_SatSys.bbl \
    asmejour.bst \
    asmejour.cls \
    leftindex.sty \
    refs.bib \
    ltx_core/ltx_pkgs.tex \
    ltx_core/new_cmds.tex \
    ltx_core/lst_style.tex \
    secs/0-abstract.tex \
    secs/0-symb_list.tex \
    secs/1-intro.tex \
    secs/2-SatSys_model.tex \
    secs/2-subs/2-0-sat_NOx_deriv.tex \
    secs/2-subs/2-1-relative_response.tex \
    secs/2-subs/2-4-NOx_crosssensitivity.tex \
    secs/3-MLE_estimation.tex \
    secs/3-subs/3-1-theta_dist.tex \
    secs/3-subs/3-2-eta_sat_variance.tex \
    secs/3-subs/3-3-FTIR_results.tex \
    secs/3-subs/3-4-NOx_sensor_results.tex \
    secs/3-subs/3-6-limitations.tex \
    secs/3-subs/3-0-Apx-MLE_derivation.tex \
    secs/3-subs/3-1-Apx-necessary_condition.tex \
    secs/4-catalyst_mode_detection.tex \
    secs/5-catalyst_aging.tex \
    secs/6-trucks.tex \
    secs/6-subs/6-0-Apx_Truck.tex \
    secs/7-conclusion.tex \
    secs/n-appendix.tex \
    figs/1_intro/SCR-ASC_ModelReduction.png \
    figs/2_mdl/plug_flow_discrete.png \
    figs/2_mdl/cross_aged_hftp.png \
    figs/3_parm_ID/apx_necessary/eta_sim.png \
    figs/3_parm_ID/apx_necessary/eta_sat.png \
    figs/4_cat_mode/SatDetect_dg_rmc_1_FTIR.png \
    figs/5_aging/AgingDiff.png \
    figs/5_aging/aging_factor_ssd.png \
    figs/5_aging/aging_factor_iod.png

# Rename SCR_SatSys.tex to root.tex inside the archive
rm root.tex

echo ""
echo "Created $OUTPUT ($(du -h "$OUTPUT" | cut -f1))"
