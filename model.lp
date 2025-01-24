\* Source Pyomo model name=unknown *\

min 
objective:
+1 satisfied_demand(0_1_A)
+1 satisfied_demand(0_1_B)
+1 satisfied_demand(0_1_C)
+1 satisfied_demand(0_1_D)
+1 satisfied_demand(0_2_A)
+1 satisfied_demand(0_2_B)
+1 satisfied_demand(0_2_C)
+1 satisfied_demand(0_2_D)
+1 satisfied_demand(0_3_A)
+1 satisfied_demand(0_3_B)
+1 satisfied_demand(0_3_C)
+1 satisfied_demand(0_3_D)
+1 satisfied_demand(1_2_A)
+1 satisfied_demand(1_2_B)
+1 satisfied_demand(1_2_C)
+1 satisfied_demand(1_2_D)
+1 satisfied_demand(1_3_A)
+1 satisfied_demand(1_3_B)
+1 satisfied_demand(1_3_C)
+1 satisfied_demand(1_3_D)
+1 satisfied_demand(2_3_A)
+1 satisfied_demand(2_3_B)
+1 satisfied_demand(2_3_C)
+1 satisfied_demand(2_3_D)

s.t.

r_l_production_capacity_rule(0_A)_:
+1 production(0_A)
>= 0

r_u_production_capacity_rule(0_A)_:
+1 production(0_A)
<= 100

c_e_production_capacity_rule(0_B)_:
+1 production(0_B)
= 0

r_l_production_capacity_rule(0_C)_:
+1 production(0_C)
>= 0

r_u_production_capacity_rule(0_C)_:
+1 production(0_C)
<= 100

c_e_production_capacity_rule(0_D)_:
+1 production(0_D)
= 0

r_l_production_capacity_rule(1_A)_:
+1 production(1_A)
>= 0

r_u_production_capacity_rule(1_A)_:
+1 production(1_A)
<= 100

c_e_production_capacity_rule(1_B)_:
+1 production(1_B)
= 0

r_l_production_capacity_rule(1_C)_:
+1 production(1_C)
>= 0

r_u_production_capacity_rule(1_C)_:
+1 production(1_C)
<= 100

c_e_production_capacity_rule(1_D)_:
+1 production(1_D)
= 0

r_l_production_capacity_rule(2_A)_:
+1 production(2_A)
>= 0

r_u_production_capacity_rule(2_A)_:
+1 production(2_A)
<= 150

c_e_production_capacity_rule(2_B)_:
+1 production(2_B)
= 0

r_l_production_capacity_rule(2_C)_:
+1 production(2_C)
>= 0

r_u_production_capacity_rule(2_C)_:
+1 production(2_C)
<= 150

c_e_production_capacity_rule(2_D)_:
+1 production(2_D)
= 0

r_l_production_capacity_rule(3_A)_:
+1 production(3_A)
>= 0

r_u_production_capacity_rule(3_A)_:
+1 production(3_A)
<= 150

c_e_production_capacity_rule(3_B)_:
+1 production(3_B)
= 0

r_l_production_capacity_rule(3_C)_:
+1 production(3_C)
>= 0

r_u_production_capacity_rule(3_C)_:
+1 production(3_C)
<= 150

c_e_production_capacity_rule(3_D)_:
+1 production(3_D)
= 0

c_e_unsatisfied_demand_rule(0_A)_:
-1 satisfied_demand(0_1_A)
-1 satisfied_demand(0_2_A)
-1 satisfied_demand(0_3_A)
+1 unsatisfied_demand(0_A)
= 0

c_e_unsatisfied_demand_rule(0_B)_:
-0.8 satisfied_demand(0_1_B)
-0.6666666666666666 satisfied_demand(0_2_B)
-0.5714285714285714 satisfied_demand(0_3_B)
+1 unsatisfied_demand(0_B)
= 0

