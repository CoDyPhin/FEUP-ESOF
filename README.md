# openCX-*t2g5-5headers* Development Report

Welcome to the documentation pages of the ConfMate of **openCX**!

You can find here detailed about the ConfMate hereby mentioned as module, from a high-level vision to low-level implementation decisions, a kind of Software Development Report (see [template](https://github.com/softeng-feup/open-cx/blob/master/docs/templates/Development-Report.md)), organized by discipline (as of RUP):

- Business modeling
  - [Product Vision](https://github.com/open-cx/open-cx/blob/master/docs/templates/Development-Report.md#Product-Vision)
  - [Elevator Pitch](https://github.com/open-cx/open-cx/blob/master/docs/templates/Development-Report.md#Elevator-Pitch)
- Requirements
  - [Use Case Diagram](https://github.com/open-cx/open-cx/blob/master/docs/templates/Development-Report.md#Use-case-diagram)
  - [User stories](https://github.com/open-cx/open-cx/blob/master/docs/templates/Development-Report.md#User-stories)
  - [Domain model](https://github.com/open-cx/open-cx/blob/master/docs/templates/Development-Report.md#Domain-model)
- Architecture and Design
  - [Logical architecture](https://github.com/open-cx/open-cx/blob/master/docs/templates/Development-Report.md#Logical-architecture)
  - [Physical architecture](https://github.com/open-cx/open-cx/blob/master/docs/templates/Development-Report.md#Physical-architecture)
  - [Prototype](https://github.com/open-cx/open-cx/blob/master/docs/templates/Development-Report.md#Prototype)
- [Implementation](https://github.com/open-cx/open-cx/blob/master/docs/templates/Development-Report.md#Implementation)
- [Test](https://github.com/open-cx/open-cx/blob/master/docs/templates/Development-Report.md#Test)
- [Configuration and change management](https://github.com/open-cx/open-cx/blob/master/docs/templates/Development-Report.md#Configuration-and-change-management)
- [Project management](https://github.com/open-cx/open-cx/blob/master/docs/templates/Development-Report.md#Project-management)

So far, contributions are exclusively made by the initial team, but we hope to open them to the community, in all areas and topics: requirements, technologies, development, experimentation, testing, etc.

Please contact us!

Thank you!

Carlos Lousada

José David Rocha

Tiago Marques

Tomás Mendes

------

## Product Vision

ConfMate is an app designed to redefine giveaways on conferences. Instead of relying on luck, we allow conference hosts to select who they want to give/sell the products to, based on requeriments they set.

------

## Elevator Pitch



------

## Requirements

### Use case diagram

![Use case diagram](./docs/img/usecase.png)
---

### User Stories

#### **Story #1**

As a host I want to be able to promote and recommend products I find relevant to the conference.

_User interface mockups_
![Mockup 1](./docs/img/mockup1.png)
![Mockup 2](./docs/img/mockup2.png)
_Acceptance Tests_

```gherkin
Scenario: Promoting/recommending products on the conference
	Given that I wish to promote/recommend a certain product I find relevant
	When I tap the "Add Products" button
	Then the app starts displaying the selected product on the conference's forum
```

_Value/Effort_

Value: Must have

Effort: XL

---

#### **Story #2**

As a host I want to be able to choose which attendees I wish to giveaway the products to.

_User interface mockups_
![Mockup 3](./docs/img/mockup3.png)
_Acceptance Tests_

```gherkin
Scenario: Choosing which attendees should receive the products
	Given that I wish to choose which attendees should receive the products
	When I tap the "Choose Attendees" button
	Then I will able be to pick between the candidates who I want to give the products to
```

_Value/Effort_

Value: Must have

Effort: XL

---
#### **Story #3**

As an attendee I want to be able to apply for products.

_User interface mockups_
![Mockup 4](./docs/img/mockup4.png)
_Acceptance Tests_

```gherkin
Scenario: Applying a product related to a certain conference
	Given that I wish to apply for a promoted producted
	When I tap the "Apply for" button
	Then I will able be to the possible candidates capable of receiving the selected product
```

_Value/Effort_

Value: Must have

Effort: XL

---
#### **Story #4**

As a host I want to be able to book a room to host my conference.

_User interface mockups_
![Mockup 5](./docs/img/mockup5.png)
_Acceptance Tests_
```gherkin
Scenario: Booking a room to host a conference
	Given that I wish to book a room to host my conference
	When I click "Book Room"
	Then the app shows me the available rooms 
	When I tap the "Choose Room" button
	Then the app books the selected room
    When I tap the "Create Talk" button
	Then the system creates the conference and displays it on the "All Talks" menu
```
_Value/Effort_

Value: Must Have

Effort: XL

---
#### **Story #5**

As an attendee I want to be able to book a seat for conferences that I wish to attend.

_User interface mockups_
![Mockup 6](./docs/img/mockup6.png)
_Acceptance Tests_
```gherkin
Scenario: Booking a seat for a conference
	Given I want to book a seat for a certain conference
	When I click the "Book conference seat" button
	Then the app shows me the available seats
	When I click the "Select Seat"
	Then the app books the seat for the selected conference
```
_Value/Effort_

Value: Must Have

Effort: XL

---
## Architecture and Design

The architecture of a software system encompasses the set of key decisions about its overall organization.

A well written architecture document is brief but reduces the amount of time it takes new programmers to a project to understand the code to feel able to make modifications and enhancements.

To document the architecture requires describing the decomposition of the system in their parts (high-level components) and the key behaviors and collaborations between them.

In this section you should start by briefly describing the overall components of the project and their interrelations. You should also describe how you solved typical problems you may have encountered, pointing to well-known architectural and design patterns, if applicable.

### Logical architecture

The purpose of this subsection is to document the high-level logical structure of the code, using a UML diagram with logical packages, without the worry of allocating to components, processes or machines.

It can be beneficial to present the system both in a horizontal or vertical decomposition:

- horizontal decomposition may define layers and implementation concepts, such as the user interface, business logic and concepts;
- vertical decomposition can define a hierarchy of subsystems that cover all layers of implementation.

### Physical architecture

The goal of this subsection is to document the high-level physical structure of the software system (machines, connections, software components installed, and their dependencies) using UML deployment diagrams or component diagrams (separate or integrated), showing the physical structure of the system.

It should describe also the technologies considered and justify the selections made. Examples of technologies relevant for openCX are, for example, frameworks for mobile applications (Flutter vs ReactNative vs ...), languages to program with microbit, and communication with things (beacons, sensors, etc.).

### Prototype

To help on validating all the architectural, design and technological decisions made, we usually implement a vertical prototype, a thin vertical slice of the system.

In this subsection please describe in more detail which, and how, user(s) story(ies) were implemented.

------

## Implementation

Regular product increments are a good practice of product management.

While not necessary, sometimes it might be useful to explain a few aspects of the code that have the greatest potential to confuse software engineers about how it works. Since the code should speak by itself, try to keep this section as short and simple as possible.

Use cross-links to the code repository and only embed real fragments of code when strictly needed, since they tend to become outdated very soon.

------

## Test

There are several ways of documenting testing activities, and quality assurance in general, being the most common: a strategy, a plan, test case specifications, and test checklists.

In this section it is only expected to include the following:

- test plan describing the list of features to be tested and the testing methods and tools;
- test case specifications to verify the functionalities, using unit tests and acceptance tests.

A good practice is to simplify this, avoiding repetitions, and automating the testing actions as much as possible.

------

## Configuration and change management

Configuration and change management are key activities to control change to, and maintain the integrity of, a project’s artifacts (code, models, documents).

For the purpose of ESOF, we will use a very simple approach, just to manage feature requests, bug fixes, and improvements, using GitHub issues and following the [GitHub flow](https://guides.github.com/introduction/flow/).

------

## Project management

Software project management is an art and science of planning and leading software projects, in which software projects are planned, implemented, monitored and controlled.

In the context of ESOF, we expect that each team adopts a project management tool capable of registering tasks, assign tasks to people, add estimations to tasks, monitor tasks progress, and therefore being able to track their projects.

Example of tools to do this are:

- [Trello.com](https://trello.com/)
- [Github Projects](https://github.com/features/project-management/com)
- [Pivotal Tracker](https://www.pivotaltracker.com/)
- [Jira](https://www.atlassian.com/software/jira)

We recommend to use the simplest tool that can possibly work for the team.

------

## Evolution - contributions to open-cx

Describe your contribution to open-cx (iteration 5), linking to the appropriate pull requests, issues, documentation.

<details class="details-reset details-overlay details-overlay-dark" id="jumpto-line-details-dialog" style="box-sizing: border-box; display: block;"><summary data-hotkey="l" aria-label="Jump to line" role="button" style="box-sizing: border-box; display: list-item; cursor: pointer; list-style: none;"></summary></details>



- © 2020 GitHub, Inc.
- [Terms](https://github.com/site/terms)
- [Privacy](https://github.com/site/privacy)
- Cookie Preferences
- [Security](https://github.com/security)
- [Status](https://githubstatus.com/)
- [Help](https://docs.github.com/)
- [Contact GitHub](https://github.com/contact)
- [Pricing](https://github.com/pricing)
- [API](https://docs.github.com/)
- [Training](https://services.github.com/)
- [Blog](https://github.blog/)
- [About](
