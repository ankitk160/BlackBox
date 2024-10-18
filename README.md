**BlackBox** is a robust web application built on the **Spring MVC** framework, utilizing **JSTL** and **JSP pages** for dynamic content rendering. The application is fully API-driven and relies on **JSON RESTful APIs** to manage an affiliate tracking system, which includes key features such as handling **campaigns**, **operators**, **offers**, **smartlinks**, **reports**, and **Word document downloads**.

### Frontend
The UI is designed using a **Bootstrap template**, providing a sleek and responsive interface. It integrates several advanced **Bootstrap plugins** for enhanced functionality:
- **ApexCharts** for detailed graphical representations and visual data analysis.
- **DataTables** with support for pagination, Word/Excel export, and copy functionality.
- **Flatpickr** for intuitive date range selection.
- **Select2** for searchable, user-friendly dropdown menus.
- **jQuery Validation Plugin** to ensure robust form validations.
- **Lolibox notifications** are implemented to provide real-time alerts and success messages across the application.

### Backend and Security
On the backend, **Spring Security** is employed to handle API-based authentication and **token validation** for managing user sessions securely. The system enforces role-based access control with separate permissions for **admin** users and regular users (e.g., **user2**), ensuring that each user type has access to the appropriate features.

The project also implements a **ConcurrentMapCacheManager** for efficient caching, which enhances performance by storing frequently accessed data. A **GlobalExceptionHandler** class has been implemented to handle any errors or exceptions that may occur during runtime, ensuring smooth operation and detailed error reporting.

### Key Features
- **Affiliate tracking** with detailed management of campaigns, operators, offers, and smartlinks.
- **Graphical reports** using ApexCharts to visualize data.
- **Word document generation** and downloads, with integrated pagination and export options.
- **Spring Security** for user authentication and session management.
- **Advanced caching** using ConcurrentMapCacheManager for optimal performance.
- **Global exception handling** to ensure robustness in the face of errors.
- **Role-based authorization** for admins and regular users.
  
With its clean and modern interface, robust backend, and extensive use of cutting-edge plugins and APIs, **BlackBox** is a comprehensive solution for affiliate tracking and management.