c_e_unsatisfied_demand_rule(0_C)_:
-0.8 satisfied_demand(0_1_C)
-0.6666666666666666 satisfied_demand(0_2_C)
-0.5714285714285714 satisfied_demand(0_3_C)
+1 unsatisfied_demand(0_C)
= 0

c_e_unsatisfied_demand_rule(0_D)_:
-0.8 satisfied_demand(0_1_D)
-0.6666666666666666 satisfied_demand(0_2_D)
-0.5714285714285714 satisfied_demand(0_3_D)
+1 unsatisfied_demand(0_D)
= 0

c_e_unsatisfied_demand_rule(1_A)_:
-1 satisfied_demand(1_2_A)
-1 satisfied_demand(1_3_A)
+1 unsatisfied_demand(1_A)
= 0

c_e_unsatisfied_demand_rule(1_B)_:
-0.8 satisfied_demand(1_2_B)
-0.6666666666666666 satisfied_demand(1_3_B)
+1 unsatisfied_demand(1_B)
= 0

c_e_unsatisfied_demand_rule(1_C)_:
-0.8 satisfied_demand(1_2_C)
-0.6666666666666666 satisfied_demand(1_3_C)
+1 unsatisfied_demand(1_C)
= 0

c_e_unsatisfied_demand_rule(1_D)_:
-0.8 satisfied_demand(1_2_D)
-0.6666666666666666 satisfied_demand(1_3_D)
+1 unsatisfied_demand(1_D)
= 0

c_e_unsatisfied_demand_rule(2_A)_:
-1 satisfied_demand(2_3_A)
+1 unsatisfied_demand(2_A)
= 0

c_e_unsatisfied_demand_rule(2_B)_:
-0.8 satisfied_demand(2_3_B)
+1 unsatisfied_demand(2_B)
= 0

c_e_unsatisfied_demand_rule(2_C)_:
-0.8 satisfied_demand(2_3_C)
+1 unsatisfied_demand(2_C)
= 0

c_e_unsatisfied_demand_rule(2_D)_:
-0.8 satisfied_demand(2_3_D)
+1 unsatisfied_demand(2_D)
= 0

c_e_unsatisfied_demand_rule(3_A)_:
+1 unsatisfied_demand(3_A)
= 0

c_e_unsatisfied_demand_rule(3_B)_:
+1 unsatisfied_demand(3_B)
= 0

c_e_unsatisfied_demand_rule(3_C)_:
+1 unsatisfied_demand(3_C)
= 0

c_e_unsatisfied_demand_rule(3_D)_:
+1 unsatisfied_demand(3_D)
= 0

c_e_unsatisfied_constraint(0_A)_:
+1 unsatisfied_demand(0_A)
= 0

r_l_unsatisfied_constraint(0_B)_:
+1 unsatisfied_demand(0_B)
>= 0

r_u_unsatisfied_constraint(0_B)_:
+1 unsatisfied_demand(0_B)
<= 100

r_l_unsatisfied_constraint(0_C)_:
+1 unsatisfied_demand(0_C)
>= 0

r_u_unsatisfied_constraint(0_C)_:
+1 unsatisfied_demand(0_C)
<= 100

r_l_unsatisfied_constraint(0_D)_:
+1 unsatisfied_demand(0_D)
>= 0

r_u_unsatisfied_constraint(0_D)_:
+1 unsatisfied_demand(0_D)
<= 100

c_e_unsatisfied_constraint(1_A)_:
+1 unsatisfied_demand(1_A)
= 0

r_l_unsatisfied_constraint(1_B)_:
+1 unsatisfied_demand(1_B)
>= 0

r_u_unsatisfied_constraint(1_B)_:
+1 unsatisfied_demand(1_B)
<= 100

r_l_unsatisfied_constraint(1_C)_:
+1 unsatisfied_demand(1_C)
>= 0

r_u_unsatisfied_constraint(1_C)_:
+1 unsatisfied_demand(1_C)
<= 100

r_l_unsatisfied_constraint(1_D)_:
+1 unsatisfied_demand(1_D)
>= 0

