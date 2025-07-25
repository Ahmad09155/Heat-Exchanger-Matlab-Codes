# Heat Exchanger MATLAB Codes

This repository contains MATLAB scripts developed to solve common heat exchanger problems using both the **LMTD method** and the **Effectiveness-NTU method**. The scripts are modular and can be reused or adapted for various configurations and fluid properties.

* Contents:

| File Name          | Description |
|------------------  |-------------|
| `LMTD_counter.m`   |  Calculates outlet temperatures and required area for counter-flow configuration using LMTD. 
| `LMTD_parallel.m`  | Same as above but for parallel-flow exchangers. |
| `effectiveness.m`  | NTU-effectiveness method calculation. |
| `exchanger_area.m` | Calculates required area from Q, U, and ΔT. |
| `heat_rate.m`      | Calculates rate of heat transfer. |
| `overall_coeff.m`  | Computes overall heat transfer coefficient U. |
| `conv_coeff.m`     | Calculates convective heat transfer coefficient (h). |
| `correction.m`     | Applies correction factor for LMTD in multipass exchangers. |
| `R_cond.m`         | Thermal resistance due to conduction. |
| `dittus.m`         | Applies Dittus-Boelter equation to calculate nusselt number. |
| `reynold.m`        | Calculates Reynolds number to determine flow regime. |

*  Features:

- Applicable for typical engineering problems involving:
  - Single or multipass heat exchangers
  - Counter-flow / Parallel-flow configurations
  - Air-water, water-water, or oil-water systems
- Modular code structure for easy reuse
- Clear variable names and comments (in progress)

* Requirements:

- MATLAB (any recent version), or GNU Octave.
- Basic understanding of heat transfer concepts (NTU, LMTD, U, h, Q)

* Author:

Ahmad M. Hassan
Chemical Engineering Student | Sudan  

Chemical engineering student interested in process simulation and engineering problem-solving through MATLAB and Python coding.
  
GitHub: [Ahmad09155](https://github.com/Ahmad09155)

---

* License:

This project is open-source. Feel free to use, modify, and distribute.
