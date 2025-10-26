# Adversarial Robustness of Jet-Flavour Tagging in CMS

This repository contains my Bachelor thesis completed at **RWTH Aachen University**
(Physics Institute III A), where I investigate the robustness of the **DeepJet**
jet-flavour tagging algorithm under **adversarial input perturbations**.

**Grade:** 1.0 — supervised by  
- Prof. Dr. Alexander Schmidt (CMS III A)  
- Prof. Dr. Johannes Erdmann (CMS III A)
---

## 🧠 Research Summary

Jet-flavour taggers such as **DeepJet** distinguish jets originating from **b**, **c**, or
light-flavor quarks using hundreds of low-level particle-flow features. While adversarial
attacks are well-studied in computer vision, their effect in **high-energy physics** is still
largely unexplored — especially for **discrete-valued input features** such as multiplicities
or vertex counts.

This thesis introduces:

### **Probabilistic Integer Perturbation (PIP)**
A gradient-guided adversarial attack that perturbs *discrete* jet features in a physically
meaningful way, without continuous relaxations.

### **PIP-PGD Hybrid Attack**
A combined attack that simultaneously perturbs:
- continuous inputs (via PGD), and
- discrete inputs (via PIP),

revealing **complementary vulnerabilities** of DeepJet.

### **Key Findings**
- DeepJet is vulnerable not only to continuous perturbations (PGD),  
  but also to informed integer perturbations (PIP).
- The combined **PIP-PGD** attack yields the **largest performance degradation**.
- **Adversarial training** using PIP-PGD improves robustness across attack types.

---

## 📄 Full Thesis

| File | Description |
|------|-------------|
| `thesis.pdf` | Full 45-page thesis (methods, experiments, results, and discussion). |
| `src/*` | Full latex source code of the thesis. |

---

## 🔧 Technologies & Frameworks
- **PyTorch**
- **b-hive** (modular training framework for object-tagging)
- CMS **particle-flow** & **DeepJet** dataset
- Adversarial ML techniques (FGSM, PGD, custom discrete attacks)
---