r_u_unsatisfied_constraint(1_D)_:
+1 unsatisfied_demand(1_D)
<= 100

c_e_unsatisfied_constraint(2_A)_:
+1 unsatisfied_demand(2_A)
= 0

r_l_unsatisfied_constraint(2_B)_:
+1 unsatisfied_demand(2_B)
>= 0

r_u_unsatisfied_constraint(2_B)_:
+1 unsatisfied_demand(2_B)
<= 100

r_l_unsatisfied_constraint(2_C)_:
+1 unsatisfied_demand(2_C)
>= 0

r_u_unsatisfied_constraint(2_C)_:
+1 unsatisfied_demand(2_C)
<= 100

r_l_unsatisfied_constraint(2_D)_:
+1 unsatisfied_demand(2_D)
>= 0

r_u_unsatisfied_constraint(2_D)_:
+1 unsatisfied_demand(2_D)
<= 100

c_e_unsatisfied_constraint(3_A)_:
+1 unsatisfied_demand(3_A)
= 0

r_l_unsatisfied_constraint(3_B)_:
+1 unsatisfied_demand(3_B)
>= 0

r_u_unsatisfied_constraint(3_B)_:
+1 unsatisfied_demand(3_B)
<= 100

r_l_unsatisfied_constraint(3_C)_:
+1 unsatisfied_demand(3_C)
>= 0

r_u_unsatisfied_constraint(3_C)_:
+1 unsatisfied_demand(3_C)
<= 100

r_l_unsatisfied_constraint(3_D)_:
+1 unsatisfied_demand(3_D)
>= 0

r_u_unsatisfied_constraint(3_D)_:
+1 unsatisfied_demand(3_D)
<= 100

c_e_balance_rule(0_A)_:
+1 production(0_A)
+1 unsatisfied_demand(0_A)
-1 transport(A_B_0)
-1 transport(A_C_0)
= 0

c_e_balance_rule(0_B)_:
+1 production(0_B)
+1 unsatisfied_demand(0_B)
+1 transport(A_B_0)
= 100

c_e_balance_rule(0_C)_:
+1 production(0_C)
+1 unsatisfied_demand(0_C)
+1 transport(A_C_0)
-1 transport(C_D_0)
= 100

c_e_balance_rule(0_D)_:
+1 production(0_D)
+1 unsatisfied_demand(0_D)
+1 transport(C_D_0)
= 100

c_e_balance_rule(1_A)_:
-1 satisfied_demand(0_1_A)
+1 production(1_A)
+1 unsatisfied_demand(1_A)
-1 transport(A_B_1)
-1 transport(A_C_1)
= 0

c_e_balance_rule(1_B)_:
-1 satisfied_demand(0_1_B)
+1 production(1_B)
+1 unsatisfied_demand(1_B)
+1 transport(A_B_1)
= 100

c_e_balance_rule(1_C)_:
-1 satisfied_demand(0_1_C)
+1 production(1_C)
+1 unsatisfied_demand(1_C)
+1 transport(A_C_1)
-1 transport(C_D_1)
= 100

c_e_balance_rule(1_D)_:
-1 satisfied_demand(0_1_D)
+1 production(1_D)
+1 unsatisfied_demand(1_D)
+1 transport(C_D_1)
= 100

c_e_balance_rule(2_A)_:
-1 satisfied_demand(0_2_A)
-1 satisfied_demand(1_2_A)
+1 production(2_A)
+1 unsatisfied_demand(2_A)
-1 transport(A_B_2)
-1 transport(A_C_2)
= 0

c_e_balance_rule(2_B)_:
-1 satisfied_demand(0_2_B)
-1 satisfied_demand(1_2_B)
+1 production(2_B)
+1 unsatisfied_demand(2_B)
+1 transport(A_B_2)
= 100

c_e_balance_rule(2_C)_:
-1 satisfied_demand(0_2_C)
-1 satisfied_demand(1_2_C)
+1 production(2_C)
+1 unsatisfied_demand(2_C)
+1 transport(A_C_2)
-1 transport(C_D_2)
= 100

