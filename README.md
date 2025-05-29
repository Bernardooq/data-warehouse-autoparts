# Warehouse Recommendation System Project

This repository contains the two-phase Data Warehousing project developed by Juan Bernardo Orozco Quirarte and Luis Daniel Arellano Núñez for the course *Data Warehouses (Almacenes de Datos)* under the guidance of Dr. Víctor Ortega. The project is focused on inventory analysis and recommendation systems in an auto parts warehouse context.

---

## Project Structure

### Phase 1 – Dimensional Modeling & ETL
- Constructed a data warehouse using a star schema and constellation of fact and dimension tables.
- Implemented ETL processes to extract, clean, and load data from an OLTP database to the data warehouse.
- Built analytical dashboards in Power BI to analyze:
  - Entry and exit trends
  - Supplier behavior
  - Sales and inventory performance
- SQL and MDX scripts included for data population and OLAP cube creation.

### Phase 2 – Graph-Based Product Recommendations
- Transformed the dimensional model into a graph-based model using **Neo4j**.
- Used **KNIME** to develop ETL flows and generate CSVs for graph loading.
- Modeled relationships between invoices, entries, exits, customers, and products.
- Developed Cypher queries to generate **product recommendations**:
  - Based on co-occurrence in entries/exits
  - Filtered by article type, class, and group
- Exported recommendation results back to the data warehouse for integration.
- Visualized recommendations using **Power BI dashboards**.

---

## Tools & Technologies

- **KNIME**: For ETL processes and CSV generation
- **Neo4j**: For graph modeling and recommendation logic (Cypher queries)
- **SQL Server**: For dimensional model and data warehouse
- **Power BI**: For dashboards and data visualization
- **Cypher & SQL**: For querying and data transformation

---

## Key Features

- Hybrid data integration: Relational + Graph DB
- Recommender systems based on article relationships in warehouse operations
- Analytical dashboards with KPI tracking
- Real-world insights into inventory dynamics and supply chain patterns

---

## Files

- `ProyectoAlmacenes.pdf`: Documentation for Phase 1 (Dimensional Modeling)
- `DWFase2.pdf`: Documentation for Phase 2 (Graph Modeling & Recommendations)
- `/cypher-scripts/`: Folder for Neo4j Cypher scripts
- `/etl-knime/`: KNIME workflows
- `/powerbi/`: Power BI dashboards (screenshots or `.pbix` files)
- `/sql/`: SQL scripts for schema and data population


## License
This project is part of a university course and is shared for educational purposes only.
