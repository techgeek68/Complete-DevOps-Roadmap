# Software Development Life Cycle

**What is SDLC?**
A systematic framework for planning, building, testing, deploying, and
maintaining software. It ensures the final product meets user requirements and
is free of defects.

**Key points**:

**Structured Process:**
→ Like following a recipe to bake a cake (ingredients = code, steps = phases).

**Quality Assurance:**
→ Ensures the software works as intended (e.g., a banking app must handle
transactions securely.

Example: Imagine building an e-commerce app:

- **Requirement**: The app should let people search for products, add them to
    a cart, and pay for them.
- **Design**: Sketch out how the app will look (UI) and plan how the product
    data will be stored (Database).
- **Coding**: Write the backend (using Python and Django) to handle things
    like products and orders. Use React to build the user interface.
- **Testing**: Make sure the payment system (like Coonect IPS, eSewa, or
    Khalti) works properly by testing different cases.
- **Deployment**: Put the app online using cloud services like AWS, Google
    Cloud or locally managed server.
- **Maintenance**: Fix problems, like when items in the cart disappear after
    logging out, and keep the app updated.


**Why SDLC?**

1. Helps with planning, scheduling, and estimating
    ◦ Breaks the project into phases with timelines
    ◦ Example:
       A team building a **Hospital Management System** might allocate two
       weeks for requirement gathering, four weeks for design, etc.
2. Defines standard steps for everyone to follow
    ◦ Everyone knows what to do next and how to do it.
    ◦ Example:
       All developers use **Git** to manage code versions and updates.
3. Tracks progress and keeps things under control
    ◦ Can be checked if the project is on time or falling behind.
    ◦ Example:
       A project manager checks if the login feature is finished before starting
       payment integration
4. Makes the plan clear to everyone involved
    ◦ Everyone - Clients, developers, testers – knows the progress.
    ◦ Example:
       Stakeholders of a banking app see updates after each completed phase.
5. Speeds up development
    ◦ Clear steps mean less confusion and faster work
   
```
Example:
A food delivery app finishes faster because everyone follows the
same steps.
```
6. Improves client communication and trust
    ◦ Clients see progress regularly and can give feedback.
    ◦ Example:
       Showing a prototype of a food delivery app to the client every two
       weeks.
7. Reduces risks and avoids problems later
    ◦ Early testing catches critical bugs
    ◦ Example:
       A flight booking system is tested for high traffic to avoid crashes when
       People book tickets.

**SDLC Phases
Phase 1: Requirement Collection**

- Responsible teams: Product Manager, Business Analysts
- Understand/Gather what users need/want.
- Example:
    For a fitness app, requirements may include tracking steps, heart rate, and syncing with wearable devices.
- Tools: Jira (for tracking tasks and user stories), Confluence (for
    documentation requirements, meeting notes, and product decisions)

**Phase 2: Feasibility Study**

- Check if the project is viable.


- Example:
    Can a startup build a smart home app? Factors: Cost (NPR
    1M+), legal regulations, and technical expertise.
**Phase 3: Design**
- Responsible team: System architects, UI/UX Designers
- Create blueprints for how the system will work and look.
- Example:
◦ Designing a **ride-sharing app** :
▪ Architecture: Microservices Architecture, with separate services
like User Service, Payment Service, Ride Matching Service, etc.

```
▪ UI/UX: Mockups or wireframes for core user flows – booking a
ride, viewing driver location, and tracking ride progress.
```
**Phase 4: Coding**

- Responsible team: Developers (Backend & Frontend)
- Translate designs and requirements into working software by writing
    code.
- Example:
    ◦ Backend: Python (e.g., using Flask or Django) to create RESTful APIs
    ◦ Frontend: React.js for building a responsive and interactive user interface
       interface
    ◦ Database: SQL (PostgreSQL or MySQL) for database and retrieval

**Phase 5: Testing**

- Responsible team: QA, Testers


- Ensure the software works correctly, reliably, and meets user
    expectations.
- Types:
    ◦ Unit Testing: Check individual components or functions in isolation.
       - Example:
          Verifying a login function returns correct results for
          valid/invalid credentials.

```
◦ Integration Testing: Test how different modules work together
```
- Example:
    Ensuring the payment gateway correctly processes
    transactions from the shopping cart.

```
◦ User Acceptance Testing (UAT): Real users test the application to
Confirm it meets their needs
```
- Example:
    Beta testing a game app before public release.
- **Tools** :
◦ Selenium
Automates browser-based tests for web apps.
◦ Postman
Used to test APIs by sending HTTP requests and verifying
responses.

**Phase 6: Deployment**

- Responsible team: System Administrators, DevOps engineers


- Release the application to a production environment where users can
    access it.
- Example:
    ◦ Deploying a **weather app** to the App Store/Google Play with CI/CD
       pipelines (e.g., GitHub Actions) to automate build, test, and release
       processes.

**Phase 7: Maintenance**

- Responsible team: Support engineers, Maintenance team
- Keep the software up-to-date, reliable, and aligned with user needs over
    time.
- Types:
    ◦ Corrective: Fix bugs or defects.
       - Example: Resolving an app crash issue on iOS 15
    ◦ Adaptive: Modify software to work with changes in the environment.
       - Example: Updating compatibility for Android 14

```
◦ Perfective: Improve performance or enhance features.
```
- Example: Adding dark mode based on user feedback

**Traditional SDLC Models
I. Waterfall Model:**
◦ A simple, linear, and sequential development process
◦ Follows a top-down approach
◦ Each phase must be fully completed before moving to the next
◦ Begins with long planning and design phases
◦ After development, the software is tested and then deployed


```
◦ Each phase is reviewed upon completion to check progress and
feasibility
◦ Too rigid to adapt to changes, one development starts
◦ Does not support feedback or changes during the process
◦ This inflexibility led to the rise of more adaptive models like Agile
```
```
II. Agile Model:
◦ Focuses on iterative and incremental development
◦ The application is initially released with high-priority features in the
first iteration
◦ After release, end-user/customer feedback is collected
◦ Feedback is used to make improvements and add new features. The
updated application is released in the next iteration
◦ This cycle repeats until the desired software quality is achieved
◦ Encourages continuous interaction between development and testing
teams
◦ The entire project is broken into small, manageable builds
◦ Each build is delivered in iterations, typically lasting 1 to 3 weeks
```
**Examples:**
🚿 **Waterfall Model – E-commerce Website**

1. **Requirements Gathering & Analysis**
    - **Teams:** Business Analysts + Product Owners + Stakeholders
    - **Activities:**
       - Conduct user interviews (e.g., what filters shoppers need).
       - Benchmark competitors (e.g,. Daraz, local retailers).


- Produce a **Software Requirements Specification (SRS)**
    covering:
       - User registration/login
       - Product catalog and filtering
       - Shopping cart and checkout
       - Payment methods (cards, wallets)
       - Order history and tracking
- Finalize scope and sign off.
- **Timeline:** 3 weeks
- **Deliverables:** Approved SRS, project plan, stakeholder sign-off
2. **System & UI Design**
- **Teams:** System Architects + UI/UX Designers + Database
Designers
- **Activities:**
- Define architecture: n-tier web architecture, tech stack (e.g.
React frontend, Node.js backend, PostgreSQL).
- Design Entity Relationship(ER) diagram for products, users,
orders, payments.
- Create wireframes (Basic sketches or layouts of a web/app)
and high-fidelity mockups (detailed design of pages, e.g.
adding colours, logos, images) for key pages.
- Specify non-functional requirements: scalability (e.g., auto-
scaling), security (PCI DSS compliance), performance (page
load ≤ 2 seconds).
Note: PCI DSS- Payment Card Industry Data Security Standard
- **Timeline:** 4 weeks
- **Deliverables:**
- Architectural design document


- Database schema
- UI mockups + style guide
- API specification
3. **Implementation (Coding)**
- **Teams:** Frontend Engineers + Backend Engineers + API
Developers
- **Activities:**
- Set up code repositories, CI pipelines.
- Frontend: build components (product grid, filter sidebar, cart
modal).
- Backend: implement REST APIs (products, cart, orders,
payments).
- Integrate payment gateway.
- Write unit tests (aiming for ≥ 70 % coverage).
- **Timeline:** 10 weeks
- **Deliverables:**
- Functioning codebase in dev environment
- Unit-test reports
- Continuous integration build passing
4. **Integration & System Testing**
- **Teams:** QA Engineers + Test Automation Engineers
- **Activities:**
- Develop test plans and test cases (functional, regression,
security).
- Execute manual tests (e.g., checkout flow, edge cases like out-
of-stock).


- Run automated suites (e.g., Selenium for UI flows, Postman
    for APIs).
- Log defects; developers fix bugs in a separate “bugfix” cycle.
- Perform load testing (e.g,. simulate 1,000 concurrent users).
- **Timeline:** 4 weeks
- **Deliverables:**
- Test reports (bug counts, severity)
- Signed-off release candidate build
5. **Deployment & Maintenance**
- **Teams:** DevOps Engineers + System Administrators + Support
Engineers
- **Activities:**
- Provision production environment (IaC with Terraform).
- Configure CI/CD pipeline to deploy to staging, then
production.
- Conduct smoke tests post-deploy.
- Provide user documentation and train support staff.
- Monitor live metrics (uptime, response times) and resolve
incidents (SLAs: 1 hr for critical).
- **Timeline:**
- Deployment: 1 week
- Maintenance: ongoing
- **Deliverables:** Live site, runbooks, support logs

🔍 **Feedback & Change Control:**

- **When:** At phase-gate reviews (end of each phase) or post-launch


- **How:** Formal Change Request (CCR) process; each request is impact-
    assessed (time, cost)
- **Effect:** Late changes (e.g., “add wishlist”) go to future maintenance
    release (costly to retrofit)

**Challenges:**

- **Inflexibility:** Hard to pivot if market or requirements change mid-project
- **Risk of Late Discovery:** Usability issues or missing features only surface
    at Testing or after launch
- **High Rework Cost:** Even minor scope changes can require revisiting
    multiple phases

```
Agile Model – E-commerce Website
```
1. **Initial Backlog & Architecture Spike (Sprint 0)**
    - **Teams:** Cross-functional Scrum Team (Developers, QA, DevOps,
       UX) + Product Owner + Scrum Master
    - **Activities:**
       - Product Owner writes **user stories** (e.g., “As a shopper, I want
          to filter products by size so I can find items that fit”).
       - Team estimates stories (story points) and sets up basic
          architecture (CI/CD, dev/test environments).
       - Create a minimal “Definition of Done” and quality checklist.
    - **Timeline:** 2 weeks
    - **Deliverables:** Initial product backlog, architecture skeleton,
       environments ready
2. **Sprint Cycle (2-Week Iterations)**
    - **Sprint Planning (4 hrs):**


- Team selects highest-priority stories (e.g. login & product
    listing).
- Breaks stories into tasks (frontend, backend, test tasks).
- **Development & Testing (10 business days):**
- Pair programming & test-driven development.
- Continuous integration runs on every push; immediate
feedback on build/test status.
- **Daily Stand-up (15 min):** Synchronize progress and remove
blockers.
- **Sprint Review (2 hrs):**
- Demo working increment to stakeholders (e.g., live product
grid with pagination).
- Collect feedback (e.g,. request “infinite scroll” instead of
pagination).
- **Sprint Retrospective (1 hr):**
- Discuss what went well (CI speed, collaboration) and what to
improve (estimation accuracy).
- Agree on one or two process improvements for the next
sprint.
3. **Example Sprint Breakdown (First 3 Sprints)**
Sprin
The Core Stories Delivered Key Feedback & Updates
1 User login/logout, basic product catalog “Add social login (Google/Facebook)” → backlog

```
2 Shopping cart add/remove, product search + filtering “Enable coupon codes at checkout” → backlog
```
```
3 Checkout flow, integration with Stripe, order history UI tweak: show order confirmation email link
```

4. **Continuous Delivery & Adaptation**
    - At the end of each sprint, a **potentially shippable** product
       Increment is ready for real-user testing (feature toggled off until
       fully polished).
    - New high-value stories (e.g., “Wishlist,” “Live Chat Support”) can
       be added anytime to the product backlog and prioritized for the next
       sprint.
5. **Deployment & Operations**
    - Small, frequent releases (canary deploys) after every 2–3 sprints.
    - DevOps monitors metrics and rolls back immediately on critical
       issues.
    - Support team triages user tickets; high-priority fixes go into the
       sprint backlog.
🔍 **Feedback & Change Handling**
- **When:** After every Sprint Review (every 2 weeks)
- **How:** Stakeholder feedback is directly fed into the backlog; no formal
Change the board needed
- **Effect:** High-priority changes can appear in the next sprint, keeping the
product aligned with evolving needs

**Benefits & Challenges**
- **Benefits:**
- Rapid value delivery (first basic shopping in 2 weeks).
- High adaptability to new market demands (e.g., seasonal
promotions).
- Early detection of usability issues.
- **Challenges:**
- Requires strong team discipline to avoid scope creep.
- Demands continuous stakeholder engagement.


- Needs robust automation (CI/CD, test suites) to maintain quality.

**Which to Choose?**

- **Waterfall** if your requirements are stable, budget/funding is fixed, and
    you need heavy documentation (e.g., compliance projects).
- **Agile** if you expect changing requirements, need fast time-to-market, and
    can engage stakeholders continuously.


