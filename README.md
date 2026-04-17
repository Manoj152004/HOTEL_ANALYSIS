
# 🏨 Hotel Booking Analysis – Complete Data Analytics Project

## 📌 Project Title
**Hotel Booking Analysis: Revenue, Cancellation & Guest Behavior Analytics (2022-2023)**

---

## 🛠 Tools Used & Why

| Tool | Why I Used It |
|------|----------------|
| **Python (Pandas, NumPy)** | For data cleaning, handling missing values, and preprocessing messy CSV data |
| **Jupyter Notebook** | To write and test code interactively, visualize step-by-step results |
| **SQL (PostgreSQL)** | To answer business questions, aggregate large datasets, and perform complex queries |
| **Power BI / Excel** | To create interactive dashboards and track KPIs for stakeholders |
| **Matplotlib** | For exploratory data visualization before dashboarding |

---

## ❓ Why I Did This Project

As a data analyst, I wanted to solve real-world business problems:

- Hotels lose millions due to **cancellations** – I wanted to find why and how to reduce them
- Revenue teams need to know which **booking channels** perform best
- Marketing needs **guest insights** (country, meal preference, room type) for targeting
- Operations wants to know **long-stay properties** and room type popularity
- Data quality issues (missing values, inconsistent formats) needed fixing before analysis

**Goal:** Provide actionable insights to increase revenue and reduce cancellations.

---

## 🔄 Complete Workflow Pipeline

```

┌─────────────────┐
│  Raw CSV Data   │  (3,831 rows, messy formats, missing values)
└────────┬────────┘
▼
┌─────────────────┐
│  Python Cleaning│  → Fixed dates, filled nulls, removed duplicates
└────────┬────────┘
▼
┌─────────────────┐
│  SQL Analysis   │  → Revenue, cancellation, lead time, guest queries
└────────┬────────┘
▼
┌─────────────────┐
│  Power BI Dash  │  → KPIs, charts, interactive filters
└────────┬────────┘
▼
┌─────────────────┐
│  Insights & Doc │  → Business recommendations
└─────────────────┘

```

### Detailed Pipeline Steps:

| Step | Action | Tool | Why |
|------|--------|------|-----|
| 1 | Load CSV file | Pandas | Import raw data |
| 2 | Fix column names | Pandas | Remove unwanted characters |
| 3 | Remove duplicates | Pandas | Ensure data integrity |
| 4 | Handle missing values | Pandas | Mode for categories, median for numbers |
| 5 | Standardize dates | Pandas | Convert multiple formats to single format |
| 6 | Fix text casing | Pandas | Convert to Title Case for consistency |
| 7 | Change data types | Pandas | Convert children from float to int |
| 8 | Export cleaned data | Pandas | Save for SQL import |
| 9 | Create PostgreSQL table | SQL | Store data in database |
| 10 | Run business queries | SQL | Answer specific questions |
| 11 | Create visualizations | Power BI | Present insights to stakeholders |

---

## 📊 SQL Questions I Answered & Why

| # | SQL Question | Why This Matters |
|---|--------------|-------------------|
| 1 | Which hotel generated the highest revenue in 2022? | Identify top performing property for investment |
| 2 | Which booking channel has highest average lead time? | Know who plans early for targeted campaigns |
| 3 | What % of Booking.com bookings cancelled vs Direct Website? | Compare channel reliability and guest commitment |
| 4 | Which hotels have average nights_stayed > 8 days? | Identify long-stay properties for loyalty programs |
| 5 | What is average lead time for cancelled bookings? | Find if early planners cancel more (revenue at risk) |
| 6 | Which country generates highest revenue? | Target marketing spend on high-value countries |
| 7 | How do families in Suites spend vs families in Standard rooms? | Understand premium family booking behavior |
| 8 | Which bookings have revenue-ADR mismatch? | Find data errors or extreme discounts |

---

## 📈 What I Found – Key Insights

