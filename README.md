# Cloud Kitchen Business Intelligence System

This project simulates a real-world analytics engagement for a takeaway and delivery restaurant called **Cloud Kitchen**.

The objective was to design a backend data system and analytical dashboards that help management monitor sales performance, ingredient usage, and labour efficiency.

---

## Project Overview

Cloud Kitchen operates as an online-only pizzeria handling pickup and delivery orders.  
The business generates operational data daily but lacked a structured way to transform that data into decisions.

This project builds a full Business Intelligence workflow:

**Database → Transformation → Visualization → Operational Insights**

---

## Tools & Technologies

- **MySQL** — relational database design & SQL views
- **Tableau** — interactive dashboards
- **Data Modeling** — normalization & entity relationships
- **CSV Data Pipelines** — analytical dataset preparation

---

## System Architecture

1. A normalized operational database stores orders, inventory, and staff records
2. SQL views transform transactional data into analytical datasets
3. Tableau dashboards visualize performance for decision-making

---

## Dashboards Built

### 1. Sales Performance Dashboard
Tracks revenue and customer behavior

Key metrics:
- Total orders
- Total sales
- Average order value
- Sales by category
- Peak ordering hours
- Top selling items

---

### 2. Inventory Monitoring Dashboard
Monitors ingredient usage and stock health

Key metrics:
- Ingredient consumption
- Cost contribution per ingredient
- Remaining stock percentage
- Reorder alerts

---

### 3. Staff Performance Dashboard
Evaluates labour efficiency and cost

Key metrics:
- Total labour cost
- Total labour hours
- Cost per labour hour
- Cost by staff member
- Cost by role

---

## Key Insights

- Evening hours drive most customer orders
- Cheese is the primary cost driver despite flour being the most used ingredient
- Some ingredients require scheduled restocking to avoid service disruption
- Labour cost differences are driven by wage rate rather than hours worked

---

## Business Impact

The solution allows the business to:

- Predict peak demand periods
- Prevent stock shortages
- Monitor operational costs
- Improve decision-making using data

---


## Project Structure

```text
cloud-kitchen-business-intelligence/
├── 1_project_brief/
│   └── project_brief.pdf
├── 2_data_model/
│   ├── erd.png
│   └── database_schema.sql
├── 3_sql_views/
│   ├── vw_order_sales.sql
│   ├── vw_inventory_status.sql
│   ├── vw_ingredient_usage.sql
│   ├── vw_ingredient_cost.sql
│   └── vw_staff_cost.sql
├── 4_dashboards/
│   ├── orders_dashboard.png
│   ├── inventory_dashboard.png
│   └── staff_dashboard.png
├── 5_insights/
│   └── executive_summary.pdf
└── README.md

```


## Conclusion

This project demonstrates the end-to-end responsibilities of a data analyst:
designing a data model, transforming raw operational data, and delivering insights that support business decisions.

The focus is not just visualization — but operational intelligence.