c_e_balance_rule(2_D)_:
-1 satisfied_demand(0_2_D)
-1 satisfied_demand(1_2_D)
+1 production(2_D)
+1 unsatisfied_demand(2_D)
+1 transport(C_D_2)
= 100

c_e_balance_rule(3_A)_:
-1 satisfied_demand(1_3_A)
-1 satisfied_demand(2_3_A)
+1 production(3_A)
+1 unsatisfied_demand(3_A)
-1 transport(A_B_3)
-1 transport(A_C_3)
= 0

c_e_balance_rule(3_B)_:
-1 satisfied_demand(1_3_B)
-1 satisfied_demand(2_3_B)
+1 production(3_B)
+1 unsatisfied_demand(3_B)
+1 transport(A_B_3)
= 100

c_e_balance_rule(3_C)_:
-1 satisfied_demand(1_3_C)
-1 satisfied_demand(2_3_C)
+1 production(3_C)
+1 unsatisfied_demand(3_C)
+1 transport(A_C_3)
-1 transport(C_D_3)
= 100

c_e_balance_rule(3_D)_:
-1 satisfied_demand(1_3_D)
-1 satisfied_demand(2_3_D)
+1 production(3_D)
+1 unsatisfied_demand(3_D)
+1 transport(C_D_3)
= 100

c_e_coverage_rule(0_3_A)_:
+1 satisfied_demand(0_3_A)
= 0

c_e_coverage_rule(0_3_B)_:
+1 satisfied_demand(0_3_B)
= 0

c_e_coverage_rule(0_3_C)_:
+1 satisfied_demand(0_3_C)
= 0

c_e_coverage_rule(0_3_D)_:
+1 satisfied_demand(0_3_D)
= 0

bounds
   0 <= satisfied_demand(0_1_A) <= +inf
   0 <= satisfied_demand(0_1_B) <= +inf
   0 <= satisfied_demand(0_1_C) <= +inf
   0 <= satisfied_demand(0_1_D) <= +inf
   0 <= satisfied_demand(0_2_A) <= +inf
   0 <= satisfied_demand(0_2_B) <= +inf
   0 <= satisfied_demand(0_2_C) <= +inf
   0 <= satisfied_demand(0_2_D) <= +inf
   0 <= satisfied_demand(0_3_A) <= +inf
   0 <= satisfied_demand(0_3_B) <= +inf
   0 <= satisfied_demand(0_3_C) <= +inf
   0 <= satisfied_demand(0_3_D) <= +inf
   0 <= satisfied_demand(1_2_A) <= +inf
   0 <= satisfied_demand(1_2_B) <= +inf
   0 <= satisfied_demand(1_2_C) <= +inf
   0 <= satisfied_demand(1_2_D) <= +inf
   0 <= satisfied_demand(1_3_A) <= +inf
   0 <= satisfied_demand(1_3_B) <= +inf
   0 <= satisfied_demand(1_3_C) <= +inf
   0 <= satisfied_demand(1_3_D) <= +inf
   0 <= satisfied_demand(2_3_A) <= +inf
   0 <= satisfied_demand(2_3_B) <= +inf
   0 <= satisfied_demand(2_3_C) <= +inf
   0 <= satisfied_demand(2_3_D) <= +inf
   0 <= production(0_A) <= +inf
   0 <= production(0_B) <= +inf
   0 <= production(0_C) <= +inf
   0 <= production(0_D) <= +inf
   0 <= production(1_A) <= +inf
   0 <= production(1_B) <= +inf
   0 <= production(1_C) <= +inf
   0 <= production(1_D) <= +inf
   0 <= production(2_A) <= +inf
   0 <= production(2_B) <= +inf
   0 <= production(2_C) <= +inf
   0 <= production(2_D) <= +inf
   0 <= production(3_A) <= +inf
   0 <= production(3_B) <= +inf
   0 <= production(3_C) <= +inf
   0 <= production(3_D) <= +inf
   0 <= unsatisfied_demand(0_A) <= +inf
   0 <= unsatisfied_demand(0_B) <= +inf
   0 <= unsatisfied_demand(0_C) <= +inf
   0 <= unsatisfied_demand(0_D) <= +inf
   0 <= unsatisfied_demand(1_A) <= +inf
   0 <= unsatisfied_demand(1_B) <= +inf
   0 <= unsatisfied_demand(1_C) <= +inf
   0 <= unsatisfied_demand(1_D) <= +inf
   0 <= unsatisfied_demand(2_A) <= +inf
   0 <= unsatisfied_demand(2_B) <= +inf
   0 <= unsatisfied_demand(2_C) <= +inf
   0 <= unsatisfied_demand(2_D) <= +inf
   0 <= unsatisfied_demand(3_A) <= +inf
   0 <= unsatisfied_demand(3_B) <= +inf
   0 <= unsatisfied_demand(3_C) <= +inf
   0 <= unsatisfied_demand(3_D) <= +inf
   0 <= transport(A_B_0) <= +inf
   0 <= transport(A_B_1) <= +inf
   0 <= transport(A_B_2) <= +inf
   0 <= transport(A_B_3) <= +inf
   0 <= transport(A_C_0) <= +inf
   0 <= transport(A_C_1) <= +inf
   0 <= transport(A_C_2) <= +inf
   0 <= transport(A_C_3) <= +inf
   0 <= transport(C_D_0) <= +inf
   0 <= transport(C_D_1) <= +inf
   0 <= transport(C_D_2) <= +inf
   0 <= transport(C_D_3) <= +inf