| Insight | Finding | Business Impact |
|---------|---------|-----------------|
| Top Revenue Channel | Travel Agent → MakeMyTrip → Direct Website | Invest more in Travel Agent partnerships |
| Highest Cancellation | Booking.com has highest cancellation rate | Offer incentives for direct booking |
| Popular Meal Plans | CP (11.91%) and Breakfast Only (10.46%) | Promote these plans, remove low-demand plans |
| Long-Stay Hotels | Resort and 5-Star properties have >8 night stays | Create loyalty programs for these properties |
| Family Spending | Families in Suites spend significantly more than Standard rooms | Upsell Suites to families with children |
| Top Guest Countries | UAE, India, USA, UK, Germany | Run country-specific campaigns |
| Cancellation Pattern | Cancelled bookings have higher lead time | Send reminders to early planners to reduce cancellations |

---

## ⚠️ Problems I Solved

| Problem | Solution |
|---------|----------|
| Missing meal_plan values | Filled with mode (most common plan) |
| Missing country_of_guest | Filled with mode (India) |
| Missing children values | Filled with median (0) |
| Missing special_requests | Filled with median (0) |
| Dates in 3 different formats | Used `pd.to_datetime(dayfirst=True)` |
| Duplicate rows | Used `drop_duplicates()` |
| Inconsistent casing (HotEL, hotel, HOTEL) | Used `.str.title()` |
| children as float (0.0, 1.0, 2.0) | Converted to `int` |
| Null arrival_date after conversion | Used forward fill `.ffill()` |
| Revenue vs ADR mismatch | Created SQL gap analysis query |

---

## 📁 Final Project Overview

```

# HOTEL_ANALYSIS Repository
│
├── DIRTY_05_hotel_bookings.csv      # Raw data (3,831 rows)
├── hotel_bookings.ipynb              # Python cleaning code
├── HOTEL_BOOKING ANALYSIS.sql        # All SQL queries (96 lines)
├── dashboard.pbix                    # Power BI dashboard
└── README.md                         # This file

```

### Key Numbers Summary:

| Metric | Value |
|--------|-------|
| Total Revenue | ₹242 Million+ |
| Total Bookings | 3,830 |
| Total ADR | ₹3830 (sum) |
| Average Nights Stayed | Calculated in analysis |
| Cancellation Rate | Calculated by channel |
| Top Hotel Type | 4-Star, Resort |
| Top Room Type | Family Room, Super Deluxe |

---

## ✅ What This Project Shows About My Skills

| Skill | How I Demonstrated It |
|-------|----------------------|
| **Data Cleaning** | Handled 385+ missing values, fixed dates, standardized text |
| **SQL** | Wrote 8+ business queries with aggregations, case statements, joins |
| **Problem Solving** | Identified revenue-ADR mismatches as data errors |
| **Business Thinking** | Connected each query to a business decision |
| **Visualization** | Created bar charts, maps, and KPI cards |
| **Documentation** | Wrote clear README for stakeholders and recruiters |

---

## 🚀 Business Recommendations

1. **Reduce cancellations** – Send confirmation emails to early planners (high lead time = high cancellation risk)
2. **Optimize channels** – Reduce dependency on Booking.com, promote Direct Website with discounts
3. **Upsell families** – Target family bookings with Suite upgrade offers
4. **Marketing spend** – Focus on UAE, India, USA, UK, Germany guests
5. **Meal plans** – Remove low-performing plans, highlight CP and Breakfast Only
6. **Data quality** – Fix ADR vs revenue mismatch in source system

---

## 👨‍💻 Author

**Manoj152004** – Aspiring Data Analyst  
This project demonstrates end-to-end data analysis skills for a real-world business problem.


*"Turning messy hotel data into actionable business insights"*
<img width="702" height="1600" alt="WhatsApp Image 2026-04-17 at 18 06 21" src="https://github.com/user-attachments/assets/b6c5ac06-2472-4743-9b62-37035fd081e3" />
<img width="702" height="1600" alt="WhatsApp Image 2026-04-17 at 18 06 20" src="https://github.com/user-attachments/assets/a2b190b8-b6d2-49b3-bbe2-cb42fe7caf36" />
<img width="702" height="1600" alt="WhatsApp Image 2026-04-17 at 18 06 20 (1)" src="https://github.com/user-attachments/assets/232075bc-35c7-4a68-9eb5-f16eb771e0f8" />