general
  satisfied_demand(0_1_A)
  satisfied_demand(0_1_B)
  satisfied_demand(0_1_C)
  satisfied_demand(0_1_D)
  satisfied_demand(0_2_A)
  satisfied_demand(0_2_B)
  satisfied_demand(0_2_C)
  satisfied_demand(0_2_D)
  satisfied_demand(0_3_A)
  satisfied_demand(0_3_B)
  satisfied_demand(0_3_C)
  satisfied_demand(0_3_D)
  satisfied_demand(1_2_A)
  satisfied_demand(1_2_B)
  satisfied_demand(1_2_C)
  satisfied_demand(1_2_D)
  satisfied_demand(1_3_A)
  satisfied_demand(1_3_B)
  satisfied_demand(1_3_C)
  satisfied_demand(1_3_D)
  satisfied_demand(2_3_A)
  satisfied_demand(2_3_B)
  satisfied_demand(2_3_C)
  satisfied_demand(2_3_D)
  production(0_A)
  production(0_B)
  production(0_C)
  production(0_D)
  production(1_A)
  production(1_B)
  production(1_C)
  production(1_D)
  production(2_A)
  production(2_B)
  production(2_C)
  production(2_D)
  production(3_A)
  production(3_B)
  production(3_C)
  production(3_D)
  unsatisfied_demand(0_A)
  unsatisfied_demand(0_B)
  unsatisfied_demand(0_C)
  unsatisfied_demand(0_D)
  unsatisfied_demand(1_A)
  unsatisfied_demand(1_B)
  unsatisfied_demand(1_C)
  unsatisfied_demand(1_D)
  unsatisfied_demand(2_A)
  unsatisfied_demand(2_B)
  unsatisfied_demand(2_C)
  unsatisfied_demand(2_D)
  unsatisfied_demand(3_A)
  unsatisfied_demand(3_B)
  unsatisfied_demand(3_C)
  unsatisfied_demand(3_D)
  transport(A_B_0)
  transport(A_B_1)
  transport(A_B_2)
  transport(A_B_3)
  transport(A_C_0)
  transport(A_C_1)
  transport(A_C_2)
  transport(A_C_3)
  transport(C_D_0)
  transport(C_D_1)
  transport(C_D_2)
  transport(C_D_3)
end
